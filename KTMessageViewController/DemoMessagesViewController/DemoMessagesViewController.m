//
//  DemoMessagesViewController.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/21.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "DemoMessagesViewController.h"

@interface DemoMessagesViewController ()

@end

@implementation DemoMessagesViewController

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"KTMessages";
    
    /**
     *  Init sender info
     */
    self.senderId = kKTDemoAvatarIdSquires;
    self.senderDisplayName = kKTDemoAvatarDisplayNameSquires;
    
    /**
     *  Load fake data for the demo
     */
    self.demoData = [[DemoModelData alloc] init];
}

#pragma mark - JSQMessages CollectionView DataSource

- (id<KTMessageData>)collectionView:(KTMessagesCollectionView *)collectionView messageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.demoData.messages objectAtIndex:indexPath.item];
}

- (void)collectionView:(KTMessagesCollectionView *)collectionView didDeleteMessageAtIndexPath:(NSIndexPath *)indexPath
{
    [self.demoData.messages removeObjectAtIndex:indexPath.item];
}

- (id<KTMessageBubbleImageDataSource>)collectionView:(KTMessagesCollectionView *)collectionView messageBubbleImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId])
    {
        return self.demoData.outgoingBubbleImageData;
    }
    else
    {
        return self.demoData.incomingBubbleImageData;
    }
}

- (id<KTMessageAvatarImageDataSource>)collectionView:(KTMessagesCollectionView *)collectionView avatarImageDataForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    return [self.demoData.avatars objectForKey:message.senderId];
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item %3 == 0 )
    {
        KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
        return [[KTMessagesTimestampFormatter sharedFormatter] attributedTimestampForDate:message.date];
    }
    return nil;
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if ([message.senderId isEqualToString:self.senderId])
    {
        return nil;
    }
    
    return [[NSAttributedString alloc]initWithString:message.senderDisplayName];
}

- (NSAttributedString *)collectionView:(KTMessagesCollectionView *)collectionView attributedTextForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

#pragma mark - NSCollectionView DataSource

- (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.demoData.messages count];
}

- (NSCollectionViewItem *)collectionView:(KTMessagesCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessagesCollectionViewCell *cell = (KTMessagesCollectionViewCell *)[super collectionView:collectionView itemForRepresentedObjectAtIndexPath:indexPath];
    
    KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    
    if (!message.isMediaMessage)
    {
        if ([message.senderId isEqualToString:self.senderId])
        {
            cell.textView.textColor = [NSColor blackColor];
        }
        else
        {
            cell.textView.textColor = [NSColor whiteColor];
        }
        
//        cell.textView.linkTextAttributes = @{NSForegroundColorAttributeName : cell.textView.textColor,
//                                             NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle | NSUnderlinePatternSolid)};
    }
    
    return cell;
}

#pragma  mark - KTmessages collection view flow layout delegate

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item % 3 == 0)
    {
        return kKTMessagesCollectionViewCellLabelHeightDefault;
    }
    return 0.0f;
}

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForMessageBubbleTopLabelAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessage *message = [self.demoData.messages objectAtIndex:indexPath.item];
    if ([message.senderId isEqualToString:self.senderId])
    {
        return 0.0f;
    }
    
    return kKTMessagesCollectionViewCellLabelHeightDefault;
}

- (CGFloat)collectionView:(KTMessagesCollectionView *)collectionView
                   layout:(KTMessagesCollectionViewFlowLayout *)collectionViewLayout heightForCellBottomLabelAtIndexPath:(NSIndexPath *)indexPath
{
    return 0.0f;
}


@end
