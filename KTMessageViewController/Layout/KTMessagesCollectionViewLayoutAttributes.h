//
//  KTMessagesCollectionViewLayoutAttributes.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  A `KTMessagesCollectionViewLayoutAttributes` is an object that manages the layout-related attributes
 *  for a given `KTMessagesCollectionViewCell` in a `KTMessagesCollectionView`.
 */
@interface KTMessagesCollectionViewLayoutAttributes : NSCollectionViewLayoutAttributes <NSCopying>

/**
 *  The font used to display the body of a text message in a message bubble within a `JSQMessagesCollectionViewCell`.
 *  This value must not be `nil`.
 */
@property (strong, nonatomic) NSFont *messageBubbleFont;

/**
 *  The width of the `messageBubbleContainerView` of a `JSQMessagesCollectionViewCell`.
 *  This value should be greater than `0.0`.
 *
 *  @see JSQMessagesCollectionViewCell.
 */
@property (assign, nonatomic) CGFloat messageBubbleContainerViewWidth;

/**
 *  The inset of the text container's layout area within the text view's content area in a `JSQMessagesCollectionViewCell`.
 *  The specified inset values should be greater than or equal to `0.0`.
 */
@property (assign, nonatomic) NSEdgeInsets textViewTextContainerInsets;

/**
 *  The inset of the frame of the text view within a `JSQMessagesCollectionViewCell`.
 *
 *  @discussion The inset values should be greater than or equal to `0.0` and are applied in the following ways:
 *
 *  1. The right value insets the text view frame on the side adjacent to the avatar image
 *  (or where the avatar would normally appear). For outgoing messages this is the right side,
 *  for incoming messages this is the left side.
 *
 *  2. The left value insets the text view frame on the side opposite the avatar image
 *  (or where the avatar would normally appear). For outgoing messages this is the left side,
 *  for incoming messages this is the right side.
 *
 *  3. The top value insets the top of the frame.
 *
 *  4. The bottom value insets the bottom of the frame.
 */
@property (assign, nonatomic) NSEdgeInsets textViewFrameInsets;

/**
 *  The size of the `avatarImageView` of a `JSQMessagesCollectionViewCellIncoming`.
 *  The size values should be greater than or equal to `0.0`.
 *
 *  @see JSQMessagesCollectionViewCellIncoming.
 */
@property (assign, nonatomic) CGSize incomingAvatarViewSize;

/**
 *  The size of the `avatarImageView` of a `JSQMessagesCollectionViewCellOutgoing`.
 *  The size values should be greater than or equal to `0.0`.
 *
 *  @see `JSQMessagesCollectionViewCellOutgoing`.
 */
@property (assign, nonatomic) CGSize outgoingAvatarViewSize;

/**
 *  The height of the `cellTopLabel` of a `JSQMessagesCollectionViewCell`.
 *  This value should be greater than or equal to `0.0`.
 *
 *  @see JSQMessagesCollectionViewCell.
 */
@property (assign, nonatomic) CGFloat cellTopLabelHeight;

/**
 *  The height of the `messageBubbleTopLabel` of a `JSQMessagesCollectionViewCell`.
 *  This value should be greater than or equal to `0.0`.
 *
 *  @see JSQMessagesCollectionViewCell.
 */
@property (assign, nonatomic) CGFloat messageBubbleTopLabelHeight;

/**
 *  The height of the `cellBottomLabel` of a `JSQMessagesCollectionViewCell`.
 *  This value should be greater than or equal to `0.0`.
 *
 *  @see JSQMessagesCollectionViewCell.
 */
@property (assign, nonatomic) CGFloat cellBottomLabelHeight;

@end

NS_ASSUME_NONNULL_END
