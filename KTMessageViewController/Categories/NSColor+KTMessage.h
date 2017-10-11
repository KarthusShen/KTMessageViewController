//
//  NSColor+KTMessage.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSColor (KTMessage)

#pragma mark - Message bubble colors

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app green bubble color.
 */
+ (NSColor *)kt_messageBubbleGreenColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app blue bubble color.
 */
+ (NSColor *)kt_messageBubbleBlueColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 red color.
 */
+ (NSColor *)kt_messageBubbleRedColor;

/**
 *  @return A color object containing HSB values similar to the iOS 7 messages app light gray bubble color.
 */
+ (NSColor *)kt_messageBubbleLightGrayColor;

#pragma mark - Utilities

/**
 *  Creates and returns a new color object whose brightness component is decreased by the given value, using the initial color values of the receiver.
 *
 *  @param value A floating point value describing the amount by which to decrease the brightness of the receiver.
 *
 *  @return A new color object whose brightness is decreased by the given values. The other color values remain the same as the receiver.
 */
- (NSColor *)kt_colorByDarkeningColorWithValue:(CGFloat)value;

@end
