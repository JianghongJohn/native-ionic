/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

//
//  MainViewController.h
//  掌上行车
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright ___ORGANIZATIONNAME___ ___YEAR___. All rights reserved.
//

#import "MainViewController.h"
#import "CarFinanceMainController.h"
#import "Root_ServiceMainController.h"
#import "RootNavController.h"
#import "SVCalculatePriceController.h"
@implementation MainViewController

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[MainCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[MainCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[MainCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[MainCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    // View defaults to full size.  If you want to customize the view's size, or its subviews (e.g. webView),
    // you can do so here.

    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    [[NSNotificationCenter defaultCenter] addObserverForName:@"GoToCarFinance"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
//                                                      NSLog(@"Handled 'test.event' [%@]", notification.userInfo[@"item"]);
                                                      CarFinanceMainController *car = [[CarFinanceMainController alloc] init];
                                                      
                                                      [self presentViewController:car animated:YES completion:nil];
                                                      
                                                  }];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"GoToService"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      Root_ServiceMainController *service = [[Root_ServiceMainController alloc] init];
                                                      RootNavController *nav = [[RootNavController alloc]initWithRootViewController:service];
//                                                      [nav setModalTransitionStyle:2];
                                                      [self presentViewController:nav animated:YES completion:nil];
                                                      
                                                  }];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"gotoCalculate"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *notification) {
                                                      SVCalculatePriceController *calculate = [[SVCalculatePriceController alloc] init];
                                                      RootNavController *nav = [[RootNavController alloc]initWithRootViewController:calculate];
                                                      //                                                      [nav setModalTransitionStyle:2];
                                                      [self presentViewController:nav animated:YES completion:nil];
                                                      
                                                  }];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

/* Comment out the block below to over-ride */

/*
- (UIWebView*) newCordovaViewWithFrame:(CGRect)bounds
{
    return[super newCordovaViewWithFrame:bounds];
}

- (NSUInteger)supportedInterfaceOrientations 
{
    return [super supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation 
{
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

- (BOOL)shouldAutorotate 
{
    return [super shouldAutorotate];
}
*/

@end

@implementation MainCommandDelegate

/* To override the methods, uncomment the line in the init function(s)
   in MainViewController.m
 */

#pragma mark CDVCommandDelegate implementation

- (id)getCommandInstance:(NSString*)className
{
    return [super getCommandInstance:className];
}

- (NSString*)pathForResource:(NSString*)resourcepath
{
    return [super pathForResource:resourcepath];
}

@end

@implementation MainCommandQueue

/* To override, uncomment the line in the init function(s)
   in MainViewController.m
 */
- (BOOL)execute:(CDVInvokedUrlCommand*)command
{
    return [super execute:command];
}

@end
