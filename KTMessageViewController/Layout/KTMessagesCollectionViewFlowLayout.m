//
//  KTMessagesCollectionViewFlowLayout.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionViewFlowLayout.h"

#import "KTMessageData.h"

#import "KTMessagesCollectionView.h"
#import "KTMessagesCollectionViewCell.h"

#import "KTMessagesCollectionViewLayoutAttributes.h"
#import "KTMessagesCollectionViewFlowLayoutInvalidationContext.h"
#import "KTMessagesBubblesSizeCalculator.h"

#import "NSImage+KTMessages.h"

const CGFloat kKTMessagesCollectionViewCellLabelHeightDefault = 20.0f;
const CGFloat kKTMessagesCollectionViewAvatarSizeDefault = 30.0f;

@interface KTMessagesCollectionViewFlowLayout ()

//@property (strong, nonatomic) UIDynamicAnimator *dynamicAnimator;
@property (strong, nonatomic) NSMutableSet *visibleIndexPaths;

@property (assign, nonatomic) CGFloat latestDelta;

@end

@implementation KTMessagesCollectionViewFlowLayout

@dynamic collectionView;

@synthesize bubbleSizeCalculator = _bubbleSizeCalculator;

#pragma mark - Initialization

-(void)kt_configureFlowLayout
{
    self.scrollDirection = NSCollectionViewScrollDirectionVertical;
    self.sectionInset = NSEdgeInsetsMake(10.0f, 4.0f, 10.0f, 4.0f);
    self.minimumLineSpacing = 4.0f;
    
    //_messageBubbleFont = [NSFont preferredFontForTextStyle:UIFontTextStyleBody];
    _messageBubbleFont =[NSFont userFontOfSize:10.0f];//TODO: adust the font
    
    _messageBubbleLeftRightMargin = 50.0f;
    
    _messageBubbleTextViewFrameInsets = NSEdgeInsetsMake(0.0f, 0.0f, 0.0f, 6.0f);
    _messageBubbleTextViewTextContainerInsets = NSEdgeInsetsMake(7.0f, 14.0f, 7.0f, 14.0f);
    
    CGSize defaultAvatarSize = CGSizeMake(kKTMessagesCollectionViewAvatarSizeDefault, kKTMessagesCollectionViewAvatarSizeDefault);
    _incomingAvatarViewSize = defaultAvatarSize;
    _outgoingAvatarViewSize = defaultAvatarSize;
    
    _springinessEnabled = NO;
    _springResistanceFactor = 1000;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self kt_configureFlowLayout];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self kt_configureFlowLayout];
}

+ (Class)layoutAttributesClass
{
    return [KTMessagesCollectionViewLayoutAttributes class];
}

+ (Class)invalidationContextClass
{
    return [KTMessagesCollectionViewFlowLayoutInvalidationContext class];
}

