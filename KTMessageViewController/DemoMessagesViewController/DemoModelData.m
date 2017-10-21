//
//  DemoModelData.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/21.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "DemoModelData.h"

@implementation DemoModelData

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self loadFakeMessages];
        
        /**
         *  Create avatar images once.
         *
         *  Be sure to create your avatars one time and reuse them for good performance.
         *
         *  If you are not using avatars, ignore this.
         */
        KTMessagesAvatarImage *ktImage = [KTMessagesAvatarImageFactory avatarImageWithUserInitials:@"KT"
                                                                                      backgroundColor:[NSColor colorWithWhite:0.85f alpha:1.0f]
                                                                                            textColor:[NSColor colorWithWhite:0.60f alpha:1.0f]
                                                                                                 font:[NSFont systemFontOfSize:14.0f]
                                                                                             diameter:kKTMessagesCollectionViewAvatarSizeDefault];
        
        KTMessagesAvatarImage *cookImage = [KTMessagesAvatarImageFactory avatarImageWithImage:[NSImage imageNamed:@"demo_avatar_cook"]
                                                                                       diameter:kKTMessagesCollectionViewAvatarSizeDefault];
        
        KTMessagesAvatarImage *jobsImage = [KTMessagesAvatarImageFactory avatarImageWithImage:[NSImage imageNamed:@"demo_avatar_jobs"]
                                                                                       diameter:kKTMessagesCollectionViewAvatarSizeDefault];
        
        KTMessagesAvatarImage *wozImage = [KTMessagesAvatarImageFactory avatarImageWithImage:[NSImage imageNamed:@"demo_avatar_woz"]
                                                                                      diameter:kKTMessagesCollectionViewAvatarSizeDefault];
        
        self.avatars = @{ kKTDemoAvatarIdSquires : ktImage,
                          kKTDemoAvatarIdCook : cookImage,
                          kKTDemoAvatarIdJobs : jobsImage,
                          kKTDemoAvatarIdWoz : wozImage };
        
        
        self.users = @{ kKTDemoAvatarIdJobs : kKTDemoAvatarDisplayNameJobs,
                        kKTDemoAvatarIdCook : kKTDemoAvatarDisplayNameCook,
                        kKTDemoAvatarIdWoz : kKTDemoAvatarDisplayNameWoz,
                        kKTDemoAvatarIdSquires : kKTDemoAvatarDisplayNameSquires };
        
        
        /**
         *  Create message bubble images objects.
         *
         *  Be sure to create your bubble images one time and reuse them for good performance.
         *
         */
        KTMessagesBubbleImageFactory *bubbleFactory = [[KTMessagesBubbleImageFactory alloc] init];
        
        self.outgoingBubbleImageData = [bubbleFactory outgoingMessagesBubbleImageWithColor:[NSColor kt_messageBubbleLightGrayColor]];
        self.incomingBubbleImageData = [bubbleFactory incomingMessagesBubbleImageWithColor:[NSColor kt_messageBubbleGreenColor]];
    }
    
    return self;
}

- (void)loadFakeMessages
{
    /**
     *  Load some fake messages for demo.
     *
     *  You should have a mutable array or orderedSet, or something.
     */
    self.messages = [[NSMutableArray alloc] initWithObjects:
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdSquires
                                        senderDisplayName:kKTDemoAvatarDisplayNameSquires
                                                     date:[NSDate distantPast]
                                                     text:@"Welcome to KTMessages: A messaging UI framework for iOS."],
                     
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdWoz
                                        senderDisplayName:kKTDemoAvatarDisplayNameWoz
                                                     date:[NSDate distantPast]
                                                     text:@"It is simple, elegant, and easy to use. There are super sweet default settings, but you can customize like crazy."],
                     
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdSquires
                                        senderDisplayName:kKTDemoAvatarDisplayNameSquires
                                                     date:[NSDate distantPast]
                                                     text:@"It even has data detectors. You can call me tonight. My cell number is 123-456-7890. My website is www.hexedbits.com."],
                     
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdJobs
                                        senderDisplayName:kKTDemoAvatarDisplayNameJobs
                                                     date:[NSDate date]
                                                     text:@"KTMessagesViewController is nearly an exact replica of the iOS Messages App. And perhaps, better."],
                     
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdCook
                                        senderDisplayName:kKTDemoAvatarDisplayNameCook
                                                     date:[NSDate date]
                                                     text:@"It is unit-tested, free, open-source, and documented."],
                     
                     [[KTMessage alloc] initWithSenderId:kKTDemoAvatarIdSquires
                                        senderDisplayName:kKTDemoAvatarDisplayNameSquires
                                                     date:[NSDate date]
                                                     text:@"Now with media messages!"],
                     nil];
    
    [self addPhotoMediaMessage];
    [self addAudioMediaMessage];
    
    /**
     *  Setting to load extra messages for testing/demo
     */
//    if ([NSUserDefaults extraMessagesSetting]) {
//        NSArray *copyOfMessages = [self.messages copy];
//        for (NSUInteger i = 0; i < 4; i++) {
//            [self.messages addObjectsFromArray:copyOfMessages];
//        }
//    }
    
    
    /**
     *  Setting to load REALLY long message for testing/demo
     *  You should see "END" twice
     */
//    if ([NSUserDefaults longMessageSetting]) {
        KTMessage *reallyLongMessage = [KTMessage messageWithSenderId:kKTDemoAvatarIdSquires
                                                            displayName:kKTDemoAvatarDisplayNameSquires
                                                                   text:@"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? END"];
        
        [self.messages addObject:reallyLongMessage];
//    }
}

- (void)addAudioMediaMessage
{
    NSString * sample = [[NSBundle mainBundle] pathForResource:@"jsq_messages_sample" ofType:@"m4a"];
    NSData * audioData = [NSData dataWithContentsOfFile:sample];
    KTAudioMediaItem *audioItem = [[KTAudioMediaItem alloc] initWithData:audioData];
    KTMessage *audioMessage = [KTMessage messageWithSenderId:kKTDemoAvatarIdSquires
                                                   displayName:kKTDemoAvatarDisplayNameSquires
                                                         media:audioItem];
    [self.messages addObject:audioMessage];
}

- (void)addPhotoMediaMessage
{
    KTPhotoMediaItem *photoItem = [[KTPhotoMediaItem alloc] initWithImage:[NSImage imageNamed:@"goldengate"]];
    KTMessage *photoMessage = [KTMessage messageWithSenderId:kKTDemoAvatarIdSquires
                                                   displayName:kKTDemoAvatarDisplayNameSquires
                                                         media:photoItem];
    [self.messages addObject:photoMessage];
}

- (void)addVideoMediaMessage
{
    // don't have a real video, just pretending
    NSURL *videoURL = [NSURL URLWithString:@"file://"];
    
    KTVideoMediaItem *videoItem = [[KTVideoMediaItem alloc] initWithFileURL:videoURL isReadyToPlay:YES];
    KTMessage *videoMessage = [KTMessage messageWithSenderId:kKTDemoAvatarIdSquires
                                                   displayName:kKTDemoAvatarDisplayNameSquires
                                                         media:videoItem];
    [self.messages addObject:videoMessage];
}

@end
