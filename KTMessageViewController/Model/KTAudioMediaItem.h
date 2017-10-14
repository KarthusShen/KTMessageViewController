//
//  KTAudioMediaItem.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/14.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#import "KTMediaItem.h"
#import "KTAudioMediaViewAttributes.h"

@class KTAudioMediaItem;

NS_ASSUME_NONNULL_BEGIN

@protocol KTAudioMediaItemDelegate <NSObject>

/**
 *  Tells the delegate if the specified `KTAudioMediaItem` changes the sound category or categoryOptions, or if an error occurs.
 */
- (void)audioMediaItem:(KTAudioMediaItem *)audioMediaItem
didChangeAudioCategory:(NSString *)category
               options:(NSInteger)options
                 error:(nullable NSError *)error;

@end

/**
 *  The `KTAudioMediaItem` class is a concrete `KTMediaItem` subclass that implements the `KTMessageMediaData` protocol
 *  and represents an audio media message. An initialized `KTAudioMediaItem` object can be passed
 *  to a `KTMediaMessage` object during its initialization to construct a valid media message object.
 *  You may wish to subclass `KTAudioMediaItem` to provide additional functionality or behavior.
 */
@interface KTAudioMediaItem : KTMediaItem <KTMessageMediaData, AVAudioPlayerDelegate, NSCoding, NSCopying>

/**
 *  The delegate object for audio event notifications.
 */
@property (nonatomic, weak, nullable) id<KTAudioMediaItemDelegate> delegate;

/**
 *  The view attributes to configure the appearance of the audio media view.
 */
@property (nonatomic, strong, readonly) KTAudioMediaViewAttributes *audioViewAttributes;

/**
 *  A data object that contains an audio resource.
 */
@property (nonatomic, strong, nullable) NSData *audioData;

/**
 *  Initializes and returns a audio media item having the given audioData.
 *
 *  @param audioData              The data object that contains the audio resource.
 *  @param audioViewConfiguration The view attributes to configure the appearance of the audio media view.
 *
 *  @return An initialized `KTAudioMediaItem`.
 *
 *  @discussion If the audio must be downloaded from the network,
 *  you may initialize a `KTVideoMediaItem` with a `nil` audioData.
 *  Once the audio is available you can set the `audioData` property.
 */
- (instancetype)initWithData:(nullable NSData *)audioData
         audioViewAttributes:(KTAudioMediaViewAttributes *)audioViewAttributes NS_DESIGNATED_INITIALIZER;

/**
 *  Initializes and returns a default audio media item.
 *
 *  @return An initialized `KTAudioMediaItem`.
 *
 *  @discussion You must set `audioData` to enable the play button.
 */
- (instancetype)init;

/**
 Initializes and returns a default audio media using the specified view attributes.
 
 @param audioViewAttributes The view attributes to configure the appearance of the audio media view.
 
 @return  An initialized `KTAudioMediaItem`.
 */
- (instancetype)initWithAudioViewAttributes:(KTAudioMediaViewAttributes *)audioViewAttributes;

/**
 *  Initializes and returns an audio media item having the given audioData.
 *
 *  @param audioData The data object that contains the audio resource.
 *
 *  @return An initialized `KTAudioMediaItem`.
 *
 *  @discussion If the audio must be downloaded from the network,
 *  you may initialize a `KTAudioMediaItem` with a `nil` audioData.
 *  Once the audio is available you can set the `audioData` property.
 */
- (instancetype)initWithData:(nullable NSData *)audioData;

/**
 *  Sets or updates the data object in an audio media item with the data specified at audioURL.
 *
 *  @param audioURL A File URL containing the location of the audio data.
 */
- (void)setAudioDataWithUrl:(nonnull NSURL *)audioURL;

@end

NS_ASSUME_NONNULL_END
