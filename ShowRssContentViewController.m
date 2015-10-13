//
//  ShowRssContentViewController.m
//  ACOBJCVersion
//
//  Created by LINCHUNGYAO on 2015/10/11.
//  Copyright © 2015年 LINCHUNGYAO. All rights reserved.
//

#import "ShowRssContentViewController.h"

@interface ShowRssContentViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *receivedLinkFromPressedRssTitle;

@end

@implementation ShowRssContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *myUrl = [NSURL URLWithString: [self.url stringByAddingPercentEscapesUsingEncoding:
                                          NSUTF8StringEncoding]];
//    NSLog(@"link=%@",myUrl);
    NSURLRequest *request = [NSURLRequest requestWithURL:myUrl];
    [self.receivedLinkFromPressedRssTitle loadRequest:request];
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
