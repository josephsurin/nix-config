from pwn import *

"""
"""

context.log_level = 'debug'
if os.getenv('RUNNING_IN_DOCKER'):
    context.terminal = ['/usr/bin/tmux', 'splitw', '-h', '-p', '75']
else:
    gdb.binary = lambda: 'gef'
    context.terminal = ['alacritty', '-e', 'zsh', '-c']

{bindings}

conn = process({proc_args})


gdb.attach(conn)
conn.interactive()
