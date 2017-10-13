//
//  NSString+KTMessages.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/13.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (KTMessages)

/**
 *  @return A copy of the receiver with all leading and trailing whitespace removed.
 */
- (NSString *)kt_stringByTrimingWhitespace;

@end
