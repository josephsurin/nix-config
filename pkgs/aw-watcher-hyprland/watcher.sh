# TODO: allow host/port to be configured (e.g. via env var)

set +e

DURATION=5
PULSETIME=$((DURATION+1))
USE_GENERIC_TITLE=("Alacritty" "firefox" "Chromium-browser")

# ensure the bucket exists
curl \
    --silent \
    --fail \
    --output /dev/null \
    --data "{\"hostname\": \"$(hostname)\", \"type\": \"currentwindow\", \"client\": \"aw-watcher-hyprland\"}" \
    --header "Content-Type: application/json" \
    --request POST "localhost:5600/api/0/buckets/aw-watcher-hyprland_$(hostname)"

while true; do
    data=$(hyprctl clients -j | jq '.[] | select(.focusHistoryID == 0)')

    app=$(echo "$data" | jq -r '.class')
    title=$(echo "$data" | jq -r '.title')
    title=$([[ ${USE_GENERIC_TITLE[*]} =~ $app ]] && echo "$app" || echo "$title")

    post_data="$(printf '{"duration":%d,"timestamp":"%s","data":{"app":"%s","title":"%s"}}' "$DURATION" "$(date -u --iso-8601=s)" "${app//\"/\\\"}" "${title//\"/\\\"}")"

    echo "$post_data"

    res=$(curl \
        --silent \
        --fail \
        --write-out "%{http_code}" \
        --output /dev/null \
        --data "$post_data" \
        --header "Content-Type: application/json" \
        --request POST "localhost:5600/api/0/buckets/aw-watcher-hyprland_$(hostname)/heartbeat?pulsetime=$PULSETIME")

    echo "API resp code: $res"
    sleep $DURATION
done
