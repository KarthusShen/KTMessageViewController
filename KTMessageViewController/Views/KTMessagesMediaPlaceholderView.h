//
//  KTMEssagesMediaPlaceholderView.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/13.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>

/**
 *  A `KTMessagesMediaPlaceholderView` object represents a loading or placeholder
 *  view for media message objects whose media attachments are not yet available.
 *  When sending or receiving media messages that must be uploaded or downloaded from the network,
 *  you may display this view temporarily until the media attachement is available.
 *  You should return an instance of this class from the `mediaPlaceholderView` method in
 *  the `KTMessageMediaData` protocol.
 *
 *  @see KTMessageMediaData.
 */
@interface KTMessagesMediaPlaceholderView : NSView

/**
 *  Returns the activity indicator view for this placeholder view, or `nil` if it does not exist.
 */
@property (nonatomic, weak, readonly) NSView *activityIndicatorView;

/**
 *  Returns the image view for this placeholder view, or `nil` if it does not exist.
 */
@property (nonatomic, weak, readonly) NSImageView *imageView;

/**
 *  Creates a media placeholder view object with a light gray background and
 *  a centered activity indicator.
 *
 *  @discussion When initializing a `KTMessagesMediaPlaceholderView` with this method,
 *  its imageView property will be nil.
 *
 *  @return An initialized `KTMessagesMediaPlaceholderView` object if successful, `nil` otherwise.
 */
+ (instancetype)viewWithActivityIndicator;

/**
 *  Creates a media placeholder view object with a light gray background and
 *  a centered paperclip attachment icon.
 *
 *  @discussion When initializing a `KTMessagesMediaPlaceholderView` with this method,
 *  its activityIndicatorView property will be nil.
 *
 *  @return An initialized `KTMessagesMediaPlaceholderView` object if successful, `nil` otherwise.
 */
+ (instancetype)viewWithAttachmentIcon;

/**
 *  Creates a media placeholder view having the given frame, backgroundColor, and activityIndicatorView.
 *
 *  @param frame                 A rectangle defining the frame of the view. This value must be a non-zero, non-null rectangle.
 *  @param backgroundColor       The background color of the view. This value must not be `nil`.
 *  @param activityIndicatorView An initialized activity indicator to be added and centered in the view. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesMediaPlaceholderView` object if successful, `nil` otherwise.
 */
- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(NSColor *)backgroundColor
        activityIndicatorView:(NSView *)activityIndicatorView;

/**
 *  Creates a media placeholder view having the given frame, backgroundColor, and imageView.
 *
 *  @param frame           A rectangle defining the frame of the view. This value must be a non-zero, non-null rectangle.
 *  @param backgroundColor The background color of the view. This value must not be `nil`.
 *  @param imageView       An initialized image view to be added and centered in the view. This value must not be `nil`.
 *
 *  @return An initialized `KTMessagesMediaPlaceholderView` object if successful, `nil` otherwise.
 */
- (instancetype)initWithFrame:(CGRect)frame
              backgroundColor:(NSColor *)backgroundColor
                    imageView:(NSImageView *)imageView;


@end