- (void)dealloc
{
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Setters

- (void)setBubbleSizeCalculator:(id<KTMessagesBubbleSizeCalculating>)bubbleSizeCalculator
{
    NSParameterAssert(bubbleSizeCalculator != nil);
    _bubbleSizeCalculator = bubbleSizeCalculator;
}

- (void)setSpringinessEnabled:(BOOL)springinessEnabled
{
    if (_springinessEnabled == springinessEnabled) {
        return;
    }
    
    _springinessEnabled = springinessEnabled;
    
    if (!springinessEnabled) {
        //[_dynamicAnimator removeAllBehaviors];
        [_visibleIndexPaths removeAllObjects];
    }
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

- (void)setMessageBubbleFont:(NSFont *)messageBubbleFont
{
    if ([_messageBubbleFont isEqual:messageBubbleFont]) {
        return;
    }
    
    NSParameterAssert(messageBubbleFont != nil);
    _messageBubbleFont = messageBubbleFont;
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

- (void)setMessageBubbleLeftRightMargin:(CGFloat)messageBubbleLeftRightMargin
{
    NSParameterAssert(messageBubbleLeftRightMargin >= 0.0f);
    _messageBubbleLeftRightMargin = ceilf(messageBubbleLeftRightMargin);
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

- (void)setMessageBubbleTextViewTextContainerInsets:(NSEdgeInsets)messageBubbleTextContainerInsets
{
    if (NSEdgeInsetsEqual(_messageBubbleTextViewTextContainerInsets,
                          messageBubbleTextContainerInsets))
    {
        return;
    }
    
    _messageBubbleTextViewTextContainerInsets = messageBubbleTextContainerInsets;
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

- (void)setIncomingAvatarViewSize:(CGSize)incomingAvatarViewSize
{
    if (CGSizeEqualToSize(_incomingAvatarViewSize, incomingAvatarViewSize)) {
        return;
    }
    
    _incomingAvatarViewSize = incomingAvatarViewSize;
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

- (void)setOutgoingAvatarViewSize:(CGSize)outgoingAvatarViewSize
{
    if (CGSizeEqualToSize(_outgoingAvatarViewSize, outgoingAvatarViewSize)) {
        return;
    }
    
    _outgoingAvatarViewSize = outgoingAvatarViewSize;
    [self invalidateLayoutWithContext:[KTMessagesCollectionViewFlowLayoutInvalidationContext context]];
}

#pragma mark - Getters

- (CGFloat)itemWidth
{
    return CGRectGetWidth(self.collectionView.frame) - self.sectionInset.left - self.sectionInset.right;
}

//- (UIDynamicAnimator *)dynamicAnimator
//{
//    if (!_dynamicAnimator) {
//        _dynamicAnimator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
//    }
//    return _dynamicAnimator;
//}

- (NSMutableSet *)visibleIndexPaths
{
    if (!_visibleIndexPaths) {
        _visibleIndexPaths = [NSMutableSet new];
    }
    return _visibleIndexPaths;
}

- (id<KTMessagesBubbleSizeCalculating>)bubbleSizeCalculator
{
    if (_bubbleSizeCalculator == nil) {
        _bubbleSizeCalculator = [KTMessagesBubblesSizeCalculator new];
    }
    
    return _bubbleSizeCalculator;
}

#pragma mark - Collection view flow layout

- (void)invalidateLayoutWithContext:(KTMessagesCollectionViewFlowLayoutInvalidationContext *)context
{
    if (context.invalidateDataSourceCounts) {
        context.invalidateFlowLayoutAttributes = YES;
        context.invalidateFlowLayoutDelegateMetrics = YES;
    }
    
    if (context.invalidateFlowLayoutAttributes
        || context.invalidateFlowLayoutDelegateMetrics) {
        [self kt_resetDynamicAnimator];
    }
    
    if (context.invalidateFlowLayoutMessagesCache) {
        [self kt_resetLayout];
    }
    
    [super invalidateLayoutWithContext:context];
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    if (self.springinessEnabled) {
        //  pad rect to avoid flickering
        CGFloat padding = -100.0f;
        CGRect visibleRect = CGRectInset(self.collectionView.bounds, padding, padding);
        
        NSArray *visibleItems = [super layoutAttributesForElementsInRect:visibleRect];
        NSSet *visibleItemsIndexPaths = [NSSet setWithArray:[visibleItems valueForKey:NSStringFromSelector(@selector(indexPath))]];
        
        [self kt_removeNoLongerVisibleBehaviorsFromVisibleItemsIndexPaths:visibleItemsIndexPaths];
        
        [self kt_addNewlyVisibleBehaviorsFromVisibleItems:visibleItems];
    }
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *attributesInRect = [[super layoutAttributesForElementsInRect:rect] copy];
    
//    if (self.springinessEnabled)
//    {
//        NSMutableArray *attributesInRectCopy = [attributesInRect mutableCopy];
//        NSArray *dynamicAttributes = [self.dynamicAnimator itemsInRect:rect];
//
//        //  avoid duplicate attributes
//        //  use dynamic animator attribute item instead of regular item, if it exists
//        for (NSCollectionViewLayoutAttributes *eachItem in attributesInRect) {
//
//            for (NSCollectionViewLayoutAttributes *eachDynamicItem in dynamicAttributes) {
//                if ([eachItem.indexPath isEqual:eachDynamicItem.indexPath]
//                    && eachItem.representedElementCategory == eachDynamicItem.representedElementCategory) {
//
//                    [attributesInRectCopy removeObject:eachItem];
//                    [attributesInRectCopy addObject:eachDynamicItem];
//                    continue;
//                }
//            }
//        }
//
//        attributesInRect = [attributesInRectCopy copy];
//    }
    
    [attributesInRect enumerateObjectsUsingBlock:^(KTMessagesCollectionViewLayoutAttributes *attributesItem, NSUInteger idx, BOOL *stop) {
        if (attributesItem.representedElementCategory == NSCollectionElementCategoryItem) {
            [self kt_configureMessageCellLayoutAttributes:attributesItem];
        }
        else {
            attributesItem.zIndex = -1;
        }
    }];
    
    return attributesInRect;
}

- (NSCollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KTMessagesCollectionViewLayoutAttributes *customAttributes = (KTMessagesCollectionViewLayoutAttributes *)[[super layoutAttributesForItemAtIndexPath:indexPath] copy];
    
    if (customAttributes.representedElementCategory == NSCollectionElementCategoryItem) {
        [self kt_configureMessageCellLayoutAttributes:customAttributes];
    }
    
    return customAttributes;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
//    if (self.springinessEnabled) {
//        UIScrollView *scrollView = self.collectionView;
//        CGFloat delta = newBounds.origin.y - scrollView.bounds.origin.y;
//
//        self.latestDelta = delta;
//
//        CGPoint touchLocation = [self.collectionView.panGestureRecognizer locationInView:self.collectionView];
//
//        [self.dynamicAnimator.behaviors enumerateObjectsUsingBlock:^(UIAttachmentBehavior *springBehaviour, NSUInteger idx, BOOL *stop) {
//            [self jsq_adjustSpringBehavior:springBehaviour forTouchLocation:touchLocation];
//            [self.dynamicAnimator updateItemUsingCurrentState:[springBehaviour.items firstObject]];
//        }];
//    }
    
    CGRect oldBounds = self.collectionView.bounds;
    if (CGRectGetWidth(newBounds) != CGRectGetWidth(oldBounds)) {
        return YES;
    }
    
    return NO;
}

- (void)prepareForCollectionViewUpdates:(NSArray *)updateItems
{
    [super prepareForCollectionViewUpdates:updateItems];
    
    [updateItems enumerateObjectsUsingBlock:^(NSCollectionViewUpdateItem *updateItem, NSUInteger index, BOOL *stop) {
        if (updateItem.updateAction == NSCollectionUpdateActionInsert) {
            
//            if (self.springinessEnabled && [self.dynamicAnimator layoutAttributesForCellAtIndexPath:updateItem.indexPathAfterUpdate]) {
//                *stop = YES;
//            }
            
            CGFloat collectionViewHeight = CGRectGetHeight(self.collectionView.bounds);
            
//            KTMessagesCollectionViewLayoutAttributes *attributes = [KTMessagesCollectionViewLayoutAttributes layoutAttributesForItemAtIndexPath:updateItem.indexPathAfterUpdate];
            KTMessagesCollectionViewLayoutAttributes *attributes = [KTMessagesCollectionViewLayoutAttributes layoutAttributesForItemWithIndexPath:updateItem.indexPathAfterUpdate];
            
            if (attributes.representedElementCategory == NSCollectionElementCategoryItem) {
                [self kt_configureMessageCellLayoutAttributes:attributes];
            }
            
            attributes.frame = CGRectMake(0.0f,
                                          collectionViewHeight + CGRectGetHeight(attributes.frame),
                                          CGRectGetWidth(attributes.frame),
                                          CGRectGetHeight(attributes.frame));
            
//            if (self.springinessEnabled) {
//                UIAttachmentBehavior *springBehaviour = [self jsq_springBehaviorWithLayoutAttributesItem:attributes];
//                [self.dynamicAnimator addBehavior:springBehaviour];
//            }
        }
    }];
}

#pragma mark - Invalidation utilities

- (void)kt_resetLayout
{
    [self.bubbleSizeCalculator prepareForResettingLayout:self];
    [self kt_resetDynamicAnimator];
}

- (void)kt_resetDynamicAnimator
{
    if (self.springinessEnabled) {
        //[self.dynamicAnimator removeAllBehaviors];
        [self.visibleIndexPaths removeAllObjects];
    }
}

#pragma mark - Message cell layout utilities

- (CGSize)messageBubbleSizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id<KTMessageData> messageItem = [self.collectionView.dataSource collectionView:self.collectionView
                                                      messageDataForItemAtIndexPath:indexPath];
    
    return [self.bubbleSizeCalculator messageBubbleSizeForMessageData:messageItem
                                                          atIndexPath:indexPath
                                                           withLayout:self];
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize messageBubbleSize = [self messageBubbleSizeForItemAtIndexPath:indexPath];
    KTMessagesCollectionViewLayoutAttributes *attributes = (KTMessagesCollectionViewLayoutAttributes *)[self layoutAttributesForItemAtIndexPath:indexPath];
    
    CGFloat finalHeight = messageBubbleSize.height;
    finalHeight += attributes.cellTopLabelHeight;
    finalHeight += attributes.messageBubbleTopLabelHeight;
    finalHeight += attributes.cellBottomLabelHeight;
    
    return CGSizeMake(self.itemWidth, ceilf(finalHeight));
}

- (void)kt_configureMessageCellLayoutAttributes:(KTMessagesCollectionViewLayoutAttributes *)layoutAttributes
{
    NSIndexPath *indexPath = layoutAttributes.indexPath;
    
    CGSize messageBubbleSize = [self messageBubbleSizeForItemAtIndexPath:indexPath];
    
    layoutAttributes.messageBubbleContainerViewWidth = messageBubbleSize.width;
    
    layoutAttributes.textViewFrameInsets = self.messageBubbleTextViewFrameInsets;
    
    layoutAttributes.textViewTextContainerInsets = self.messageBubbleTextViewTextContainerInsets;
    
    layoutAttributes.messageBubbleFont = self.messageBubbleFont;
    
    layoutAttributes.incomingAvatarViewSize = self.incomingAvatarViewSize;
    
    layoutAttributes.outgoingAvatarViewSize = self.outgoingAvatarViewSize;
    
    layoutAttributes.cellTopLabelHeight = [self.collectionView.delegate collectionView:self.collectionView
                                                                                layout:self
                                                      heightForCellTopLabelAtIndexPath:indexPath];
    
    layoutAttributes.messageBubbleTopLabelHeight = [self.collectionView.delegate collectionView:self.collectionView
                                                                                         layout:self
                                                      heightForMessageBubbleTopLabelAtIndexPath:indexPath];
    
    layoutAttributes.cellBottomLabelHeight = [self.collectionView.delegate collectionView:self.collectionView
                                                                                   layout:self
                                                      heightForCellBottomLabelAtIndexPath:indexPath];
}

#pragma mark - Spring behavior utilities

//- (UIAttachmentBehavior *)kt_springBehaviorWithLayoutAttributesItem:(UICollectionViewLayoutAttributes *)item
//{
//    if (CGSizeEqualToSize(item.frame.size, CGSizeZero)) {
//        // adding a spring behavior with zero size will fail in in -prepareForCollectionViewUpdates:
//        return nil;
//    }
//
//    UIAttachmentBehavior *springBehavior = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
//    springBehavior.length = 1.0f;
//    springBehavior.damping = 1.0f;
//    springBehavior.frequency = 1.0f;
//    return springBehavior;
//}

- (void)kt_addNewlyVisibleBehaviorsFromVisibleItems:(NSArray *)visibleItems
{
    //  a "newly visible" item is in `visibleItems` but not in `self.visibleIndexPaths`
    NSIndexSet *indexSet = [visibleItems indexesOfObjectsPassingTest:^BOOL(NSCollectionViewLayoutAttributes *item, NSUInteger index, BOOL *stop) {
        return ![self.visibleIndexPaths containsObject:item.indexPath];
    }];
    
    NSArray *newlyVisibleItems = [visibleItems objectsAtIndexes:indexSet];
    
//    CGPoint touchLocation = [self.collectionView.panGestureRecognizer locationInView:self.collectionView];
    
//    [newlyVisibleItems enumerateObjectsUsingBlock:^(NSCollectionViewLayoutAttributes *item, NSUInteger index, BOOL *stop) {
//        UIAttachmentBehavior *springBehaviour = [self kt_springBehaviorWithLayoutAttributesItem:item];
//        [self kt_adjustSpringBehavior:springBehaviour forTouchLocation:touchLocation];
//        [self.dynamicAnimator addBehavior:springBehaviour];
//        [self.visibleIndexPaths addObject:item.indexPath];
//    }];
}

- (void)kt_removeNoLongerVisibleBehaviorsFromVisibleItemsIndexPaths:(NSSet *)visibleItemsIndexPaths
{
//    NSArray *behaviors = self.dynamicAnimator.behaviors;
//
//    NSIndexSet *indexSet = [behaviors indexesOfObjectsPassingTest:^BOOL(UIAttachmentBehavior *springBehaviour, NSUInteger index, BOOL *stop) {
//        NSCollectionViewLayoutAttributes *layoutAttributes = (UICollectionViewLayoutAttributes *)[springBehaviour.items firstObject];
//        return ![visibleItemsIndexPaths containsObject:layoutAttributes.indexPath];
//    }];
//
//    NSArray *behaviorsToRemove = [self.dynamicAnimator.behaviors objectsAtIndexes:indexSet];
//
//    [behaviorsToRemove enumerateObjectsUsingBlock:^(UIAttachmentBehavior *springBehaviour, NSUInteger index, BOOL *stop) {
//        UICollectionViewLayoutAttributes *layoutAttributes = (UICollectionViewLayoutAttributes *)[springBehaviour.items firstObject];
//        [self.dynamicAnimator removeBehavior:springBehaviour];
//        [self.visibleIndexPaths removeObject:layoutAttributes.indexPath];
//    }];
}

//- (void)kt_adjustSpringBehavior:(UIAttachmentBehavior *)springBehavior forTouchLocation:(CGPoint)touchLocation
//{
//    NSCollectionViewLayoutAttributes *item = (NSCollectionViewLayoutAttributes *)[springBehavior.items firstObject];
//    CGPoint center = item.center;
//
//    //  if touch is not (0,0) -- adjust item center "in flight"
//    if (!CGPointEqualToPoint(CGPointZero, touchLocation)) {
//        CGFloat distanceFromTouch = fabs(touchLocation.y - springBehavior.anchorPoint.y);
//        CGFloat scrollResistance = distanceFromTouch / self.springResistanceFactor;
//
//        if (self.latestDelta < 0.0f) {
//            center.y += MAX(self.latestDelta, self.latestDelta * scrollResistance);
//        }
//        else {
//            center.y += MIN(self.latestDelta, self.latestDelta * scrollResistance);
//        }
//        item.center = center;
//    }
//}
@end
