//
//  KTPhotoMediaItem.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMediaItem.h"

/**
 *  The `KTPhotoMediaItem` class is a concrete `KTMediaItem` subclass that implements the `KTMessageMediaData` protocol
 *  and represents a photo media message. An initialized `KTPhotoMediaItem` object can be passed
 *  to a `KTMediaMessage` object during its initialization to construct a valid media message object.
 *  You may wish to subclass `KTPhotoMediaItem` to provide additional functionality or behavior.
 */
@interface KTPhotoMediaItem : KTMediaItem <KTMessageMediaData, NSCoding, NSCopying>

/**
 *  The image for the photo media item. The default value is `nil`.
 */
@property (copy, nonatomic) NSImage *image;

/**
 *  Initializes and returns a photo media item object having the given image.
 *
 *  @param image The image for the photo media item. This value may be `nil`.
 *
 *  @return An initialized `KTPhotoMediaItem` if successful, `nil` otherwise.
 *
 *  @discussion If the image must be dowloaded from the network,
 *  you may initialize a `KTPhotoMediaItem` object with a `nil` image.
 *  Once the image has been retrieved, you can then set the image property.
 */
- (instancetype)initWithImage:(NSImage *)image;

@end

