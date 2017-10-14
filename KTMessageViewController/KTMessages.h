//
//  KTMessages.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#ifndef KTMessages_h
#define KTMessages_h


//  Views

//  Layout
#import "KTAudioMediaViewAttributes.h"

//  Model
#import "KTMessage.h"

#import "KTMediaItem.h"

#import "KTMessagesBubbleImage.h"
#import "KTMessagesAvatarImage.h"

//  Protocols
#import "KTMessageData.h"
#import "KTMessageMediaData.h"
#import "KTMessageAvatarImageDataSource.h"
#import "KTMessageBubbleImageDataSource.h"
#import "KTMessagesCollectionViewDataSource.h"
#import "KTMessagesCollectionViewDelegateFlowLayout.h"

//  Factories
#import "KTMessagesAvatarImageFactory.h"
#import "KTMessagesBubbleImageFactory.h"
#import "KTMessagesMediaViewBubbleImageMasker.h"
#import "KTMessagesTimestampFormatter.h"

//  Categories
#import "NSColor+KTMessages.h"
#import "NSImage+KTMessages.h"
#import "NSView+KTMessages.h"
#import "NSString+KTMessages.h"

#endif /* KTMessages_h */
