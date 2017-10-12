//
//  NSImage+KTMessages.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (KTMessages)

/**
 *  Creates and returns a new image object that is masked with the specified mask color.
 *
 *  @param maskColor The color value for the mask. This value must not be `nil`.
 *
 *  @return A new image object masked with the specified color.
 */
- (NSImage *)kt_imageMaskedWithColor:(NSColor *)maskColor;

/**
 *  @return The regular message bubble image.
 */
+ (NSImage *)kt_bubbleRegularImage;

/**
 *  @return The regular message bubble image without a tail.
 */
+ (NSImage *)kt_bubbleRegularTaillessImage;

/**
 *  @return The regular message bubble image stroked, not filled.
 */
+ (NSImage *)kt_bubbleRegularStrokedImage;

/**
 *  @return The regular message bubble image stroked, not filled and without a tail.
 */
+ (NSImage *)kt_bubbleRegularStrokedTaillessImage;

/**
 *  @return The compact message bubble image.
 *
 *  @discussion This is the default bubble image used by `ktMessagesBubbleImageFactory`.
 */
+ (NSImage *)kt_bubbleCompactImage;

/**
 *  @return The compact message bubble image without a tail.
 */
+ (NSImage *)kt_bubbleCompactTaillessImage;

/**
 *  @return The default input toolbar accessory image.
 */
+ (NSImage *)kt_defaultAccessoryImage;

/**
 *  @return The default typing indicator image.
 */
+ (NSImage *)kt_defaultTypingIndicatorImage;

/**
 *  @return The default play icon image.
 */
+ (NSImage *)kt_defaultPlayImage;

/**
 *  @return The default pause icon image.
 */
+ (NSImage *)kt_defaultPauseImage;

@end
