# Unsecure

PoC that bypass alerts of Little Flocker / Little Snitch / BlockBlock (same concept can be applied to other security tools).

Description: This PoC detect when Little Flocker, Little Snitch or BlockBlock window appear then it automatically click on the "Allow" button by calculating the distance (so it works pretty well on every resolution). The window only appear for a fraction of second.

To use it, just run ./Unsecure-Binary-Release then do what you want!

**This PoC works against Little Flocker, Little Snitch** *(Even with GUI scripting disabled)* **and BlockBlock. It's easy to implement new detection mechanism!**

**Vulnerable version of macOS: <= 10.12.2 (latest)**

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
