//
//  KTMessagesCollectionView.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/18.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionView.h"

#import "KTMessagesCollectionViewFlowLayout.h"
#import "KTMessagesCollectionViewCellIncoming.h"
#import "KTMessagesCollectionViewCellOutgoing.h"

#import "NSColor+KTMessages.h"

@interface KTMessagesCollectionView ()

-(void)kt_configureCollectionView;

@end


@implementation KTMessagesCollectionView

@dynamic dataSource;
@dynamic delegate;
@dynamic collectionViewLayout;

#pragma mark - Initialization

- (void)kt_configureCollectionView
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.backgroundColors = nil;
//    self.keyboardDismissMode = NSScrollViewKeyboardDismissModeNone;
//    self.alwaysBounceVertical = YES;
//    self.bounces = YES;
    
    [self registerNib:[KTMessagesCollectionViewCellIncoming nib]
forItemWithIdentifier:[KTMessagesCollectionViewCellIncoming cellReuseIdentifier]];
    
    [self registerNib:[KTMessagesCollectionViewCellOutgoing nib]
forItemWithIdentifier:[KTMessagesCollectionViewCellOutgoing cellReuseIdentifier]];
    
    [self registerNib:[KTMessagesCollectionViewCellIncoming nib]
forItemWithIdentifier:[KTMessagesCollectionViewCellIncoming mediaCellReuseIdentifier]];
    
    [self registerNib:[KTMessagesCollectionViewCellOutgoing nib]
forItemWithIdentifier:[KTMessagesCollectionViewCellOutgoing mediaCellReuseIdentifier]];
    
    _typingIndicatorDisplaysOnLeft = YES;
    _typingIndicatorMessageBubbleColor = [NSColor kt_messageBubbleLightGrayColor];
    _typingIndicatorEllipsisColor = [_typingIndicatorMessageBubbleColor kt_colorByDarkeningColorWithValue:0.3f];
    
    _loadEarlierMessagesHeaderTextColor = [NSColor kt_messageBubbleBlueColor];
}

//- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(NSCollectionViewLayout *)layout
//{
//    self = [super initWithFrame:frame collectionViewLayout:layout];
//    if (self) {
//        [self kt_configureCollectionView];
//    }
//    return self;
//}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self kt_configureCollectionView];
}


#pragma mark - Messages collection view cell delegate

- (void)messagesCollectionViewCellDidTapAvatar:(KTMessagesCollectionViewCell *)cell
{
    NSIndexPath *indexPath = [self indexPathForItem:cell];
    if (indexPath == nil) {
        return;
    }
    
    [self.delegate collectionView:self
            didTapAvatarImageView:cell.avatarImageView
                      atIndexPath:indexPath];
}

- (void)messagesCollectionViewCellDidTapMessageBubble:(KTMessagesCollectionViewCell *)cell
{
    NSIndexPath *indexPath = [self indexPathForItem:cell];
    if (indexPath == nil) {
        return;
    }
    
    [self.delegate collectionView:self didTapMessageBubbleAtIndexPath:indexPath];
}

- (void)messagesCollectionViewCellDidTapCell:(KTMessagesCollectionViewCell *)cell atPosition:(CGPoint)position
{
    NSIndexPath *indexPath = [self indexPathForItem:cell];
    if (indexPath == nil) {
        return;
    }
    
    [self.delegate collectionView:self
            didTapCellAtIndexPath:indexPath
                    touchLocation:position];
}

- (void)messagesCollectionViewCell:(KTMessagesCollectionViewCell *)cell didPerformAction:(SEL)action withSender:(id)sender
{
    NSIndexPath *indexPath = [self indexPathForItem:cell];
    if (indexPath == nil) {
        return;
    }
    //TODO: maybe we needn't do that
//    [self.delegate collectionView:self
//                    performAction:action
//               forItemAtIndexPath:indexPath
//                       withSender:sender];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

@end
