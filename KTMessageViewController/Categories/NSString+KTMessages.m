//
//  NSString+KTMessages.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/13.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "NSString+KTMessages.h"

@implementation NSString (KTMessages)

- (NSString *)kt_stringByTrimingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

@end
