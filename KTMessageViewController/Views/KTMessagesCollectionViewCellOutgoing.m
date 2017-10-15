//
//  KTMessagesCollectionViewCellOutgoing.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionViewCellOutgoing.h"

@interface KTMessagesCollectionViewCellOutgoing ()

@end

@implementation KTMessagesCollectionViewCellOutgoing

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

#pragma mark - Overrides

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.messageBubbleTopLabel.alignment = NSTextAlignmentRight;
    self.cellBottomLabel.alignment = NSTextAlignmentRight;
}

@end
