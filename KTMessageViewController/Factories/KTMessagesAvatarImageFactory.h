//
//  KTMessagesAvatarImageFactory.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "KTMessagesAvatarImage.h"

/**
 *  `KTMessagesAvatarImageFactory` is a factory that provides a means for creating and styling
 *  `KTMessagesAvatarImage` objects to be displayed in a `KTMessagesCollectionViewCell` of a `KTMessagesCollectionView`.
 */
@interface KTMessagesAvatarImageFactory : NSObject

/**
 *  Creates and returns a `KTMessagesAvatarImage` object with the specified placeholderImage that is
 *  cropped to a circle of the given diameter.
 *
 *  @param placeholderImage An image object that represents a placeholder avatar image. This value must not be `nil`.
 *  @param diameter         An integer value specifying the diameter size of the avatar in points. This value must be greater than `0`.
 *
 *  @return An initialized `KTMessagesAvatarImage` object if created successfully, `nil` otherwise.
 */
+ (KTMessagesAvatarImage *)avatarImageWithPlaceholder:(NSImage *)placeholderImage diameter:(NSUInteger)diameter;

/**
 *  Creates and returns a `KTMessagesAvatarImage` object with the specified image that is
 *  cropped to a circle of the given diameter and used for the `avatarImage` and `avatarPlaceholderImage` properties
 *  of the returned `KTMessagesAvatarImage` object. This image is then copied and has a transparent black mask applied to it,
 *  which is used for the `avatarHighlightedImage` property of the returned `KTMessagesAvatarImage` object.
 *
 *  @param image    An image object that represents an avatar image. This value must not be `nil`.
 *  @param diameter An integer value specifying the diameter size of the avatar in points. This value must be greater than `0`.
 *
 *  @return An initialized `KTMessagesAvatarImage` object if created successfully, `nil` otherwise.
 */
+ (KTMessagesAvatarImage *)avatarImageWithImage:(NSImage *)image diameter:(NSUInteger)diameter;

/**
 *  Returns a copy of the specified image that is cropped to a circle with the given diameter.
 *
 *  @param image    The image to crop. This value must not be `nil`.
 *  @param diameter An integer value specifying the diameter size of the image in points. This value must be greater than `0`.
 *
 *  @return A new image object if successful, `nil` otherwise.
 */
+ (NSImage *)circularAvatarImage:(NSImage *)image withDiameter:(NSUInteger)diameter;

/**
 *  Returns a copy of the specified image that is cropped to a circle with the given diameter.
 *  Additionally, a transparent overlay is applied to the image to represent a pressed or highlighted state.
 *
 *  @param image    The image to crop. This value must not be `nil`.
 *  @param diameter An integer value specifying the diameter size of the image in points. This value must be greater than `0`.
 *
 *  @return A new image object if successful, `nil` otherwise.
 */
+ (NSImage *)circularAvatarHighlightedImage:(NSImage *)image withDiameter:(NSUInteger)diameter;

/**
 *  Creates and returns a `KTMessagesAvatarImage` object with a circular shape that displays the specified userInitials
 *  with the given backgroundColor, textColor, font, and diameter.
 *
 *  @param userInitials    The user initials to display in the avatar image. This value must not be `nil`.
 *  @param backgroundColor The background color of the avatar. This value must not be `nil`.
 *  @param textColor       The color of the text of the userInitials. This value must not be `nil`.
 *  @param font            The font applied to userInitials. This value must not be `nil`.
 *  @param diameter        The diameter of the avatar image. This value must be greater than `0`.
 *
 *  @return An initialized `KTMessagesAvatarImage` object if created successfully, `nil` otherwise.
 *
 *  @discussion This method does not attempt to detect or correct incompatible parameters.
 *  That is to say, you are responsible for providing a font size and diameter that make sense.
 *  For example, a font size of `14.0f` and a diameter of `34.0f` will result in an avatar similar to Messages in iOS 7.
 *  However, a font size `30.0f` and diameter of `10.0f` will not produce a desirable image.
 *  Further, this method does not check the length of userInitials. It is recommended that you pass a string of length `2` or `3`.
 */
+ (KTMessagesAvatarImage *)avatarImageWithUserInitials:(NSString *)userInitials
                                        backgroundColor:(NSColor *)backgroundColor
                                              textColor:(NSColor *)textColor
                                                   font:(NSFont *)font
                                               diameter:(NSUInteger)diameter;

@end

