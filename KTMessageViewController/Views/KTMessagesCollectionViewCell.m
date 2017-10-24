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

@property (weak, nonatomic, readwrite) NSClickGestureRecognizer *clickGestureRecognizer;

- (void)kt_handleClickGesture:(NSClickGestureRecognizer *)click;

- (void)kt_updateConstraint:(NSLayoutConstraint *)constraint withConstant:(CGFloat)constant;

@end

@implementation KTMessagesCollectionViewCell

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ktMessagesCollectionViewCellActions = [NSMutableSet new];
    });
}

+ (NSNib *)nib
{
    return [[NSNib alloc] initWithNibNamed:NSStringFromClass([self class]) bundle:[NSBundle bundleForClass:[self class]]];
}

+ (NSString *)cellReuseIdentifier
{
    return NSStringFromClass([self class]);
}

+ (NSString *)mediaCellReuseIdentifier
{
    return [NSString stringWithFormat:@"%@_KTMedia", NSStringFromClass([self class])];
}

+ (void)registerMenuAction:(SEL)action
{
    [ktMessagesCollectionViewCellActions addObject:NSStringFromSelector(action)];
}

#pragma mark - Initialization
- (void)viewDidAppear
{
    
}

-(void)viewDidLoad
{
    
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    
//    self.backgroundColor = [NSColor whiteColor];
    
    self.cellTopLabelHeightConstraint.constant = 0.0f;
    self.messageBubbleTopLabelHeightConstraint.constant = 0.0f;
    self.cellBottomLabelHeightConstraint.constant = 0.0f;
    
    self.avatarViewSize = CGSizeZero;
    
    self.cellTopLabel.alignment = NSTextAlignmentCenter;
    self.cellTopLabel.font = [NSFont boldSystemFontOfSize:12.0f];
    self.cellTopLabel.textColor = [NSColor lightGrayColor];
    
    self.messageBubbleTopLabel.font = [NSFont systemFontOfSize:12.0f];
    self.messageBubbleTopLabel.textColor = [NSColor lightGrayColor];
    
    self.cellBottomLabel.font = [NSFont systemFontOfSize:11.0f];
    self.cellBottomLabel.textColor = [NSColor lightGrayColor];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(jsq_handleTapGesture:)];
//    [self addGestureRecognizer:tap];
//    self.tapGestureRecognizer = tap;
    
    NSClickGestureRecognizer *click = [[NSClickGestureRecognizer alloc] initWithTarget:self action:@selector(kt_handleClickGesture:)];
    [self.view addGestureRecognizer:click];
    self.clickGestureRecognizer = click;
}

- (void)dealloc
{
    _delegate = nil;
    
    _cellTopLabel = nil;
    _messageBubbleTopLabel = nil;
    _cellBottomLabel = nil;
    
    _textView = nil;
    _messageBubbleImageView = nil;
    _mediaView = nil;
    
    _avatarImageView = nil;
    
    //[_clickGestureRecognizer removeTarget:nil action:NULL];TODO: havn't found in AppKit yet.
    _clickGestureRecognizer = nil;
}

#pragma mark - Collection view item

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.cellTopLabel.stringValue = @"";
    self.messageBubbleTopLabel.stringValue = @"";
    self.cellBottomLabel.stringValue = @"";
    
    //self.textView.dataDetectorTypes = UIDataDetectorTypeNone;
    self.textView.string = @"";
    //self.textView.attributedText = nil;
    
    self.avatarImageView.image = nil;
//    self.avatarImageView.highlightedImage = nil;
    self.avatarImageView.highlighted = NO;
}

