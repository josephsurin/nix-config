# TODO: allow host/port/timeout to be configured (e.g. via env var)

set +e

IDLE_TIMEOUT=180
PULSETIME=$((IDLE_TIMEOUT+1))

# ensure the bucket exists
curl \
    --silent \
    --fail \
    --output /dev/null \
    --data "{\"hostname\": \"$(hostname)\", \"type\": \"afkstatus\", \"client\": \"aw-watcher-hyprland\"}" \
    --header "Content-Type: application/json" \
    --request POST "localhost:5600/api/0/buckets/aw-watcher-afk_$(hostname)"

while true; do
    st=$(timeout $PULSETIME wayidle --timeout=$IDLE_TIMEOUT echo "asdf")
    st=$([[ -z $st ]] && echo "not-afk" || echo "afk")
    duration=$PULSETIME
    if [[ $st == "afk" ]]; then
        duration=$IDLE_TIMEOUT
    fi
    post_data="$(printf '{"duration":%d,"timestamp":"%s","data":{"status":"%s"}}' "$duration" "$(date -u --iso-8601=s)" "$st")"

    echo "$post_data"

    res=$(curl \
        --silent \
        --fail \
        --write-out "%{http_code}" \
        --output /dev/null \
        --data "$post_data" \
        --header "Content-Type: application/json" \
        --request POST "localhost:5600/api/0/buckets/aw-watcher-afk_$(hostname)/heartbeat?pulsetime=$PULSETIME")

    echo "API resp code: $res"
done
