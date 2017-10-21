//
//  KTMessages.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#ifndef KTMessages_h
#define KTMessages_h

#import "KTMessagesViewController.h"

//  Views
#import "KTMessagesCollectionView.h"
#import "KTMessagesCollectionViewCellIncoming.h"
#import "KTMessagesCollectionViewCellOutgoing.h"


//  Layout
#import "KTMessagesBubbleSizeCalculating.h"
#import "KTMessagesBubblesSizeCalculator.h"
#import "KTMessagesCollectionViewFlowLayout.h"
#import "KTMessagesCollectionViewLayoutAttributes.h"
#import "KTMessagesCollectionViewFlowLayoutInvalidationContext.h"
#import "KTAudioMediaViewAttributes.h"

//  Model
#import "KTMessage.h"

#import "KTMediaItem.h"
#import "KTAudioMediaItem.h"
#import "KTPhotoMediaItem.h"
#import "KTVideoMediaItem.h"

#import "KTMessagesBubbleImage.h"
#import "KTMessagesAvatarImage.h"

#import "KTAudioMediaViewAttributes.h"

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
