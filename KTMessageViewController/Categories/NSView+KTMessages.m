//
//  NSView+KTMessages.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/13.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "NSView+KTMessages.h"

@implementation NSView (KTMessages)

- (void)kt_pinSubview:(NSView *)subview toEdge:(NSLayoutAttribute)attribute
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:attribute
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:subview
                                                     attribute:attribute
                                                    multiplier:1.0f
                                                      constant:0.0f]];
}

- (void)kt_pinAllEdgesOfSubview:(NSView *)subview
{
    [self kt_pinSubview:subview toEdge:NSLayoutAttributeBottom];
    [self kt_pinSubview:subview toEdge:NSLayoutAttributeTop];
    [self kt_pinSubview:subview toEdge:NSLayoutAttributeLeading];
    [self kt_pinSubview:subview toEdge:NSLayoutAttributeTrailing];
}

@end
