//
//  KTMessagesMediaViewBubbleImageMasker.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@class KTMessagesBubbleImageFactory;

/**
 *  An instance of `KTMessagesMediaViewBubbleImageMasker` is an object that masks
 *  media views for a `KTMessageMediaData` object. Given a view, it will mask the view
 *  with a bubble image for an outgoing or incoming media view.
 *
 *  @see KTMessageMediaData.
 *  @see KTMessagesBubbleImageFactory.
 *  @see KTMessagesBubbleImage.
 */
@interface KTMessagesMediaViewBubbleImageMasker : NSObject

/**
 *  Returns the bubble image factory that the masker uses to mask media views.
 */
@property (strong, nonatomic, readonly) KTMessagesBubbleImageFactory *bubbleImageFactory;

/**
 *  Creates and returns a new instance of `KTMessagesMediaViewBubbleImageMasker`
 *  that uses a default instance of `KTMessagesBubbleImageFactory`. The masker uses the `KTMessagesBubbleImage`
 *  objects returned by the factory to mask media views.
 *
 *  @return An initialized `KTMessagesMediaViewBubbleImageMasker` object if created successfully, `nil` otherwise.
 *
 *  @see KTMessagesBubbleImageFactory.
 *  @see KTMessagesBubbleImage.
 */
- (instancetype)init;

/**
 *  Creates and returns a new instance of `KTMessagesMediaViewBubbleImageMasker`
 *  having the specified bubbleImageFactory. The masker uses the `KTMessagesBubbleImage`
 *  objects returned by the factory to mask media views.
 *
 *  @param bubbleImageFactory An initialized `KTMessagesBubbleImageFactory` object to use for masking media views. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesMediaViewBubbleImageMasker` object if created successfully, `nil` otherwise.
 *
 *  @see KTMessagesBubbleImageFactory.
 *  @see KTMessagesBubbleImage.
 */
- (instancetype)initWithBubbleImageFactory:(KTMessagesBubbleImageFactory *)bubbleImageFactory NS_DESIGNATED_INITIALIZER;

/**
 *  Applies an outgoing bubble image mask to the specified mediaView.
 *
 *  @param mediaView The media view to mask.
 */
- (void)applyOutgoingBubbleImageMaskToMediaView:(NSView *)mediaView;

/**
 *  Applies an incoming bubble image mask to the specified mediaView.
 *
 *  @param mediaView The media view to mask.
 */
- (void)applyIncomingBubbleImageMaskToMediaView:(NSView *)mediaView;

/**
 *  A convenience method for applying a bubble image mask to the specified mediaView.
 *  This method uses the default instance of `KTMessagesBubbleImageFactory`.
 *
 *  @param mediaView  The media view to mask.
 *  @param isOutgoing A boolean value specifiying whether or not the mask should be for an outgoing or incoming view.
 *  Specify `YES` for outgoing and `NO` for incoming.
 */
+ (void)applyBubbleImageMaskToMediaView:(NSView *)mediaView isOutgoing:(BOOL)isOutgoing;

@end
