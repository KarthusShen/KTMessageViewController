//
//  AppDelegate.m
//  KTMessageViewController
//
//  Created by 沈浩文 on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "AppDelegate.h"

#import "KTMessages.h"

#import "DemoMessagesViewController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@property (strong, nonatomic)  DemoMessagesViewController *demoController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    self.demoController = [[DemoMessagesViewController alloc]initWithNibName:NSStringFromClass([DemoMessagesViewController class]) bundle:nil];
    
    [self.window.contentView addSubview:self.demoController.view];
    //self.demoController.view.frame = self.window.contentView.bounds;
    
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
