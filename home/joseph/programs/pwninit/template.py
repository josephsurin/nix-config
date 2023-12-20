from pwn import *

"""
"""

context.log_level = 'debug'
if os.getenv('RUNNING_IN_DOCKER'):
    context.terminal = ['/usr/bin/tmux', 'splitw', '-h', '-p', '75']
else:
    gdb.binary = lambda: 'gef'
    context.terminal = ['alacritty', '-e', 'zsh', '-c']

sla = lambda r, s: conn.sendlineafter(r, s)
sl = lambda s: conn.sendline(s)
sa = lambda r, s: conn.sendafter(s)
ru = lambda r, **kwargs: conn.recvuntil(r, **kwargs)
rl = lambda : conn.recvline()

{bindings}

conn = process({proc_args})


gdb.attach(conn)
conn.interactive()
