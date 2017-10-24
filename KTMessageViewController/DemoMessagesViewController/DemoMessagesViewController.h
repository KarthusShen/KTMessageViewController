//
//  DemoMessagesViewController.h
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/21.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessages.h"

#import "DemoModelData.h"

@interface DemoMessagesViewController : KTMessagesViewController

@property (nonatomic, weak) NSWindowController *windowController;

@property (strong, nonatomic) DemoModelData *demoData;

@end
