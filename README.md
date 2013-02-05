# DMWebBrowserViewController

===========================

A simple web browser view controller instantiated view blocks.
Uses a UINavigationBar for dismiss and refresh actions.

Try out the demo project

## Simple Usage:

- copy the `DMWebBrowserViewController.h and .m` files to your project
- import `DMWebBrowserViewController.h` into your class
- create a `DMWebBrowserViewController` object using the initializer `initWithURL:startLoadingWithBlock:andEndLoadingWithBlock:`
- add your actions to block areas

``` objective-c
DMWebBrowserViewController *webBrowser = [[DMWebBrowserViewController alloc]
		initWithURL:[NSURL URLWithString:@"http://github.com/dimoreira"]
      startLoadingWithBlock:^{
          NSLog(@"start loading web browser page");
   } andEndLoadingWithBlock:^{
          NSLog(@"end loading web browser page");
}];
```

- you can use a optional method for set the color of the UINavigationBar

``` objective-c
[webBrowser setNavBarColor:[UIColor orangeColor]];
```

# License

Copyright (c) 2008-2012 Sam Soffes

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
