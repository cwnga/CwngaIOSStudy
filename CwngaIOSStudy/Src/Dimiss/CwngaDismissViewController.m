//
//  CwngaDismissViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/04/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaDismissViewController.h"
#import "CwngaPresentedViewController.h"
@interface CwngaDismissViewController ()

@end

@implementation CwngaDismissViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presetNewController:(id)sender
{
   CwngaPresentedViewController *test =  [[CwngaPresentedViewController alloc] init];
    test.target = self;
    test.action = @selector(dismiss);
    //test.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:test animated:YES completion:nil];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
