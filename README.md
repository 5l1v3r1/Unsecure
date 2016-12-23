# Security-Bypass
PoC for Little Flocker (and probably Little Snitch, BlockBlock) window bypass.

Description: This PoC run an external program and detect when Little Flocker window appear then it automtically click on the "Allow" button by calculating the distance (so it works pretty well on every resolutions). The LF window only appear for a fraction of second.

Usage: ./Security-Bypass-Binary [command] [args...]

Example: ./Security-Bypass-Binary /bin/cat /Users/Sabri/Desktop/topsecret.txt

**Vulnerable version of Little Flocker: <= 1.3.0**

![https://github.com/pwnsdx/Security-Bypass/raw/master/demo.gif](https://github.com/pwnsdx/Security-Bypass/raw/master/demo.gif)
