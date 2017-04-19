//
//  CwngaPresentedViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/04/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaPresentedViewController.h"

@interface CwngaPresentedViewController ()

@end

@implementation CwngaPresentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.clossButton addTarget:self.target action:self.action forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presetNewController:(id)sender
{
    CwngaPresentedViewController *test =  [[CwngaPresentedViewController alloc] init];
    test.target = self.target;
    test.action = self.action;

    [self presentViewController:test animated:YES completion:^{
        test.view.backgroundColor = (arc4random_uniform(2) > 0.5) ? [UIColor orangeColor] : [UIColor redColor];
    }];
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
