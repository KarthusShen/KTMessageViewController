//
//  DemoModelData.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/21.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "KTMessages.h"

static NSString * const kKTDemoAvatarDisplayNameSquires = @"Jesse Squires";
static NSString * const kKTDemoAvatarDisplayNameCook = @"Tim Cook";
static NSString * const kKTDemoAvatarDisplayNameJobs = @"Jobs";
static NSString * const kKTDemoAvatarDisplayNameWoz = @"Steve Wozniak";

static NSString * const kKTDemoAvatarIdSquires = @"053496-4509-289";
static NSString * const kKTDemoAvatarIdCook = @"468-768355-23123";
static NSString * const kKTDemoAvatarIdJobs = @"707-8956784-57";
static NSString * const kKTDemoAvatarIdWoz = @"309-41802-93823";


@interface DemoModelData : NSObject

@property (strong, nonatomic) NSMutableArray *messages;

@property (strong, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) KTMessagesBubbleImage *outgoingBubbleImageData;

@property (strong, nonatomic) KTMessagesBubbleImage *incomingBubbleImageData;

@property (strong, nonatomic) NSDictionary *users;

- (void)addPhotoMediaMessage;

- (void)addVideoMediaMessage;

- (void)addAudioMediaMessage;

@end
