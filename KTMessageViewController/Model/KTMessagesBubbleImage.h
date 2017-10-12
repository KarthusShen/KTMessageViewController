//
//  KTMessagesBubbleImage.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

#import "KTMessageBubbleImageDataSource.h"

/**
 *  A `KTMessagesBubbleImage` model object represents a message bubble image, and is immutable.
 *  This is a concrete class that implements the `KTMessageBubbleImageDataSource` protocol.
 *  It contains a regular message bubble image and a highlighted message bubble image.
 *
 *  @see KTMessagesBubbleImageFactory.
 */
@interface KTMessagesBubbleImage : NSObject <KTMessageBubbleImageDataSource, NSCopying>

/**
 *  Returns the message bubble image for a regular display state.
 */
@property (strong, nonatomic, readonly) NSImage *messageBubbleImage;

/**
 *  Returns the message bubble image for a highlighted display state.
 */
@property (strong, nonatomic, readonly) NSImage *messageBubbleHighlightedImage;

/**
 *  Initializes and returns a message bubble image object having the specified regular image and highlighted image.
 *
 *  @param image            The regular message bubble image. This value must not be `nil`.
 *  @param highlightedImage The highlighted message bubble image. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesBubbleImage` object if successful, `nil` otherwise.
 *
 *  @see KTMessagesBubbleImageFactory.
 */
- (instancetype)initWithMessageBubbleImage:(NSImage *)image highlightedImage:(NSImage *)highlightedImage NS_DESIGNATED_INITIALIZER;

/**
 *  Not a valid initializer.
 */
- (id)init NS_UNAVAILABLE;

@end
