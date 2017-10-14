//
//  KTAudioMediaViewAttributes.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <AppKit/AppKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 An instance of `KTAudioMediaViewAttributes` specifies the appearance configuration of a `KTAudioMediaItem`.
 Use this class to customize the appearance of `KTAudioMediaItem`.
 */
@interface KTAudioMediaViewAttributes : NSObject

/**
 *  The image for the play button. The default is a play icon.
 */
@property (nonatomic, strong) NSImage *playButtonImage;

/**
 *  The image for the pause button. The default is a pause icon.
 */
@property (nonatomic, strong) NSImage *pauseButtonImage;

/**
 *  The font for the elapsed time label. The default is a system font.
 */
@property (strong, nonatomic) NSFont *labelFont;

/**
 *  Specifies whether to show fractions of a second for audio files with a duration of less than 1 minute.
 */
@property (nonatomic, assign) BOOL showFractionalSeconds;

/**
 *  The background color for the player.
 */
@property (nonatomic, strong) NSColor *backgroundColor;

/**
 *  The tint color for the player.
 */
@property (nonatomic, strong) NSColor *tintColor;

/**
 *  Insets that sepcify the padding around the play/pause button and time label.
 */
@property (nonatomic, assign) NSEdgeInsets controlInsets;

/**
 *  Specifies the padding between the button, progress bar, and label.
 */
@property (nonatomic, assign) CGFloat controlPadding;

/**
 *  Specifies the audio category set prior to playback.
 */
@property (nonatomic, copy) NSString *audioCategory;

/**
 *  Specifies the audio category options set prior to playback.
 */
//@property (nonatomic) AVAudioSessionCategoryOptions audioCategoryOptions;
@property (nonatomic) NSInteger audioCategoryOptions;

/**
 Initializes and returns a `JSQAudioMediaViewAttributes` instance having the specified attributes.
 
 @param playButtonImage        The image for the play button.
 @param pauseButtonImage      The image for the pause button.
 @param labelFont             The font for the elapsed time label.
 @param showFractionalSeconds Specifies whether to show fractions of a second for audio files with a duration of less than 1 minute.
 @param backgroundColor       The background color for the player.
 @param tintColor             The tint color for the player.
 @param controlInsets         Insets that sepcify the padding around the play/pause button and time label.
 @param controlPadding        Specifies the padding between the button, progress bar, and label.
 @param audioCategory         Specifies the audio category set prior to playback.
 @param audioCategoryOptions  Specifies the audio category options set prior to playback.
 
 @return A new `JSQAudioMediaViewAttributes` instance
 */
- (instancetype)initWithPlayButtonImage:(NSImage *)playButtonImage
                       pauseButtonImage:(NSImage *)pauseButtonImage
                              labelFont:(NSFont *)labelFont
                  showFractionalSecodns:(BOOL)showFractionalSeconds
                        backgroundColor:(NSColor *)backgroundColor
                              tintColor:(NSColor *)tintColor
                          controlInsets:(NSEdgeInsets)controlInsets
                         controlPadding:(CGFloat)controlPadding
                          audioCategory:(NSString *)audioCategory
                   audioCategoryOptions:(NSInteger)audioCategoryOptions NS_DESIGNATED_INITIALIZER;

/**
 Initializes and returns a default `JSQAudioMediaViewAttributes` instance.
 
 @return A new `JSQAudioMediaViewAttributes` instance
 */
- (instancetype)init;


@end
NS_ASSUME_NONNULL_END
