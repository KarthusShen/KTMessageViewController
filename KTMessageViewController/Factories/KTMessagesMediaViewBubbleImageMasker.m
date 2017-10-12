//
//  KTMessagesMediaViewBubbleImageMasker.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesMediaViewBubbleImageMasker.h"

#import "KTMessagesBubbleImageFactory.h"

@implementation KTMessagesMediaViewBubbleImageMasker

#pragma mark - Initialization

- (instancetype)init
{
    return [self initWithBubbleImageFactory:[[KTMessagesBubbleImageFactory alloc] init]];
}

- (instancetype)initWithBubbleImageFactory:(KTMessagesBubbleImageFactory *)bubbleImageFactory
{
    NSParameterAssert(bubbleImageFactory != nil);
    
    self = [super init];
    if (self) {
        _bubbleImageFactory = bubbleImageFactory;
    }
    return self;
}

#pragma mark - View masking

- (void)applyOutgoingBubbleImageMaskToMediaView:(NSView *)mediaView
{
    KTMessagesBubbleImage *bubbleImageData = [self.bubbleImageFactory outgoingMessagesBubbleImageWithColor:[NSColor whiteColor]];
    [self kt_maskView:mediaView withImage:[bubbleImageData messageBubbleImage]];
}

- (void)applyIncomingBubbleImageMaskToMediaView:(NSView *)mediaView
{
    KTMessagesBubbleImage *bubbleImageData = [self.bubbleImageFactory incomingMessagesBubbleImageWithColor:[NSColor whiteColor]];
    [self kt_maskView:mediaView withImage:[bubbleImageData messageBubbleImage]];
}

+ (void)applyBubbleImageMaskToMediaView:(NSView *)mediaView isOutgoing:(BOOL)isOutgoing
{
    KTMessagesMediaViewBubbleImageMasker *masker = [[KTMessagesMediaViewBubbleImageMasker alloc] init];
    
    if (isOutgoing) {
        [masker applyOutgoingBubbleImageMaskToMediaView:mediaView];
    }
    else {
        [masker applyIncomingBubbleImageMaskToMediaView:mediaView];
    }
}

#pragma mark - Private

- (void)kt_maskView:(NSView *)view withImage:(NSImage *)image
{
    NSParameterAssert(view != nil);
    NSParameterAssert(image != nil);
    
    NSImageView *imageViewMask = [NSImageView imageViewWithImage:image];
    imageViewMask.frame = CGRectInset(view.frame, 2.0f, 2.0f);
    
    view.layer.mask = imageViewMask.layer;
}

@end
