//
//  KTMessagesViewController.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/20.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesViewController.h"

#import "KTMessagesCollectionViewFlowLayoutInvalidationContext.h"

#import "KTMessageData.h"
#import "KTMessageBubbleImageDataSource.h"
#import "KTMessageAvatarImageDataSource.h"

#import "KTMessagesCollectionViewCellIncoming.h"
#import "KTMessagesCollectionViewCellOutgoing.h"

#import "NSString+KTMessages.h"
#import "NSColor+KTMessages.h"

#import <objc/runtime.h>

static void * kKTMessagesKeyValueObservingContext = &kKTMessagesKeyValueObservingContext;

@interface KTMessagesViewController ()

@property (weak) IBOutlet KTMessagesCollectionView *collectionView;

@end

@implementation KTMessagesViewController

#pragma mark - Class methods

+ (NSNib *)nib
{
    return [[NSNib alloc] initWithNibNamed:NSStringFromClass([KTMessagesViewController class])
                          bundle:[NSBundle bundleForClass:[KTMessagesViewController class]]];
}

+ (instancetype)messagesViewController
{
    return [[[self class] alloc] initWithNibName:NSStringFromClass([KTMessagesViewController class])
                                          bundle:[NSBundle bundleForClass:[KTMessagesViewController class]]];
}

#pragma mark - Initialization

- (void)kt_configureMessagesViewController
{
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    
    self.automaticallyScrollsToMostRecentMessage = YES;
    
    self.outgoingCellIdentifier = [KTMessagesCollectionViewCellOutgoing cellReuseIdentifier];
    self.outgoingMediaCellIdentifier = [KTMessagesCollectionViewCellOutgoing mediaCellReuseIdentifier];
    
    self.incomingCellIdentifier = [KTMessagesCollectionViewCellIncoming cellReuseIdentifier];
    self.incomingMediaCellIdentifier = [KTMessagesCollectionViewCellIncoming mediaCellReuseIdentifier];
    
    
    self.topContentAdditionalInset = 0.0f;
    
    //[self kt_updateCollectionViewInsets];TODO:
}

- (void)dealloc
{
    //TODO:
//    [self kt_registerForNotifications:NO];
//    [self kt_removeObservers];
    
    _collectionView.dataSource = nil;
    _collectionView.delegate = nil;
}

#pragma mark - Setters

- (void)setTopContentAdditionalInset:(CGFloat)topContentAdditionalInset
{
    _topContentAdditionalInset = topContentAdditionalInset;
    //    [self kt_updateCollectionViewInsets];TODO:
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[[self class] nib] instantiateWithOwner:self topLevelObjects:nil];
    
    [self kt_configureMessagesViewController];
    //    [self kt_registerForNotifications:YES]; TODO:
}

- (void)viewWillAppear
{
    NSParameterAssert(self.senderId != nil);
    NSParameterAssert(self.senderDisplayName != nil);
    
    [super viewWillAppear];
    //[self.view layoutIfNeeded];
    //[self.view layoutSubtreeIfNeeded];
    [self.collectionView.collectionViewLayout invalidateLayout];
    
//    if (self.automaticallyScrollsToMostRecentMessage) {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self scrollToBottomAnimated:NO];
//            [self.collectionView.collectionViewLayout invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
//        });
//    }
    
//    [self kt_updateKeyboardTriggerPoint];
}

- (void)viewDidAppear
{
    [super viewDidAppear];
    //TODO:
//    [self kt_addObservers];
//    [self kt_addActionToInteractivePopGestureRecognizer:YES];
//    [self.keyboardController beginListeningForKeyboard];
    
}

- (void)viewWillDisappear
{
    [super viewWillDisappear];
    self.collectionView.collectionViewLayout.springinessEnabled = NO;
}

- (void)viewDidDisappear
{
    [super viewDidDisappear];
    //TODO:
//    [self kt_addActionToInteractivePopGestureRecognizer:NO];
//    [self kt_removeObservers];
//    [self.keyboardController endListeningForKeyboard];
}

#pragma mark - Messages view controller

