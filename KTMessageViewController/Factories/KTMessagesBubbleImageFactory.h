//
//  KTMessagesBubbleImageFactory.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "KTMessagesBubbleImage.h"

/**
 *  `KTMessagesBubbleImageFactory` is a factory that provides a means for creating and styling
 *  `KTMessagesBubbleImage` objects to be displayed in a `KTMessagesCollectionViewCell` of a `KTMessagesCollectionView`.
 */
@interface KTMessagesBubbleImageFactory : NSObject

/**
 *  Creates and returns a new instance of `KTMessagesBubbleImageFactory` that uses the
 *  default bubble image assets and cap insets.
 *
 *  @return An initialized `KTMessagesBubbleImageFactory` object if created successfully, `nil` otherwise.
 */
- (instancetype)init;

/**
 *  Creates and returns a new instance of `KTMessagesBubbleImageFactory` having the specified
 *  bubbleImage and capInsets. These values are used internally in the factory to produce
 *  `KTMessagesBubbleImage` objects.
 *
 *  @param bubbleImage A template bubble image from which all images will be generated.
 *  The image should represent the *outgoing* message bubble image, which will be flipped
 *  horizontally for generating the corresponding *incoming* message bubble images. This value must not be `nil`.
 *
 *  @param capInsets   The values to use for the cap insets that define the unstretchable regions of the image.
 *  Specify `UIEdgeInsetsZero` to have the factory create insets that allow the image to stretch from its center point.
 *
 *  @return An initialized `KTMessagesBubbleImageFactory` object if created successfully, `nil` otherwise.
 */
- (instancetype)initWithBubbleImage:(NSImage *)bubbleImage capInsets:(NSEdgeInsets)capInsets;

/**
 *  Creates and returns a `KTMessagesBubbleImage` object with the specified color for *outgoing* message image bubbles.
 *  The `messageBubbleImage` property of the `KTMessagesBubbleImage` is configured with a flat bubble image, masked to the given color.
 *  The `messageBubbleHighlightedImage` property is configured similarly, but with a darkened version of the given color.
 *
 *  @param color The color of the bubble image in the image view. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesBubbleImage` object if created successfully, `nil` otherwise.
 */
- (KTMessagesBubbleImage *)outgoingMessagesBubbleImageWithColor:(NSColor *)color;

/**
 *  Creates and returns a `KTMessagesBubbleImage` object with the specified color for *incoming* message image bubbles.
 *  The `messageBubbleImage` property of the `KTMessagesBubbleImage` is configured with a flat bubble image, masked to the given color.
 *  The `messageBubbleHighlightedImage` property is configured similarly, but with a darkened version of the given color.
 *
 *  @param color The color of the bubble image in the image view. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesBubbleImage` object if created successfully, `nil` otherwise.
 */
- (KTMessagesBubbleImage *)incomingMessagesBubbleImageWithColor:(NSColor *)color;

@end
