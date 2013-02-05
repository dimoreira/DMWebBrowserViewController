//
//  DMWebBrowserViewController.h
//  DMWebBrowser
//
//  Created by Diego Alves Moreira on 2/4/13.
//  Copyright (c) 2013 Diego Alves Moreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DMWebBrowserViewController : UIViewController
<UIWebViewDelegate>
{
    UINavigationBar *_navBar;
    UIWebView *_webView;
    UIToolbar *_toolbar;
    NSURL *_urlAddress;
    UIColor *barColor;
    
    void (^_startBlock)(void);
    void (^_endBlock)(void);
}

- (id)initWithURL:(NSURL *)anURLAddress startLoadingWithBlock:(void (^)(void))startBlock andEndLoadingWithBlock:(void (^)(void))endBlock;
- (void)setNavBarColor:(UIColor *)color;

@end
