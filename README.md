# Security-Bypass
PoC for Little Flocker window bypass (same concept also working on Little Snitch, BlockBlock etc).

Description: This PoC run an external program and detect when Little Flocker window appear then it automatically click on the "Allow" button by calculating the distance (so it works pretty well on every resolution). The LF window only appear for a fraction of second.

Usage: ./Security-Bypass-Binary [command] [args...]

Example: ./Security-Bypass-Binary /bin/cat /Users/Sabri/Desktop/topsecret.txt

Disclaimer: Code is dirty and I know it

**This PoC has been made for Little Flocker but with minor modifications it can also works with Little Snitch** *(Even with GUI scripting disabled)***, BlockBlock and many more!**

**Vulnerable version of Little Flocker: <= 1.3.0 (latest)**

**Vulnerable version of Little Snitch: <= 3.7.1 (latest)**

**Vulnerable version of BlockBlock: <= 0.9.4 (latest)**

![https://github.com/pwnsdx/Security-Bypass/raw/master/demo.gif](https://github.com/pwnsdx/Security-Bypass/raw/master/demo.gif)

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