- (void)didPressSendButton:(NSButton *)button
           withMessageText:(NSString *)text
                  senderId:(NSString *)senderId
         senderDisplayName:(NSString *)senderDisplayName
                      date:(NSDate *)date
{
    NSAssert(NO, @"Error! required method not implemented in subclass. Need to implement %s", __PRETTY_FUNCTION__);
}

- (void)didPressAccessoryButton:(NSButton *)sender
{
    NSAssert(NO, @"Error! required method not implemented in subclass. Need to implement %s", __PRETTY_FUNCTION__);
}

- (void)finishSendingMessage
{
    [self finishSendingMessageAnimated:YES];
}

- (void)finishSendingMessageAnimated:(BOOL)animated {
    
    //TODO:
//    NSTextView *textView = self.inputToolbar.contentView.textView;
//    textView.text = nil;
//    [textView.undoManager removeAllActions];
//
//    [self.inputToolbar toggleSendButtonEnabled];
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:NSTextViewTextDidChangeNotification object:textView];
    
    [self.collectionView.collectionViewLayout invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
    [self.collectionView reloadData];
    
    if (self.automaticallyScrollsToMostRecentMessage) {
        [self scrollToBottomAnimated:animated];
    }
}

- (void)finishReceivingMessage
{
    [self finishReceivingMessageAnimated:YES];
}

- (void)finishReceivingMessageAnimated:(BOOL)animated {
    
    //self.showTypingIndicator = NO;
    
    [self.collectionView.collectionViewLayout invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
    [self.collectionView reloadData];
    
    //TODO:
//    if (self.automaticallyScrollsToMostRecentMessage && ![self kt_isMenuVisible]) {
//        [self scrollToBottomAnimated:animated];
//    }
//
//    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, [NSBundle jsq_localizedStringForKey:@"new_message_received_accessibility_announcement"]);
}

- (void)scrollToBottomAnimated:(BOOL)animated
{
    if ([self.collectionView numberOfSections] == 0) {
        return;
    }
    
    NSIndexPath *lastCell = [NSIndexPath indexPathForItem:([self.collectionView numberOfItemsInSection:0] - 1) inSection:0];
    [self scrollToIndexPath:lastCell animated:animated];
}

- (void)scrollToIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated
{
    if ([self.collectionView numberOfSections] <= indexPath.section) {
        return;
    }
    
    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:indexPath.section];
    if (numberOfItems == 0) {
        return;
    }
    
    CGFloat collectionViewContentHeight = [self.collectionView.collectionViewLayout collectionViewContentSize].height;
    BOOL isContentTooSmall = (collectionViewContentHeight < CGRectGetHeight(self.collectionView.bounds));
    
    if (isContentTooSmall) {
        //  workaround for the first few messages not scrolling
        //  when the collection view content size is too small, `scrollToItemAtIndexPath:` doesn't work properly
        //  this seems to be a UIKit bug, see #256 on GitHub
//        [self.collectionView scrollRectToVisible:CGRectMake(0.0, collectionViewContentHeight - 1.0f, 1.0f, 1.0f)
        //                                        animated:animated];TODO:
        return;
    }
    
    NSInteger item = MAX(MIN(indexPath.item, numberOfItems - 1), 0);
    indexPath = [NSIndexPath indexPathForItem:item inSection:0];
    
    //  workaround for really long messages not scrolling
    //  if last message is too long, use scroll position bottom for better appearance, else use top
    //  possibly a UIKit bug, see #480 on GitHub
    CGSize cellSize = [self.collectionView.collectionViewLayout sizeForItemAtIndexPath:indexPath];
   
    CGFloat maxHeightForVisibleMessage = CGRectGetHeight(self.collectionView.bounds)
    - self.collectionView.collectionViewLayout.sectionInset.top
    - self.collectionView.collectionViewLayout.sectionInset.bottom;
    NSCollectionViewScrollPosition scrollPosition = (cellSize.height > maxHeightForVisibleMessage) ? NSCollectionViewScrollPositionBottom : NSCollectionViewScrollPositionTop;

    //TODO: check this phrase of (NSSet*)indexPath:
    [self.collectionView scrollToItemsAtIndexPaths:(NSSet*)indexPath scrollPosition:scrollPosition];
}

