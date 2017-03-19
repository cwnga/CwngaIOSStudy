//
//  TestBurViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 17/03/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "TestBurViewController.h"

@interface TestBurViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation TestBurViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];

    UIVisualEffectView * visualView = [[UIVisualEffectView alloc] initWithEffect:blur];
visualView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    visualView.alpha = 0.4;
    UIView *blackView = [[UIView alloc] init];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.4f;
    blackView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.imageView addSubview:blackView];
    [self.imageView addSubview:visualView];
    visualView.frame = self.imageView.bounds;
    
    // Do any additional setup after loading the view from its nib.
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
