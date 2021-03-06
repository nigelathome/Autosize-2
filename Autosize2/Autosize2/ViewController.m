//
//  ViewController.m
//  Autosize2
//
//  Created by Nigel Lee on 16/7/1.
//  Copyright © 2016年 Apress. All rights reserved.
//

#import "ViewController.h"

static const CGFloat buttonHeight = 40;
static const CGFloat buttonWidth = 120;
static const CGFloat spacing = 20;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *actionButton1;
@property (weak, nonatomic) IBOutlet UIButton *actionButton2;
@property (weak, nonatomic) IBOutlet UIButton *actionButton3;
@property (weak, nonatomic) IBOutlet UIButton *actionButton4;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
//    UIApplication *app = [UIApplication sharedApplication];
//    UIInterfaceOrientation currentOrientation = app.statusBarOrientation;
//    [self doLayoutForOrientation:currentOrientation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
                                         duration:(NSTimeInterval)duration {
    [self doLayoutForOrientation:toInterfaceOrientation];
}

- (void)doLayoutForOrientation:(UIInterfaceOrientation)orientation {
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        [self doUIInterfaceOrientationPortraitLayout];
    } else  {
        [self doUIInterfaceOrientationLandscapeLayout];
    }
}

- (void)doUIInterfaceOrientationPortraitLayout {
    // layout contentView controls
    CGRect bounds = self.view.bounds;
    CGFloat contentWidth = CGRectGetWidth(bounds) - (2 * spacing);
    CGFloat contentHeight = (CGRectGetHeight(bounds) + (2 * spacing)) / 4.0f * 2.0f;
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    
    // layout 4 buttons seperately
    CGFloat gap = (CGRectGetWidth(bounds) - 2 * buttonWidth) / 3;
    CGFloat buttonRow1y = gap;
    CGFloat buttonRow2y = buttonRow1y + buttonHeight +  spacing;
    CGFloat buttonCol1x = gap;
    CGFloat buttonCol2x = CGRectGetWidth(bounds) - buttonWidth - 2 * gap;
    self.actionButton1.frame = CGRectMake(buttonCol1x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonCol2x, buttonRow1y,
                                          buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonCol1x, buttonRow2y,
                                          buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonCol2x, buttonRow2y,
                                          buttonWidth, buttonHeight);
}

- (void)doUIInterfaceOrientationLandscapeLayout {
    // layout contentView controls
    CGRect bounds = self.view.bounds;
    CGFloat contentWidth = (CGRectGetWidth(bounds) - (2 * spacing)) / 5.0f * 3.0f;
    CGFloat contentHeight = CGRectGetHeight(bounds) - (2 * spacing);
    self.contentView.frame = CGRectMake(spacing, spacing,
                                        contentWidth, contentHeight);
    
    // layout 4 buttons seperately
    CGFloat gap = (bounds.size.width - 2 * buttonWidth) / 3;
    CGFloat buttonX = spacing + contentWidth;
    CGFloat buttonRow1y = gap;
    CGFloat buttonRow4y = CGRectGetHeight(bounds) - buttonHeight - spacing;
    CGFloat buttonRow2y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.333);
    CGFloat buttonRow3y = buttonRow1y + floor((buttonRow4y - buttonRow1y)
                                              * 0.667);
    
    self.actionButton1.frame = CGRectMake(300, 300,
                                          buttonWidth, buttonHeight);
    self.actionButton2.frame = CGRectMake(buttonX, buttonRow2y,
                                          buttonWidth, buttonHeight);
    self.actionButton3.frame = CGRectMake(buttonX, buttonRow3y,
                                          buttonWidth, buttonHeight);
    self.actionButton4.frame = CGRectMake(buttonX, buttonRow4y,
                                          buttonWidth, buttonHeight);
}

@end
