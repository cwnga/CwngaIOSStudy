//
//  SKViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 1/18/17.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "SKViewController.h"
#import "SKImageLikeAnimationView.h"

@interface SKViewController ()
@property (weak, nonatomic) IBOutlet SKImageLikeAnimationView *skImageLikeAnimationView;

@end

@implementation SKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    tapGestureRecognizer.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:tapGestureRecognizer];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1f * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (int i = 0; i < 100000; i++) {

            [weakSelf.skImageLikeAnimationView fireImage:[UIImage imageNamed:@"Image-Smile"] size:CGSizeMake(30.0f, 30.0f) duration:1.5f scale:1.5f alpha:0.2f];


        }
    });
    
}
-(void)handleTap
{
    [self.skImageLikeAnimationView fireImage:[UIImage imageNamed:@"Image-Smile"] size:CGSizeMake(30.0f, 30.0f) duration:1.5f scale:1.5f alpha:0.2f];
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
