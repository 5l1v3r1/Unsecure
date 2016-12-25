# Unsecure

Bypass alerts of Little Flocker / Little Snitch / HandsOff! / BlockBlock (same concept can be applied to other security tools).

Description: This PoC is using a simple yet powerful trick to detect when Little Flocker, Little Snitch, HandsOff! or BlockBlock window appear then automatically click on the "Allow" button by calculating the distance (so it works pretty well on every resolution). The window only appear for a fraction of second.

To use it, just run ./Unsecure-Release then do what you want!

[Go to download page](https://github.com/pwnsdx/Unsecure/releases)

**This PoC works against Little Flocker, Little Snitch** *(Even with GUI scripting disabled)* **, HandsOff! and BlockBlock. It's easy to implement new detection mechanism!**

**Vulnerable version of Little Snitch: <= 3.7.1 (latest)**

**Vulnerable version of HandsOff!: <= 3.1.3 (latest)**

**Vulnerable version of BlockBlock: <= 0.9.4 (latest)**

**Vulnerable version of Little Flocker: <= 1.3.0**

*(Note: macOS already have built-in mitigation (see https://twitter.com/pwnsdx/status/812653042898243584) for this kind of attack but are not yet implemented by these security softwares)*

#### Timeline

25 Dec: Little Flocker author (@JZdziarski) fixed the issue for both privileged and unprivileged users regarding mouse events and only unprivileged keyboard events (unfortunately he was unable to fix root keyboard events), see https://www.zdziarski.com/littleflocker/CHANGELOG. He also added TouchBar support "only" to Deny/Allow which is immune to this attack.

23 Dec: This repository is made public

#### Demo

![https://github.com/pwnsdx/Unsecure/raw/master/demo.gif](https://github.com/pwnsdx/Unsecure/raw/master/demo3.gif)

#### License

```
The MIT License (MIT)

Copyright (c) 2016 Sabri Haddouche <https://pwnsdx.pw/>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
