//
//  KTMessagesAvatarImage.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/12.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesAvatarImage.h"

@implementation KTMessagesAvatarImage

#pragma mark - Initialization

+ (instancetype)avatarWithImage:(NSImage *)image
{
    NSParameterAssert(image != nil);
    
    return [[KTMessagesAvatarImage alloc] initWithAvatarImage:image
                                              highlightedImage:image
                                              placeholderImage:image];
}

+ (instancetype)avatarImageWithPlaceholder:(NSImage *)placeholderImage
{
    return [[KTMessagesAvatarImage alloc] initWithAvatarImage:nil
                                              highlightedImage:nil
                                              placeholderImage:placeholderImage];
}

- (instancetype)initWithAvatarImage:(NSImage *)avatarImage
                   highlightedImage:(NSImage *)highlightedImage
                   placeholderImage:(NSImage *)placeholderImage
{
    NSParameterAssert(placeholderImage != nil);
    
    self = [super init];
    if (self) {
        _avatarImage = avatarImage;
        _avatarHighlightedImage = highlightedImage;
        _avatarPlaceholderImage = placeholderImage;
    }
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: avatarImage=%@, avatarHighlightedImage=%@, avatarPlaceholderImage=%@>",
            [self class], self.avatarImage, self.avatarHighlightedImage, self.avatarPlaceholderImage];
}

- (id)debugQuickLookObject
{
    return [NSImageView imageViewWithImage:self.avatarImage ?: self.avatarPlaceholderImage];
}

#pragma mark - NSCopying

- (instancetype)copyWithZone:(NSZone *)zone
{
    //TODO:Maybe we should use CGImage
    return [[[self class] allocWithZone:zone] initWithAvatarImage:self.avatarImage
                                                 highlightedImage:self.avatarHighlightedImage
                                                 placeholderImage:self.avatarPlaceholderImage];
}

@end
