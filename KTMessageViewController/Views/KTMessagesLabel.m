//
//  KTMessagesLabel.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesLabel.h"

@implementation KTMessagesLabel

#pragma mark - Initialization

- (void)kt_configureLabel
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.textInsets = NSEdgeInsetsZero;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self kt_configureLabel];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self kt_configureLabel];
}

#pragma mark - Setters

- (void)setTextInsets:(NSEdgeInsets)textInsets
{
    if (NSEdgeInsetsEqual(_textInsets, textInsets)) {
        return;
    }
    
    _textInsets = textInsets;
    [self setNeedsDisplay];
}

#pragma mark - Drawing

//TODO: drawing
//- (void)drawTextInRect:(CGRect)rect
//{
//    [super drawTextInRect:CGRectMake(CGRectGetMinX(rect) + self.textInsets.left,
//                                     CGRectGetMinY(rect) + self.textInsets.top,
//                                     CGRectGetWidth(rect) - self.textInsets.right,
//                                     CGRectGetHeight(rect) - self.textInsets.bottom)];
//}

@end

