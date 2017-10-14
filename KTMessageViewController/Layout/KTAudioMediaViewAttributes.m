//
//  KTAudioMediaViewAttributes.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTAudioMediaViewAttributes.h"

#import "NSImage+KTMessages.h"
#import "NSColor+KTMessages.h"

@implementation KTAudioMediaViewAttributes

- (instancetype)initWithPlayButtonImage:(NSImage *)playButtonImage
                       pauseButtonImage:(NSImage *)pauseButtonImage
                              labelFont:(NSFont *)labelFont
                  showFractionalSecodns:(BOOL)showFractionalSeconds
                        backgroundColor:(NSColor *)backgroundColor
                              tintColor:(NSColor *)tintColor
                          controlInsets:(NSEdgeInsets)controlInsets
                         controlPadding:(CGFloat)controlPadding
                          audioCategory:(NSString *)audioCategory
                   audioCategoryOptions:(NSInteger)audioCategoryOptions {
    NSParameterAssert(playButtonImage != nil);
    NSParameterAssert(pauseButtonImage != nil);
    NSParameterAssert(labelFont != nil);
    NSParameterAssert(backgroundColor != nil);
    NSParameterAssert(tintColor != nil);
    NSParameterAssert(audioCategory != nil);
    
    self = [super init];
    if (self) {
        _playButtonImage = playButtonImage;
        _pauseButtonImage = pauseButtonImage;
        _labelFont = labelFont;
        _showFractionalSeconds = showFractionalSeconds;
        _backgroundColor = backgroundColor;
        _tintColor = tintColor;
        _controlInsets = controlInsets;
        _controlPadding = controlPadding;
        _audioCategory = audioCategory;
        _audioCategoryOptions = audioCategoryOptions;
    }
    return self;
}

- (instancetype)init
{
    NSColor *tintColor = [NSColor kt_messageBubbleBlueColor];
//    NSInteger options = AVAudioSessionCategoryOptionDuckOthers
//    | AVAudioSessionCategoryOptionDefaultToSpeaker
//    | AVAudioSessionCategoryOptionAllowBluetooth;
    
    NSInteger options = 0x2 | 0x8 | 0x4;
    
    return [self initWithPlayButtonImage:[[NSImage kt_defaultPlayImage] kt_imageMaskedWithColor:tintColor]
                        pauseButtonImage:[[NSImage kt_defaultPauseImage] kt_imageMaskedWithColor:tintColor]
                               labelFont:[NSFont systemFontOfSize:12]
                   showFractionalSecodns:NO
                         backgroundColor:[NSColor kt_messageBubbleLightGrayColor]
                               tintColor:tintColor
                           controlInsets:NSEdgeInsetsMake(6, 6, 6, 18)
                          controlPadding:6
                           audioCategory:@"AVAudioSessionCategoryPlayback"
                    audioCategoryOptions:options];
}

- (void)setPlayButtonImage:(NSImage *)playButtonImage
{
    NSParameterAssert(playButtonImage != nil);
    _playButtonImage = playButtonImage;
}

- (void)setPauseButtonImage:(NSImage *)pauseButtonImage
{
    NSParameterAssert(pauseButtonImage != nil);
    _pauseButtonImage = pauseButtonImage;
}

- (void)setLabelFont:(NSFont *)labelFont
{
    NSParameterAssert(labelFont != nil);
    _labelFont = labelFont;
}

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    NSParameterAssert(backgroundColor != nil);
    _backgroundColor = backgroundColor;
}

- (void)setTintColor:(NSColor *)tintColor
{
    NSParameterAssert(tintColor != nil);
    _tintColor = tintColor;
}

- (void)setAudioCategory:(NSString *)audioCategory
{
    NSParameterAssert(audioCategory != nil);
    _audioCategory = audioCategory;
}

@end
