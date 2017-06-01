//
//  Ch3CombineLatest.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/28/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "Ch3CombineLatestViewControlller.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface Ch3CombineLatestViewControlller ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation Ch3CombineLatestViewControlller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button.enabled = NO;
    RACSignal *firstNameTextFieldSignal = [self.firstNameTextField.rac_textSignal map:^id(NSString *value) {
        if (value.length > 0) {
            return @(YES);
        }
        return @(NO);
    }];
    RACSignal *lastNameTextFieldSignal = [self.lastNameTextField.rac_textSignal map:^id(NSString *value) {
        if (value.length > 0) {
            return @(YES);
        }
        return @(NO);
    }];
    RACSignal *ageTextFieldSignal = [self.ageTextField.rac_textSignal map:^id(NSString *value) {
        if (value.length > 0) {
            return @(YES);
        }
        return @(NO);
    }];
    __weak typeof(self) weakSelf = self;
    [[[RACSignal combineLatest:@[firstNameTextFieldSignal, lastNameTextFieldSignal, ageTextFieldSignal]]
      map:^id(RACTuple *racTuple) {
          return  @([racTuple.first boolValue] && [racTuple.second boolValue] && [racTuple.third boolValue]);
    }] subscribeNext:^(id x) {

        if ([x boolValue]) {
            weakSelf.button.enabled = YES;
        } else {

            weakSelf.button.enabled = NO;
        }
    }];
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
