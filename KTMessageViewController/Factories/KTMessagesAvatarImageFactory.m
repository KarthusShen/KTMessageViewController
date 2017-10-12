//
//  KTMessagesAvatarImageFactory.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesAvatarImageFactory.h"

#import "NSColor+KTMessages.h"

@implementation KTMessagesAvatarImageFactory

#pragma mark - Public

+ (KTMessagesAvatarImage *)avatarImageWithPlaceholder:(NSImage *)placeholderImage diameter:(NSUInteger)diameter
{
    NSImage *circlePlaceholderImage = [KTMessagesAvatarImageFactory kt_circularImage:placeholderImage
                                                                          withDiameter:diameter
                                                                      highlightedColor:nil];
    
    return [KTMessagesAvatarImage avatarImageWithPlaceholder:circlePlaceholderImage];
}

+ (KTMessagesAvatarImage *)avatarImageWithImage:(NSImage *)image diameter:(NSUInteger)diameter
{
    NSImage *avatar = [KTMessagesAvatarImageFactory circularAvatarImage:image withDiameter:diameter];
    NSImage *highlightedAvatar = [KTMessagesAvatarImageFactory circularAvatarHighlightedImage:image withDiameter:diameter];
    
    return [[KTMessagesAvatarImage alloc] initWithAvatarImage:avatar
                                              highlightedImage:highlightedAvatar
                                              placeholderImage:avatar];
}

+ (NSImage *)circularAvatarImage:(NSImage *)image withDiameter:(NSUInteger)diameter
{
    return [KTMessagesAvatarImageFactory kt_circularImage:image
                                               withDiameter:diameter
                                           highlightedColor:nil];
}

+ (NSImage *)circularAvatarHighlightedImage:(NSImage *)image withDiameter:(NSUInteger)diameter
{
    return [KTMessagesAvatarImageFactory kt_circularImage:image
                                               withDiameter:diameter
                                           highlightedColor:[NSColor colorWithWhite:0.1f alpha:0.3f]];
}

+ (KTMessagesAvatarImage *)avatarImageWithUserInitials:(NSString *)userInitials
                                        backgroundColor:(NSColor *)backgroundColor
                                              textColor:(NSColor *)textColor
                                                   font:(NSFont *)font
                                               diameter:(NSUInteger)diameter
{
    NSImage *avatarImage = [KTMessagesAvatarImageFactory kt_imageWitInitials:userInitials
                                                               backgroundColor:backgroundColor
                                                                     textColor:textColor
                                                                          font:font
                                                                      diameter:diameter];
    
    NSImage *avatarHighlightedImage = [KTMessagesAvatarImageFactory kt_circularImage:avatarImage
                                                                          withDiameter:diameter
                                                                      highlightedColor:[NSColor colorWithWhite:0.1f alpha:0.3f]];
    
    return [[KTMessagesAvatarImage alloc] initWithAvatarImage:avatarImage
                                              highlightedImage:avatarHighlightedImage
                                              placeholderImage:avatarImage];
}

#pragma mark - Private

+ (NSImage *)kt_imageWitInitials:(NSString *)initials
                  backgroundColor:(NSColor *)backgroundColor
                        textColor:(NSColor *)textColor
                             font:(NSFont *)font
                         diameter:(NSUInteger)diameter
{
    NSParameterAssert(initials != nil);
    NSParameterAssert(backgroundColor != nil);
    NSParameterAssert(textColor != nil);
    NSParameterAssert(font != nil);
    NSParameterAssert(diameter > 0);
    
    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    
    NSDictionary *attributes = @{ NSFontAttributeName : font,
                                  NSForegroundColorAttributeName : textColor };
    
    CGRect textFrame = [initials boundingRectWithSize:frame.size
                                              options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                           attributes:attributes
                                              context:nil];
    
    CGPoint frameMidPoint = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    CGPoint textFrameMidPoint = CGPointMake(CGRectGetMidX(textFrame), CGRectGetMidY(textFrame));
    
    CGFloat dx = frameMidPoint.x - textFrameMidPoint.x;
    CGFloat dy = frameMidPoint.y - textFrameMidPoint.y;
    CGPoint drawPoint = CGPointMake(dx, dy);
    NSImage *image = nil;
    
//    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
//    {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//
//        CGContextSetFillColorWithColor(context, backgroundColor.CGColor);
//        CGContextFillRect(context, frame);
//        [initials drawAtPoint:drawPoint withAttributes:attributes];
//
//        image = UIGraphicsGetImageFromCurrentImageContext();
//
//    }
//    UIGraphicsEndImageContext();
    
    //TODO:We need to do someting like above on macOS
    
    return [KTMessagesAvatarImageFactory kt_circularImage:image withDiameter:diameter highlightedColor:nil];
}

+ (NSImage *)kt_circularImage:(NSImage *)image withDiameter:(NSUInteger)diameter highlightedColor:(NSColor *)highlightedColor
{
    NSParameterAssert(image != nil);
    NSParameterAssert(diameter > 0);
    
//    CGRect frame = CGRectMake(0.0f, 0.0f, diameter, diameter);
    NSImage *newImage = nil;
    
//    UIGraphicsBeginImageContextWithOptions(frame.size, NO, [UIScreen mainScreen].scale);
//    {
//        CGContextRef context = UIGraphicsGetCurrentContext();
//
//        UIBezierPath *imgPath = [UIBezierPath bezierPathWithOvalInRect:frame];
//        [imgPath addClip];
//        [image drawInRect:frame];
//
//        if (highlightedColor != nil) {
//            CGContextSetFillColorWithColor(context, highlightedColor.CGColor);
//            CGContextFillEllipseInRect(context, frame);
//        }
//
//        newImage = UIGraphicsGetImageFromCurrentImageContext();
//
//    }
//    UIGraphicsEndImageContext();
    
    //TODO:We need to do someting like above on macOS
    
    return newImage;
}

@end
