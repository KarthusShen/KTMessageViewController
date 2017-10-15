//
//  KTMessagesCollectionViewCellIncoming.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionViewCellIncoming.h"

@interface KTMessagesCollectionViewCellIncoming ()

@end

@implementation KTMessagesCollectionViewCellIncoming

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

#pragma mark - Overrides
- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.alignment = NSTextAlignmentLeft;
    self.cellBottomLabel.alignment = NSTextAlignmentLeft;
}

@end
