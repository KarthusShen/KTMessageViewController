//
//  NSColor+KTMessage.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "NSColor+KTMessage.h"

@implementation NSColor (KTMessage)

#pragma mark - Message bubble colors
+ (NSColor *)kt_messageBubbleGreenColor
{
    return [NSColor colorWithHue:130.0f / 360.0f
                      saturation:0.68f
                      brightness:0.84f
                           alpha:1.0f];
}

+ (NSColor *)kt_messageBubbleBlueColor
{
    return [NSColor colorWithHue:210.0f / 360.0f
                      saturation:0.94f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (NSColor *)kt_messageBubbleRedColor
{
    return [NSColor colorWithHue:0.0f / 360.0f
                      saturation:0.79f
                      brightness:1.0f
                           alpha:1.0f];
}

+ (NSColor *)kt_messageBubbleLightGrayColor
{
    return [NSColor colorWithHue:240.0f / 360.0f
                      saturation:0.02f
                      brightness:0.92f
                           alpha:1.0f];
}

#pragma mark - Utilities

-(NSColor*)kt_colorByDarkeningColorWithValue:(CGFloat)value
{
    NSUInteger totalComponents = CGColorGetNumberOfComponents(self.CGColor);
    BOOL isGreyscale = (totalComponents == 2) ? YES : NO;
    
    CGFloat *oldComponents = (CGFloat *)CGColorGetComponents(self.CGColor);
    CGFloat newComponents[4];
    
    if (isGreyscale) {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[2] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[3] = oldComponents[1];
    }
    else {
        newComponents[0] = oldComponents[0] - value < 0.0f ? 0.0f : oldComponents[0] - value;
        newComponents[1] = oldComponents[1] - value < 0.0f ? 0.0f : oldComponents[1] - value;
        newComponents[2] = oldComponents[2] - value < 0.0f ? 0.0f : oldComponents[2] - value;
        newComponents[3] = oldComponents[3];
    }
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef newColor = CGColorCreate(colorSpace, newComponents);
    CGColorSpaceRelease(colorSpace);
    
    NSColor *retColor = [NSColor colorWithCGColor:newColor];
    CGColorRelease(newColor);
    
    return retColor;
}


@end
