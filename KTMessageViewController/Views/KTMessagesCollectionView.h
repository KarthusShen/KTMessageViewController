//
//  KTMessagesCollectionView.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/18.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "KTMessagesCollectionViewFlowLayout.h"
#import "KTMessagesCollectionViewDelegateFlowLayout.h"
#import "KTMessagesCollectionViewDataSource.h"
#import "KTMessagesCollectionViewCell.h"

/**
 *  The `KTMessagesCollectionView` class manages an ordered collection of message data items and presents
 *  them using a specialized layout for messages.
 */
@interface KTMessagesCollectionView : NSCollectionView <KTMessagesCollectionViewCellDelegate>

/**
 *  The object that provides the data for the collection view.
 *  The data source must adopt the `KTMessagesCollectionViewDataSource` protocol.
 */
@property (weak, nonatomic) id<KTMessagesCollectionViewDataSource> dataSource;

/**
 *  The object that acts as the delegate of the collection view.
 *  The delegate must adopt the `KTMessagesCollectionViewDelegateFlowLayout` protocol.
 */
@property (weak, nonatomic) id<KTMessagesCollectionViewDelegateFlowLayout> delegate;

/**
 *  The layout used to organize the collection view’s items.
 */
@property (strong, nonatomic) KTMessagesCollectionViewFlowLayout *collectionViewLayout;

/**
 *  Specifies whether the typing indicator displays on the left or right side of the collection view
 *  when shown. That is, whether it displays for an "incoming" or "outgoing" message.
 *  The default value is `YES`, meaning that the typing indicator will display on the left side of the
 *  collection view for incoming messages.
 *
 *  @discussion If your `KTMessagesViewController` subclass displays messages for right-to-left
 *  languages, such as Arabic, set this property to `NO`.
 *
 */
@property (assign, nonatomic) BOOL typingIndicatorDisplaysOnLeft;

/**
 *  The color of the typing indicator message bubble. The default value is a light gray color.
 */
@property (strong, nonatomic) NSColor *typingIndicatorMessageBubbleColor;

/**
 *  The color of the typing indicator ellipsis. The default value is a dark gray color.
 */
@property (strong, nonatomic) NSColor *typingIndicatorEllipsisColor;

/**
 *  The color of the text in the load earlier messages header. The default value is a bright blue color.
 */
@property (strong, nonatomic) NSColor *loadEarlierMessagesHeaderTextColor;


@end
