//
//  AppDelegate.m
//  KTMessageViewController
//
//  Created by 沈浩文 on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "AppDelegate.h"

//以下import以后要删除，XCode9在编写头文件时如果没别的文件引用它，编写过程就没有自动完成功能，很恶心
#import "KTMessageMediaData.h"
#import "KTMessageData.h"
#import "KTMessageAvatarImageDataSource.h"
#import "KTMessageBubbleImageDataSource.h"
#import "KTMessagesCollectionViewDataSource.h"
#import "KTMessagesCollectionViewDelegateFlowLayout.h"
#import "KTMessage.h"
#import "KTMessages.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
