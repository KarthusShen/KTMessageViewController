//
//  DemoMessagesViewWindowController.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/21.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "DemoMessagesViewWindowController.h"

#import "DemoMessagesViewController.h"

@interface DemoMessagesViewWindowController ()

@end

@implementation DemoMessagesViewWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    
    DemoMessagesViewController * ktDemoViewController = [[DemoMessagesViewController alloc] initWithNibName:NSStringFromClass([DemoMessagesViewController class]) bundle:nil];
    
    ktDemoViewController.windowController = self;
    
    self.window.windowController.contentViewController = ktDemoViewController;
    
    [self.window center];
}

@end
