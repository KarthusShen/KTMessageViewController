//
//  KTMessagesLabel.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <AppKit/AppKit.h>

/**
 *  `KTMessagesLabel` is a subclass of `NSTextField` that adds support for a `textInsets` property,
 *  which is similar to the `textContainerInset` property of `UITextView`.
 */
@interface KTMessagesLabel : NSTextField

/**
 *  The inset of the text layout area within the label's content area. The default value is `NSEdgeInsetsZero`.
 *
 *  @discussion This property provides text margins for the text laid out in the label.
 *  The inset values provided must be greater than or equal to `0.0f`.
 */
@property (assign, nonatomic) NSEdgeInsets textInsets;

@end
