//
//  NSImage+KTMessages.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "NSImage+KTMessages.h"

@implementation NSImage (KTMessages)

- (NSImage *)kt_imageMaskedWithColor:(NSColor *)maskColor
{
    NSParameterAssert(maskColor != nil);
    
    //TODO: We need to know how to mask a image with a NSImage object,so return self for now;
    
    return self;
}

+ (NSImage *)kt_bubbleImageFromBundleWithName:(NSString *)name
{
    return [NSImage imageNamed:name];
}

+ (NSImage *)kt_bubbleRegularImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_regular"];
}

+ (NSImage *)kt_bubbleRegularTaillessImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_tailless"];
}

+ (NSImage *)kt_bubbleRegularStrokedImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_stroked"];
}

+ (NSImage *)kt_bubbleRegularStrokedTaillessImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_stroked_tailless"];
}

+ (NSImage *)kt_bubbleCompactImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_min"];
}

+ (NSImage *)kt_bubbleCompactTaillessImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"bubble_min_tailless"];
}

+ (NSImage *)kt_defaultAccessoryImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"clip"];
}

+ (NSImage *)kt_defaultTypingIndicatorImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"typing"];
}

+ (NSImage *)kt_defaultPlayImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"play"];
}

+ (NSImage *)kt_defaultPauseImage
{
    return [NSImage kt_bubbleImageFromBundleWithName:@"pause"];
}

@end
