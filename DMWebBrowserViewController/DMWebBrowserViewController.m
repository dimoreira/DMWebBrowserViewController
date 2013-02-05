//
//  DMWebBrowserViewController.m
//  DMWebBrowser
//
//  Created by Diego Alves Moreira on 2/4/13.
//  Copyright (c) 2013 Diego Alves Moreira. All rights reserved.
//

#import "DMWebBrowserViewController.h"

@implementation DMWebBrowserViewController

- (id)initWithURL:(NSURL *)anURLAddress startLoadingWithBlock:(void (^)(void))startBlock andEndLoadingWithBlock:(void (^)(void))endBlock
{
    if (self == [super init])
    {
        _startBlock = startBlock;
        _endBlock = endBlock;
        _urlAddress = anURLAddress;
        
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
            self.modalPresentationStyle = UIModalPresentationPageSheet;
        else
            self.modalPresentationStyle = UIModalPresentationFullScreen;
        
        self.view.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    
    return self;
}

- (void)loadView
{
    [super loadView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Loads an UINavigationBar at top
    _navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, 44.0f)];
    _navBar.barStyle = UIBarStyleBlackOpaque;
    _navBar.tintColor = [UIColor grayColor];
    
    // Loads an UIBarButtonItem (Cancel) on UINavigationBar
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelWebBrowser)];
    UIBarButtonItem *refreshButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshWebBrowser)];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:[NSString stringWithFormat:@"%@", _urlAddress]];
    [navItem setLeftBarButtonItem:barButtonItem];
    [navItem setRightBarButtonItem:refreshButtonItem];
    [_navBar setItems:[NSArray arrayWithObject:navItem]];
    [self.view addSubview:_navBar];
    
    // Loads the UIWebView
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, _navBar.frame.size.height, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    _webView.backgroundColor = [UIColor lightGrayColor];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.delegate = self;
    _webView.scalesPageToFit = YES;
    [self.view addSubview:_webView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:_urlAddress];
    [_webView loadRequest:request];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self updateViews];
}

- (void)updateViews
{   
    _navBar.frame = CGRectMake(0.0,
                               0.0,
                               [UIScreen mainScreen].bounds.size.width,
                               44.0f);
    
    _webView.frame = CGRectMake(0.0,
                                _navBar.frame.size.height,
                                [UIScreen mainScreen].bounds.size.width,
                                [UIScreen mainScreen].bounds.size.height);
}

#pragma mark - Orientation Changes

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self updateViews];
}

#pragma mark - DMWebBrowserViewController Methods

- (void)setNavBarColor:(UIColor *)color
{
    _navBar.tintColor = color;
}

- (void)cancelWebBrowser
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)refreshWebBrowser
{
    [_webView reload];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    _startBlock();
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    _endBlock();
}

@end
