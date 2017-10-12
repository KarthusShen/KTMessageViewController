//
//  KTMessagesBubbleImageFactory.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesBubbleImageFactory.h"

#import "NSImage+KTMessages.h"
#import "NSColor+KTMessages.h"

@interface KTMessagesBubbleImageFactory ()

@property (strong, nonatomic, readonly) NSImage *bubbleImage;
@property (assign, nonatomic, readonly) NSEdgeInsets capInsets;

@end



@implementation KTMessagesBubbleImageFactory

#pragma mark - Initialization

- (instancetype)initWithBubbleImage:(NSImage *)bubbleImage capInsets:(NSEdgeInsets)capInsets
{
    NSParameterAssert(bubbleImage != nil);
    
    self = [super init];
    if (self) {
        _bubbleImage = bubbleImage;
        
        if (NSEdgeInsetsEqual(capInsets, NSEdgeInsetsZero)) {
            _capInsets = [self kt_centerPointEdgeInsetsForImageSize:bubbleImage.size];
        }
        else {
            _capInsets = capInsets;
        }
    }
    return self;
}

- (instancetype)init
{
    return [self initWithBubbleImage:[NSImage kt_bubbleCompactImage] capInsets:NSEdgeInsetsZero];
}

#pragma mark - Public

- (KTMessagesBubbleImage *)outgoingMessagesBubbleImageWithColor:(NSColor *)color
{
    return [self kt_messagesBubbleImageWithColor:color flippedForIncoming:NO];
}

- (KTMessagesBubbleImage *)incomingMessagesBubbleImageWithColor:(NSColor *)color
{
    return [self kt_messagesBubbleImageWithColor:color flippedForIncoming:YES];
}

#pragma mark - Private

- (NSEdgeInsets)kt_centerPointEdgeInsetsForImageSize:(CGSize)bubbleImageSize
{
    // make image stretchable from center point
    CGPoint center = CGPointMake(bubbleImageSize.width / 2.0f, bubbleImageSize.height / 2.0f);
    return NSEdgeInsetsMake(center.y, center.x, center.y, center.x);
}

- (KTMessagesBubbleImage *)kt_messagesBubbleImageWithColor:(NSColor *)color flippedForIncoming:(BOOL)flippedForIncoming
{
    NSParameterAssert(color != nil);
    
    NSImage *normalBubble = [self.bubbleImage kt_imageMaskedWithColor:color];
    NSImage *highlightedBubble = [self.bubbleImage kt_imageMaskedWithColor:[color kt_colorByDarkeningColorWithValue:0.12f]];
    
    if (flippedForIncoming) {
        normalBubble = [self kt_horizontallyFlippedImageFromImage:normalBubble];
        highlightedBubble = [self kt_horizontallyFlippedImageFromImage:highlightedBubble];
    }
    
    normalBubble = [self kt_stretchableImageFromImage:normalBubble withCapInsets:self.capInsets];
    highlightedBubble = [self kt_stretchableImageFromImage:highlightedBubble withCapInsets:self.capInsets];
    
    return [[KTMessagesBubbleImage alloc] initWithMessageBubbleImage:normalBubble highlightedImage:highlightedBubble];
}

- (NSImage *)kt_horizontallyFlippedImageFromImage:(NSImage *)image
{
//    return [UIImage imageWithCGImage:image.CGImage
//                               scale:image.scale
//                         orientation:UIImageOrientationUpMirrored];
    
    //TODO: use NSAffineTransform to flip the image on macOS, see more in http://blog.csdn.net/nitghost/article/details/3509703
    return image;
}

- (NSImage *)kt_stretchableImageFromImage:(NSImage *)image withCapInsets:(NSEdgeInsets)capInsets
{
//    return [image resizableImageWithCapInsets:capInsets resizingMode:UIImageResizingModeStretch];
    
    //TODO: see http://blog.csdn.net/freewaywalker/article/details/21322511
    image.capInsets = capInsets;
    image.resizingMode = NSImageResizingModeStretch;
    return image;
}

@end
