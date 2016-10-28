//
//  ADKImageColorViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/27/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "ADKImageColorViewController.h"
#import <AppDevKit.h>
#import "UIImage+ADKColorReplacement.h"

@interface ADKImageColorViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (assign, nonatomic) CGFloat rValue;
@property (assign, nonatomic) CGFloat gValue;
@property (assign, nonatomic) CGFloat bValue;
@property (weak, nonatomic) IBOutlet UIButton *replaceColorButton;
@property (weak, nonatomic) IBOutlet UILabel *rLabel;
@property (weak, nonatomic) IBOutlet UILabel *gLabel;
@property (weak, nonatomic) IBOutlet UILabel *bLabel;
@property (weak, nonatomic) IBOutlet UIButton *tintColorButton;

@end

@implementation ADKImageColorViewController

- (void)viewDidLoad {

    self.tintColorButton.selected = YES;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)RdidChange:(UISlider *)sender
{
    NSLog(@"r:%lf", sender.value);
    self.rValue = sender.value;

    self.rLabel.text = [NSString stringWithFormat:@"%f", self.rValue];
    [self updateImage];

}
- (IBAction)GdidChange:(UISlider *)sender
{
    NSLog(@"r:%lf", sender.value);
    self.gValue = sender.value;
    self.gLabel.text = [NSString stringWithFormat:@"%f", self.gValue];
    [self updateImage];

}
- (IBAction)BdidChange:(UISlider *)sender
{
    NSLog(@"r:%lf", sender.value);
    self.bValue = sender.value;
    self.bLabel.text = [NSString stringWithFormat:@"%f", self.bValue];
    [self updateImage];


}
- (void)updateImage
{

    UIColor *color = [[UIColor alloc] initWithRed:self.rValue green:self.gValue blue:self.bValue alpha:1.0f];
    if (self.tintColorButton.selected) {
        self.imageView.image = [UIImage ADKImageNamed:@"Image-Smile" tintColor:color];
    }else if (self.replaceColorButton.selected) {
        self.imageView.image = [UIImage ADKImageNamed:@"Image-Smile2" replaceColor:color];
    }

}
- (IBAction)tapTintColorButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.replaceColorButton.selected = !sender.selected;
    [self updateImage];

}

- (IBAction)tapReplaceColorButton:(UIButton *)sender
{
    sender.selected = !sender.selected;
    self.tintColorButton.selected = !sender.selected;
    [self updateImage];

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
