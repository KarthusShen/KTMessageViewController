//
//  KTMessagesCollectionViewFlowLayoutInvalidationContext.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/18.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Cocoa/Cocoa.h>

/**
 *  A `KTMessagesCollectionViewFlowLayoutInvalidationContext` object specifies properties for
 *  determining whether to recompute the size of items or their position in the layout.
 *  The flow layout object creates instances of this class when it needs to invalidate its contents
 *  in response to changes. You can also create instances when invalidating the flow layout manually.
 *
 */
@interface KTMessagesCollectionViewFlowLayoutInvalidationContext : NSCollectionViewFlowLayoutInvalidationContext

/**
 *  A boolean indicating whether to empty the messages layout information cache for items and views in the layout.
 *  The default value is `NO`.
 */
@property (nonatomic, assign) BOOL invalidateFlowLayoutMessagesCache;

/**
 *  Creates and returns a new `KTMessagesCollectionViewFlowLayoutInvalidationContext` object.
 *
 *  @discussion When you need to invalidate the `KTMessagesCollectionViewFlowLayout` object for your
 *  `KTMessagesViewController` subclass, you should use this method to instantiate a new invalidation
 *  context and pass this object to `invalidateLayoutWithContext:`.
 *
 *  @return An initialized invalidation context object if successful, otherwise `nil`.
 */
+ (instancetype)context;

@end
