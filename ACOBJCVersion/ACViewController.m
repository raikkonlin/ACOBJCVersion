//
//  ACViewController.m
//  ACOBJCVersion
//
//  Created by LINCHUNGYAO on 2015/10/12.
//  Copyright © 2015年 LINCHUNGYAO. All rights reserved.
//

#import "ACViewController.h"

@interface ACViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonConnectToMember;
@property (weak, nonatomic) IBOutlet UITextField *navigationBarTextFieldAsImage;

@end

@implementation ACViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"alphacamp-logo.png"] forBarMetrics:UIBarMetricsCompact];


//
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame: CGRectMake(0, 0, 0, 10)];
//    imageView.image = [UIImage imageNamed: @"alphacamp-logo.png"];
//
//
//    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100, 30)];
//    leftView.contentMode = UIViewContentModeScaleAspectFit;
//[self.navigationBarTextFieldAsImage setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"alphacamp-logo.png"]]];
        //  設置button字型顏色及字串內容及下畫線
    self.buttonConnectToMember.titleLabel.textColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];

    self.buttonConnectToMember.layer.cornerRadius = 8;
//    self.buttonConnectToMember.backgroundColor = [UIcolor colorWithRed:<#(CGFloat)#> green:<#(CGFloat)#> blue:<#(CGFloat)#> alpha:<#(CGFloat)#>];

    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:@"認識成員"];

        // making text property to underline text-
    [titleString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [titleString length])];

        // using text on button
    [self.buttonConnectToMember setAttributedTitle: titleString forState:UIControlStateNormal];





}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
