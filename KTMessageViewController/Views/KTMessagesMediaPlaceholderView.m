//
//  KTMessagesMediaPlaceholderView.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/13.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesMediaPlaceholderView.h"

#import "NSColor+KTMessages.h"
#import "NSImage+KTMessages.h"

@implementation KTMessagesMediaPlaceholderView

#pragma mark - Init

+ (instancetype)viewWithActivityIndicator
{
    NSColor *lightGrayColor = [NSColor kt_messageBubbleLightGrayColor];
//    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
//    spinner.color = [lightGrayColor jsq_colorByDarkeningColorWithValue:0.4f];
    
    NSView *spinner = [[NSView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 120.0f)];
    
    KTMessagesMediaPlaceholderView *view = [[KTMessagesMediaPlaceholderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 120.0f)
                                                                                   backgroundColor:lightGrayColor
                                                                             activityIndicatorView:spinner];
    return view;
}

+ (instancetype)viewWithAttachmentIcon
{
    NSColor *lightGrayColor = [NSColor kt_messageBubbleLightGrayColor];
    NSImage *paperclip = [[NSImage kt_defaultAccessoryImage] kt_imageMaskedWithColor:[lightGrayColor kt_colorByDarkeningColorWithValue:0.4f]];
    NSImageView *imageView = [NSImageView imageViewWithImage:paperclip];
    
    KTMessagesMediaPlaceholderView *view =[[KTMessagesMediaPlaceholderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 200.0f, 120.0f)
                                                                                  backgroundColor:lightGrayColor
                                                                                        imageView:imageView];
    return view;
}

- (instancetype)initWithFrame:(CGRect)frame
backgroundColor:(NSColor *)backgroundColor
activityIndicatorView:(NSView *)activityIndicatorView
{
    NSParameterAssert(activityIndicatorView != nil);
    
    self = [self initWithFrame:frame backgroundColor:backgroundColor];
    if (self) {
        [self addSubview:activityIndicatorView];
        _activityIndicatorView = activityIndicatorView;
//        _activityIndicatorView.center = self.center;
//        [_activityIndicatorView startAnimating];
        _imageView = nil;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
backgroundColor:(NSColor *)backgroundColor
imageView:(NSImageView *)imageView
{
    NSParameterAssert(imageView != nil);
    
    self = [self initWithFrame:frame backgroundColor:backgroundColor];
    if (self) {
        [self addSubview:imageView];
        _imageView = imageView;
        //_imageView.center = self.center;
        _activityIndicatorView = nil;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame backgroundColor:(NSColor *)backgroundColor
{
    NSParameterAssert(!CGRectEqualToRect(frame, CGRectNull));
    NSParameterAssert(!CGRectEqualToRect(frame, CGRectZero));
    NSParameterAssert(backgroundColor != nil);
    
    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = backgroundColor;
//        self.userInteractionEnabled = NO;
//        self.clipsToBounds = YES;
//        self.contentMode = UIViewContentModeScaleAspectFill;
//    }
    return self;
}

#pragma mark - Layout

//- (void)layoutSubviews
//{
//    [super layoutSubviews];
//
//    if (self.activityIndicatorView) {
//        self.activityIndicatorView.center = self.center;
//    }
//    else if (self.imageView) {
//        self.imageView.center = self.center;
//    }
//}

- (void)layoutSubtreeIfNeeded
{
    [super layoutSubtreeIfNeeded];
}

@end
