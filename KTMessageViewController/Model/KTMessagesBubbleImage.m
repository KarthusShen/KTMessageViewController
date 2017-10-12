//
//  KTMessagesBubbleImage.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesBubbleImage.h"

@implementation KTMessagesBubbleImage

#pragma mark - Initialization

- (instancetype)initWithMessageBubbleImage:(NSImage *)image highlightedImage:(NSImage *)highlightedImage
{
    NSParameterAssert(image != nil);
    NSParameterAssert(highlightedImage != nil);
    
    self = [super init];
    if (self) {
        _messageBubbleImage = image;
        _messageBubbleHighlightedImage = highlightedImage;
    }
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: messageBubbleImage=%@, messageBubbleHighlightedImage=%@>",
            [self class], self.messageBubbleImage, self.messageBubbleHighlightedImage];
}


#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    return [[[self class] allocWithZone:zone] initWithMessageBubbleImage:self.messageBubbleImage
                                                        highlightedImage:self.messageBubbleHighlightedImage];
}


@end
