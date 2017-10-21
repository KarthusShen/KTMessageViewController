//
//  AppDelegate.m
//  KTMessageViewController
//
//  Created by 沈浩文 on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "AppDelegate.h"

#import "KTMessages.h"

#import "DemoMessagesViewWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    [_mainWindowController.window close];
    _mainWindowController = nil;
    
    _mainWindowController = [[DemoMessagesViewWindowController alloc] initWithWindowNibName:NSStringFromClass([DemoMessagesViewWindowController class])];
    
    [[_mainWindowController window] center];
    
    [_mainWindowController.window orderFront:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
