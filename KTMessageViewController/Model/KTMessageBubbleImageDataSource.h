//
//  KTMessageBubbleImageDataSource.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/11.
//  Copyright © 2017年 karthus. All rights reserved.
//

#ifndef KTMessageBubbleImageDataSource_h
#define KTMessageBubbleImageDataSource_h

#import <Foundation/Foundation.h>
#import <AppKit/Appkit.h>
/**
 *  The `KTMessageBubbleImageDataSource` protocol defines the common interface through which
 *  a `KTMessagesViewController` and `KTMessagesCollectionView` interact with
 *  message bubble image model objects.
 *
 *  It declares the required and optional methods that a class must implement so that instances
 *  of that class can be display properly within a `KTMessagesCollectionViewCell`.
 *
 *  A concrete class that conforms to this protocol is provided in the library. See `KTMessagesBubbleImage`.
 *
 *  @see KTMessagesBubbleImage.
 */
@protocol KTMessageBubbleImageDataSource <NSObject>

@required

/**
 *  @return The message bubble image for a regular display state.
 *
 *  @warning You must not return `nil` from this method.
 */
- (NSImage *)messageBubbleImage;

/**
 *  @return The message bubble image for a highlighted display state.
 *
 *  @warning You must not return `nil` from this method.
 */
- (NSImage *)messageBubbleHighlightedImage;

@end

#endif /* KTMessageBubbleImageDataSource_h */
