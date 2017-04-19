//
//  CwngaPresentedViewController.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/04/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CwngaPresentedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *clossButton;
@property (assign, nonatomic) SEL action;
@property (weak, nonatomic) id target;
@end
