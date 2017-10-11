//
//  KTMessageAvatarImageDataSource.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#ifndef KTMessageAvatarImageDataSource_h
#define KTMessageAvatarImageDataSource_h

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

/**
 *  The `KTMessageAvatarImageDataSource` protocol defines the common interface through which
 *  a `KTMessagesViewController` and `KTMessagesCollectionView` interact with avatar image model objects.
 *
 *  It declares the required and optional methods that a class must implement so that instances
 *  of that class can be display properly within a `KTMessagesCollectionViewCell`.
 *
 *  A concrete class that conforms to this protocol is provided in the library. See `KTMessagesAvatarImage`.
 *
 *  @see KTMessagesAvatarImage.
 */
@protocol KTMessageAvatarImageDataSource <NSObject>

@required
/**
 *  @return The avatar image for a regular display state.
 *
 *  @discussion You may return `nil` from this method while the image is being downloaded.
 */
- (NSImage *)avatarImage;

/**
 *  @return The avatar image for a highlighted display state.
 *
 *  @discussion You may return `nil` from this method if this does not apply.
 */
- (NSImage *)avatarHighlightedImage;

/**
 *  @return A placeholder avatar image to be displayed if avatarImage is not yet available, or `nil`.
 *  For example, if avatarImage needs to be downloaded, this placeholder image
 *  will be used until avatarImage is not `nil`.
 *
 *  @discussion If you do not need support for a placeholder image, that is, your images
 *  are stored locally on the device, then you may simply return the same value as avatarImage here.
 *
 *  @warning You must not return `nil` from this method.
 */
- (NSImage *)avatarPlaceholderImage;

@end

#endif /* KTMessageAvatarImageDataSource_h */