- (BOOL)isOutgoingMessage:(id<KTMessageData>)messageItem
{
    NSString *messageSenderId = [messageItem senderId];
    NSParameterAssert(messageSenderId != nil);
    
    return [messageSenderId isEqualToString:self.senderId];
}

#pragma mark - KTMessages collection view data source

- (id<KTMessageData>)collectionView:(KTMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return nil;
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
}

- (id<KTMessageBubbleImageDataSource>)collectionView:(KTMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return nil;
}

- (id<KTMessageAvatarImageDataSource>)collectionView:(KTMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSAssert(NO, @"ERROR: required method not implemented: %s", __PRETTY_FUNCTION__);
    return nil;
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - Collection view data source
- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)collectionView
{
    return 1;
}

- (NSCollectionViewItem *)collectionView:(KTMessagesCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    id<KTMessageData> messageItem = [collectionView.dataSource collectionView:collectionView messageDataForItemAtIndexPath:indexPath];
    NSParameterAssert(messageItem != nil);
    
    BOOL isOutgoingMessage = [self isOutgoingMessage:messageItem];
    BOOL isMediaMessage = [messageItem isMediaMessage];
    
    NSString *cellIdentifier = nil;
    if (isMediaMessage) {
        cellIdentifier = isOutgoingMessage ? self.outgoingMediaCellIdentifier : self.incomingMediaCellIdentifier;
    }
    else {
        cellIdentifier = isOutgoingMessage ? self.outgoingCellIdentifier : self.incomingCellIdentifier;
    }
    
    KTMessagesCollectionViewCell *cell = [collectionView makeItemWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.delegate = collectionView;
    
    if (!isMediaMessage)
    {
        [[[cell.textView textStorage] mutableString] appendString:[messageItem text]];
//        NSString *string = cell.textView.string;
//        NSLog(@"cell string is %@", string);
//        NSParameterAssert(cell.textView.string != nil);
        
        id<KTMessageBubbleImageDataSource> bubbleImageDataSource = [collectionView.dataSource collectionView:collectionView messageBubbleImageDataForItemAtIndexPath:indexPath];
        cell.messageBubbleImageView.image = [bubbleImageDataSource messageBubbleImage];
    }
    else
    {
        id<KTMessageMediaData> messageMedia = [messageItem media];
        cell.mediaView = [messageMedia mediaView] ?: [messageMedia mediaPlaceholderView];
        NSParameterAssert(cell.mediaView != nil);
    }
    
    BOOL needsAvatar = YES;
    if (isOutgoingMessage && CGSizeEqualToSize(collectionView.collectionViewLayout.outgoingAvatarViewSize, CGSizeZero)) {
        needsAvatar = NO;
    }
    else if (!isOutgoingMessage && CGSizeEqualToSize(collectionView.collectionViewLayout.incomingAvatarViewSize, CGSizeZero)) {
        needsAvatar = NO;
    }
    
    id<KTMessageAvatarImageDataSource> avatarImageDataSource = nil;
    if (needsAvatar) {
        avatarImageDataSource = [collectionView.dataSource collectionView:collectionView avatarImageDataForItemAtIndexPath:indexPath];
        if (avatarImageDataSource != nil) {
            
            NSImage *avatarImage = [avatarImageDataSource avatarImage];
            if (avatarImage == nil) {
                cell.avatarImageView.image = [avatarImageDataSource avatarPlaceholderImage];
            }
            else {
                cell.avatarImageView.image = avatarImage;
            }
        }
    }
    
    cell.cellTopLabel.attributedStringValue = [collectionView.dataSource collectionView:collectionView attributedTextForCellTopLabelAtIndexPath:indexPath];
    cell.messageBubbleTopLabel.attributedStringValue = [collectionView.dataSource collectionView:collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:indexPath];
    cell.cellBottomLabel.attributedStringValue = [collectionView.dataSource collectionView:collectionView attributedTextForCellBottomLabelAtIndexPath:indexPath];
    
    
    CGFloat bubbleTopLabelInset = (avatarImageDataSource != nil) ? 60.0f : 15.0f;
    
    if (isOutgoingMessage) {
        cell.messageBubbleTopLabel.textInsets = NSEdgeInsetsMake(0.0f, 0.0f, 0.0f, bubbleTopLabelInset);
    }
    else {
        cell.messageBubbleTopLabel.textInsets = NSEdgeInsetsMake(0.0f, bubbleTopLabelInset, 0.0f, 0.0f);
    }
    //TODO:
//    cell.textView.dataDetectorTypes = UIDataDetectorTypeAll;
//
//    cell.backgroundColor = [NSColor clearColor];
//    cell.view.layer.rasterizationScale = [NSScreen mainScreen].scale;
//    cell.layer.shouldRasterize = YES;
    
    [self collectionView:collectionView accessibilityForCell:cell indexPath:indexPath message:messageItem];

    return cell;
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView
  accessibilityForCell:(KTMessagesCollectionViewCell*)cell
             indexPath:(NSIndexPath *)indexPath
               message:(id<KTMessageData>)messageItem
{
//    const BOOL isMediaMessage = [messageItem isMediaMessage];
//    cell.isAccessibilityElement = YES;
//    if (!isMediaMessage) {
//        cell.accessibilityLabel = [NSString stringWithFormat:[NSBundle kt_localizedStringForKey:@"text_message_accessibility_label"],
//                                   [messageItem senderDisplayName],
//                                   [messageItem text]];
//    }
//    else {
//        cell.accessibilityLabel = [NSString stringWithFormat:[NSBundle kt_localizedStringForKey:@"media_message_accessibility_label"],
//                                   [messageItem senderDisplayName]];
//    }
}

- (NSView *)collectionView:(KTMessagesCollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    //TODO: The footer and header
//    if (self.showTypingIndicator && [kind isEqualToString:UICollectionElementKindSectionFooter]) {
//        return [collectionView dequeueTypingIndicatorFooterViewForIndexPath:indexPath];
//    }
//    else if (self.showLoadEarlierMessagesHeader && [kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        return [collectionView dequeueLoadEarlierMessagesViewHeaderForIndexPath:indexPath];
//    }
    
    return nil;
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    //TODO: adapt the footer
    return CGSizeZero;
}

- (NSSize)collectionView:(NSCollectionView *)collectionView layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    //TODO: adapt the header
    return CGSizeZero;
}

#pragma mark - Collection view delegate
//TODO: Collection view delegate

#pragma mark - Collection view delegate flow layout

- (NSSize)collectionView:(KTMessagesCollectionView *)collectionView layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return NSSizeFromCGSize([collectionViewLayout sizeForItemAtIndexPath:indexPath]);
}

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView
 didTapAvatarImageView:(NSImageView *)avatarImageView
           atIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView didTapMessageBubbleAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView
 didTapCellAtIndexPath:(NSIndexPath *)indexPath
         touchLocation:(CGPoint)touchLocation
{
    
}

#pragma mark - Collection view utilities

- (void)kt_updateCollectionViewInsets
{
    //TODO:
//    [self kt_setCollectionViewInsetsTopValue:self.topLayoutGuide.length + self.topContentAdditionalInset
//                                  bottomValue:CGRectGetMaxY(self.collectionView.frame) - CGRectGetMinY(self.inputToolbar.frame)];
}

- (void)kt_setCollectionViewInsetsTopValue:(CGFloat)top bottomValue:(CGFloat)bottom
{
    //TODO:
//    NSEdgeInsets insets = NSEdgeInsetsMake(top, 0.0f, bottom, 0.0f);
//    self.collectionView.Insets = insets;
//    self.collectionView.scrollIndicatorInsets = insets;
}

//- (BOOL)jsq_isMenuVisible
//{
//    //  check if cell copy menu is showing
//    //  it is only our menu if `selectedIndexPathForMenu` is not `nil`
//    return self.selectedIndexPathForMenu != nil && [[UIMenuController sharedMenuController] isMenuVisible];
//}


@end