- (NSCollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(NSCollectionViewLayoutAttributes *)layoutAttributes
{
    return layoutAttributes;
}

- (void)applyLayoutAttributes:(NSCollectionViewLayoutAttributes *)layoutAttributes
{
    [super applyLayoutAttributes:layoutAttributes];
    
    KTMessagesCollectionViewLayoutAttributes *customAttributes = (KTMessagesCollectionViewLayoutAttributes *)layoutAttributes;
    
    if (self.textView.font != customAttributes.messageBubbleFont) {
        self.textView.font = customAttributes.messageBubbleFont;
    }
    
//    if (!NSEdgeInsetsEqual(self.textView.textContainerInset, customAttributes.textViewTextContainerInsets))
//    {
//        self.textView.textContainerInset = customAttributes.textViewTextContainerInsets;
//    }
    
    self.textViewFrameInsets = customAttributes.textViewFrameInsets;
    
    [self kt_updateConstraint:self.messageBubbleContainerWidthConstraint
                  withConstant:customAttributes.messageBubbleContainerViewWidth];
    
    [self kt_updateConstraint:self.cellTopLabelHeightConstraint
                  withConstant:customAttributes.cellTopLabelHeight];
    
    [self kt_updateConstraint:self.messageBubbleTopLabelHeightConstraint
                  withConstant:customAttributes.messageBubbleTopLabelHeight];
    
    [self kt_updateConstraint:self.cellBottomLabelHeightConstraint
                  withConstant:customAttributes.cellBottomLabelHeight];
    
    if ([self isKindOfClass:[KTMessagesCollectionViewCellIncoming class]]) {
        self.avatarViewSize = customAttributes.incomingAvatarViewSize;
    }
    else if ([self isKindOfClass:[KTMessagesCollectionViewCellOutgoing class]]) {
        self.avatarViewSize = customAttributes.outgoingAvatarViewSize;
    }
}

//TODO: setHighlighted
//- (void)setHighlighted:(BOOL)highlighted
//{
//    [super setHighlighted:highlighted];
//    self.avatarImageView.highlighted = highlighted;
//    self.messageBubbleImageView.highlighted = highlighted;
//}

- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
    self.avatarImageView.highlighted = selected;
    self.messageBubbleImageView.highlighted = selected;
}

//TODO: setBounds
//- (void)setBounds:(CGRect)bounds
//{
//    [super setBounds:bounds];
//    
//    if ([UIDevice jsq_isCurrentDeviceBeforeiOS8]) {
//        self.contentView.frame = bounds;
//    }
//}

#pragma mark - Menu actions

- (BOOL)respondsToSelector:(SEL)aSelector
{
    if ([ktMessagesCollectionViewCellActions containsObject:NSStringFromSelector(aSelector)]) {
        return YES;
    }
    
    return [super respondsToSelector:aSelector];
}


- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    if ([ktMessagesCollectionViewCellActions containsObject:NSStringFromSelector(anInvocation.selector)]) {
        __unsafe_unretained id sender;
        [anInvocation getArgument:&sender atIndex:0];
        [self.delegate messagesCollectionViewCell:self didPerformAction:anInvocation.selector withSender:sender];
    }
    else {
        [super forwardInvocation:anInvocation];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    if ([ktMessagesCollectionViewCellActions containsObject:NSStringFromSelector(aSelector)]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:@"];
    }
    
    return [super methodSignatureForSelector:aSelector];
}

#pragma mark - Setters

- (void)setBackgroundColor:(NSColor *)backgroundColor
{
    //[super setBackgroundColor:backgroundColor];
    
    self.cellTopLabel.backgroundColor = backgroundColor;
    self.messageBubbleTopLabel.backgroundColor = backgroundColor;
    self.cellBottomLabel.backgroundColor = backgroundColor;
    
//    self.messageBubbleImageView.backgroundColor = backgroundColor;
//    self.avatarImageView.backgroundColor = backgroundColor;
//
//    self.messageBubbleContainerView.backgroundColor = backgroundColor;
//    self.avatarContainerView.backgroundColor = backgroundColor;
}

