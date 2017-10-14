//
//  KTMessagesBubbleSizeCalculating.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

@class KTMessagesCollectionViewFlowLayout;
@protocol KTMessageData;

/**
 *  The `KTMessagesBubbleSizeCalculating` protocol defines the common interface through which
 *  an object provides layout information to an instance of `KTMessagesCollectionViewFlowLayout`.
 *
 *  A concrete class that conforms to this protocol is provided in the library.
 *  See `KTMessagesBubbleSizeCalculator`.
 */
@protocol KTMessagesBubbleSizeCalculating <NSObject>

/**
 *  Computes and returns the size of the `messageBubbleImageView` property
 *  of a `KTMessagesCollectionViewCell` for the specified messageData at indexPath.
 *
 *  @param messageData A message data object.
 *  @param indexPath   The index path at which messageData is located.
 *  @param layout      The layout object asking for this information.
 *
 *  @return A sizes that specifies the required dimensions to display the entire message contents.
 *  Note, this is *not* the entire cell, but only its message bubble.
 */
- (CGSize)messageBubbleSizeForMessageData:(id<KTMessageData>)messageData
                              atIndexPath:(NSIndexPath *)indexPath
                               withLayout:(KTMessagesCollectionViewFlowLayout *)layout;

/**
 *  Notifies the receiver that the layout will be reset.
 *  Use this method to clear any cached layout information, if necessary.
 *
 *  @param layout The layout object notifying the receiver.
 */
- (void)prepareForResettingLayout:(KTMessagesCollectionViewFlowLayout *)layout;

@end

