//
//  ADKCollectionViewDynamicSizeSubCell.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 11/14/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AppDevKit.h>

static NSString * const ADKCollectionViewDynamicSizeSubCellIdentifier = @"ADKCollectionViewDynamicSizeSubCell";

@interface ADKCollectionViewDynamicSizeSubCell : ADKCollectionViewDynamicSizeCell
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellWidthConstraint;

@end
