//
//  KTMediaItem.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMediaItem.h"

#import "KTMessagesMediaPlaceholderView.h"
#import "KTMessagesMediaViewBubbleImageMasker.h"

@interface KTMediaItem ()

@property (strong, nonatomic) NSView *cachedPlaceholderView;

@end

@implementation KTMediaItem

- (instancetype)init
{
    return [self initWithMaskAsOutgoing:YES];
}

- (instancetype)initWithMaskAsOutgoing:(BOOL)maskAsOutgoing
{
    self = [super init];
    if (self) {
        _appliesMediaViewMaskAsOutgoing = maskAsOutgoing;
        _cachedPlaceholderView = nil;
//        [[NSNotificationCenter defaultCenter] addObserver:self
//                                                 selector:@selector(didReceiveMemoryWarningNotification:)
//                                                     name:ApplicationDidReceiveMemoryWarningNotification
//                                                   object:nil];
    }
    return self;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setAppliesMediaViewMaskAsOutgoing:(BOOL)appliesMediaViewMaskAsOutgoing
{
    _appliesMediaViewMaskAsOutgoing = appliesMediaViewMaskAsOutgoing;
    _cachedPlaceholderView = nil;
}

//- (void)clearCachedMediaViews
//{
//    _cachedPlaceholderView = nil;
//}

//#pragma mark - Notifications
//
//- (void)didReceiveMemoryWarningNotification:(NSNotification *)notification
//{
//    [self clearCachedMediaViews];
//}

#pragma mark - JSQMessageMediaData protocol

- (NSView *)mediaView
{
    NSAssert(NO, @"Error! required method not implemented in subclass. Need to implement %s", __PRETTY_FUNCTION__);
    return nil;
}

- (CGSize)mediaViewDisplaySize
{
//    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) {
//        return CGSizeMake(315.0f, 225.0f);
//    }
//
//    return CGSizeMake(210.0f, 150.0f);
    
    return CGSizeMake(315.0f, 225.0f);
}

- (NSView *)mediaPlaceholderView
{
    if (self.cachedPlaceholderView == nil) {
        CGSize size = [self mediaViewDisplaySize];
        NSView *view = [KTMessagesMediaPlaceholderView viewWithActivityIndicator];
        view.frame = CGRectMake(0.0f, 0.0f, size.width, size.height);
        [KTMessagesMediaViewBubbleImageMasker applyBubbleImageMaskToMediaView:view isOutgoing:self.appliesMediaViewMaskAsOutgoing];
        self.cachedPlaceholderView = view;
    }
    
    return self.cachedPlaceholderView;
}

- (NSUInteger)mediaHash
{
    return self.hash;
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
    
    KTMediaItem *item = (KTMediaItem *)object;
    
    return self.appliesMediaViewMaskAsOutgoing == item.appliesMediaViewMaskAsOutgoing;
}

- (NSUInteger)hash
{
    return [NSNumber numberWithBool:self.appliesMediaViewMaskAsOutgoing].hash;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: appliesMediaViewMaskAsOutgoing=%@>",
            [self class], @(self.appliesMediaViewMaskAsOutgoing)];
}

- (id)debugQuickLookObject
{
    return [self mediaView] ?: [self mediaPlaceholderView];
}

#pragma mark - NSCoding

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _appliesMediaViewMaskAsOutgoing = [aDecoder decodeBoolForKey:NSStringFromSelector(@selector(appliesMediaViewMaskAsOutgoing))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:self.appliesMediaViewMaskAsOutgoing forKey:NSStringFromSelector(@selector(appliesMediaViewMaskAsOutgoing))];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithMaskAsOutgoing:self.appliesMediaViewMaskAsOutgoing];
}

@end
