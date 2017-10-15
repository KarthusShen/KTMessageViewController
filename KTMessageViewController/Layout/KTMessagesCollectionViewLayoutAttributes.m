//
//  KTMessagesCollectionViewLayoutAttributes.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionViewLayoutAttributes.h"

@implementation KTMessagesCollectionViewLayoutAttributes

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
//        _messageBubbleFont = [NSFont preferredFontForTextStyle:NSFontTextStyleBody];
        _messageBubbleFont = [NSFont userFontOfSize:10.0f];//TODO:ajust the font
        _messageBubbleContainerViewWidth = 320.0f;
    }
    return self;
}

#pragma mark - Setters

- (void)setMessageBubbleFont:(NSFont *)messageBubbleFont
{
    NSParameterAssert(messageBubbleFont != nil);
    _messageBubbleFont = messageBubbleFont;
}

- (void)setMessageBubbleContainerViewWidth:(CGFloat)messageBubbleContainerViewWidth
{
    NSParameterAssert(messageBubbleContainerViewWidth > 0.0f);
    _messageBubbleContainerViewWidth = ceilf(messageBubbleContainerViewWidth);
}

- (void)setIncomingAvatarViewSize:(CGSize)incomingAvatarViewSize
{
    NSParameterAssert(incomingAvatarViewSize.width >= 0.0f && incomingAvatarViewSize.height >= 0.0f);
    _incomingAvatarViewSize = [self kt_correctedAvatarSizeFromSize:incomingAvatarViewSize];
}

- (void)setOutgoingAvatarViewSize:(CGSize)outgoingAvatarViewSize
{
    NSParameterAssert(outgoingAvatarViewSize.width >= 0.0f && outgoingAvatarViewSize.height >= 0.0f);
    _outgoingAvatarViewSize = [self kt_correctedAvatarSizeFromSize:outgoingAvatarViewSize];
}

- (void)setCellTopLabelHeight:(CGFloat)cellTopLabelHeight
{
    NSParameterAssert(cellTopLabelHeight >= 0.0f);
    _cellTopLabelHeight = [self kt_correctedLabelHeightForHeight:cellTopLabelHeight];
}

- (void)setMessageBubbleTopLabelHeight:(CGFloat)messageBubbleTopLabelHeight
{
    NSParameterAssert(messageBubbleTopLabelHeight >= 0.0f);
    _messageBubbleTopLabelHeight = [self kt_correctedLabelHeightForHeight:messageBubbleTopLabelHeight];
}

- (void)setCellBottomLabelHeight:(CGFloat)cellBottomLabelHeight
{
    NSParameterAssert(cellBottomLabelHeight >= 0.0f);
    _cellBottomLabelHeight = [self kt_correctedLabelHeightForHeight:cellBottomLabelHeight];
}

#pragma mark - Utilities

- (CGSize)kt_correctedAvatarSizeFromSize:(CGSize)size
{
    return CGSizeMake(ceilf(size.width), ceilf(size.height));
}

- (CGFloat)kt_correctedLabelHeightForHeight:(CGFloat)height
{
    return ceilf(height);
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object
{
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[self class]]) {
        return NO;
    }
    
    if (self.representedElementCategory == NSCollectionElementCategoryItem) {
        KTMessagesCollectionViewLayoutAttributes *layoutAttributes = (KTMessagesCollectionViewLayoutAttributes *)object;
        
        if (![layoutAttributes.messageBubbleFont isEqual:self.messageBubbleFont]
            || !NSEdgeInsetsEqual(layoutAttributes.textViewFrameInsets, self.textViewFrameInsets)
            || !NSEdgeInsetsEqual(layoutAttributes.textViewTextContainerInsets, self.textViewTextContainerInsets)
            || !CGSizeEqualToSize(layoutAttributes.incomingAvatarViewSize, self.incomingAvatarViewSize)
            || !CGSizeEqualToSize(layoutAttributes.outgoingAvatarViewSize, self.outgoingAvatarViewSize)
            || (int)layoutAttributes.messageBubbleContainerViewWidth != (int)self.messageBubbleContainerViewWidth
            || (int)layoutAttributes.cellTopLabelHeight != (int)self.cellTopLabelHeight
            || (int)layoutAttributes.messageBubbleTopLabelHeight != (int)self.messageBubbleTopLabelHeight
            || (int)layoutAttributes.cellBottomLabelHeight != (int)self.cellBottomLabelHeight) {
            return NO;
        }
    }
    
    return [super isEqual:object];
}

- (NSUInteger)hash
{
    return [self.indexPath hash];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    KTMessagesCollectionViewLayoutAttributes *copy = [super copyWithZone:zone];
    
    if (copy.representedElementCategory != NSCollectionElementCategoryItem) {
        return copy;
    }
    
    copy.messageBubbleFont = self.messageBubbleFont;
    copy.messageBubbleContainerViewWidth = self.messageBubbleContainerViewWidth;
    copy.textViewFrameInsets = self.textViewFrameInsets;
    copy.textViewTextContainerInsets = self.textViewTextContainerInsets;
    copy.incomingAvatarViewSize = self.incomingAvatarViewSize;
    copy.outgoingAvatarViewSize = self.outgoingAvatarViewSize;
    copy.cellTopLabelHeight = self.cellTopLabelHeight;
    copy.messageBubbleTopLabelHeight = self.messageBubbleTopLabelHeight;
    copy.cellBottomLabelHeight = self.cellBottomLabelHeight;
    
    return copy;
}


@end
