//
//  ViewController.m
//  DMWebBrowser
//
//  Created by Diego Alves Moreira on 2/4/13.
//  Copyright (c) 2013 Diego Alves Moreira. All rights reserved.
//

#import "ViewController.h"
#import "DMWebBrowserViewController.h"

@implementation ViewController

- (id)init
{
    if (self == [super init])
    {
        self.view.frame = CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.view.backgroundColor = [UIColor darkGrayColor];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    botao.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width / 1.2, [UIScreen mainScreen].bounds.size.height / 1.2);
    botao.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    botao.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [botao setTitle:@"Open Web Browser" forState:UIControlStateNormal];
    [botao addTarget:self action:@selector(openWebBrowser) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:botao];
}

- (void)openWebBrowser
{
    DMWebBrowserViewController *webBrowser = [[DMWebBrowserViewController alloc]
                                              initWithURL:[NSURL URLWithString:@"http://github.com/dimoreira"]
                                              startLoadingWithBlock:^{
                                                  NSLog(@"start loading web browser page");
                                              } andEndLoadingWithBlock:^{
                                                  NSLog(@"end loading web browser page");
                                              }];
    [webBrowser setNavBarColor:[UIColor orangeColor]];
    
    [self presentViewController:webBrowser animated:YES completion:nil];
}

@end
