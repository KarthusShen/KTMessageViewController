//
//  KTMessagesCollectionViewCell.m
//  KTMessageViewController
//
//  Created by Karthus on 2017/10/15.
//  Copyright © 2017年 karthus. All rights reserved.
//

#import "KTMessagesCollectionViewCell.h"

#import "KTMessagesCollectionViewCellIncoming.h"
#import "KTMessagesCollectionViewCellOutgoing.h"
#import "KTMessagesCollectionViewLayoutAttributes.h"

#import "NSView+KTMessages.h"

static NSMutableSet *ktMessagesCollectionViewCellActions = nil;

//TODO: implements this calss
@interface KTMessagesCollectionViewCell ()

@property (weak) IBOutlet KTMessagesLabel *cellTopLabel;
@property (weak) IBOutlet KTMessagesLabel *messageBubbleTopLabel;
@property (weak) IBOutlet KTMessagesLabel *cellBottomLabel;

@property (weak) IBOutlet NSView *messageBubbleContainerView;
@property (weak) IBOutlet NSImageView *messageBubbleImageView;
@property (weak) IBOutlet KTMessagesCellTextView *textView;
@property (weak) IBOutlet NSImageView *avatarImageView;
@property (weak) IBOutlet NSView *avatarContainerView;

@property (weak) IBOutlet NSLayoutConstraint *messageBubbleContainerWidthConstraint;
@property (weak) IBOutlet NSLayoutConstraint *textViewTopVerticalSpaceConstraint;
@property (weak) IBOutlet NSLayoutConstraint *textViewBottomVerticalSpaceConstraint;
@property (weak) IBOutlet NSLayoutConstraint *textViewAvatarHorizontalSpaceConstraint;
@property (weak) IBOutlet NSLayoutConstraint *textViewMarginHorizontalSpaceConstraint;

@property (weak) IBOutlet NSLayoutConstraint *cellTopLabelHeightConstraint;
@property (weak) IBOutlet NSLayoutConstraint *messageBubbleTopLabelHeightConstraint;
@property (weak) IBOutlet NSLayoutConstraint *cellBottomLabelHeightConstraint;

@property (weak) IBOutlet NSLayoutConstraint *avatarContainerViewWidthConstraint;
@property (weak) IBOutlet NSLayoutConstraint *avatarContainerViewHeightConstraint;

@property (assign, nonatomic) NSEdgeInsets textViewFrameInsets;

@property (assign, nonatomic) CGSize avatarViewSize;

@property (weak, nonatomic, readwrite) NSPressGestureRecognizer *pressGestureRecognizer;

- (void)kt_handleTapGesture:(NSPressGestureRecognizer *)press;

- (void)kt_updateConstraint:(NSLayoutConstraint *)constraint withConstant:(CGFloat)constant;

@end

@implementation KTMessagesCollectionViewCell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end