- (void)setAvatarViewSize:(CGSize)avatarViewSize
{
    if (CGSizeEqualToSize(avatarViewSize, self.avatarViewSize)) {
        return;
    }
    
    [self kt_updateConstraint:self.avatarContainerViewWidthConstraint withConstant:avatarViewSize.width];
    [self kt_updateConstraint:self.avatarContainerViewHeightConstraint withConstant:avatarViewSize.height];
}

- (void)setTextViewFrameInsets:(NSEdgeInsets)textViewFrameInsets
{
    if (NSEdgeInsetsEqual (textViewFrameInsets, self.textViewFrameInsets)) {
        return;
    }
    
    [self kt_updateConstraint:self.textViewTopVerticalSpaceConstraint withConstant:textViewFrameInsets.top];
    [self kt_updateConstraint:self.textViewBottomVerticalSpaceConstraint withConstant:textViewFrameInsets.bottom];
    [self kt_updateConstraint:self.textViewAvatarHorizontalSpaceConstraint withConstant:textViewFrameInsets.right];
    [self kt_updateConstraint:self.textViewMarginHorizontalSpaceConstraint withConstant:textViewFrameInsets.left];
}

- (void)setMediaView:(NSView *)mediaView
{
    [self.messageBubbleImageView removeFromSuperview];
    [self.textView removeFromSuperview];
    
    [mediaView setTranslatesAutoresizingMaskIntoConstraints:NO];
    mediaView.frame = self.messageBubbleContainerView.bounds;
    
    [self.messageBubbleContainerView addSubview:mediaView];
    [self.messageBubbleContainerView kt_pinAllEdgesOfSubview:mediaView];
    _mediaView = mediaView;
    
    //  because of cell re-use (and caching media views, if using built-in library media item)
    //  we may have dequeued a cell with a media view and add this one on top
    //  thus, remove any additional subviews hidden behind the new media view
    dispatch_async(dispatch_get_main_queue(), ^{
        for (NSUInteger i = 0; i < self.messageBubbleContainerView.subviews.count; i++) {
            if (self.messageBubbleContainerView.subviews[i] != _mediaView) {
                [self.messageBubbleContainerView.subviews[i] removeFromSuperview];
            }
        }
    });
}

#pragma mark - Getters

- (CGSize)avatarViewSize
{
    return CGSizeMake(self.avatarContainerViewWidthConstraint.constant,
                      self.avatarContainerViewHeightConstraint.constant);
}

- (NSEdgeInsets)textViewFrameInsets
{
    return NSEdgeInsetsMake(self.textViewTopVerticalSpaceConstraint.constant,
                            self.textViewMarginHorizontalSpaceConstraint.constant,
                            self.textViewBottomVerticalSpaceConstraint.constant,
                            self.textViewAvatarHorizontalSpaceConstraint.constant);
}

#pragma mark - Utilities

- (void)kt_updateConstraint:(NSLayoutConstraint *)constraint withConstant:(CGFloat)constant
{
    if (constraint.constant == constant) {
        return;
    }
    
    constraint.constant = constant;
}


#pragma mark - Gesture recognizers

- (void)kt_handleClickGesture:(NSClickGestureRecognizer *)click
{
    CGPoint touchPt = [click locationInView:self.view];
    
    if (CGRectContainsPoint(self.avatarContainerView.frame, touchPt)) {
        [self.delegate messagesCollectionViewCellDidTapAvatar:self];
    }
    else if (CGRectContainsPoint(self.messageBubbleContainerView.frame, touchPt)) {
        [self.delegate messagesCollectionViewCellDidTapMessageBubble:self];
    }
    else {
        [self.delegate messagesCollectionViewCellDidTapCell:self atPosition:touchPt];
    }
}

//TODO:
//- (BOOL)gestureRecognizer:(GestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
//    CGPoint touchPt = [touch locationInView:self];
//
//    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
//        return CGRectContainsPoint(self.messageBubbleContainerView.frame, touchPt);
//    }
//
//    return NO;
//}



@end
