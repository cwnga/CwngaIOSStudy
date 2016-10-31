//
//  TwoLabelCollectionViewCell.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/31/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString * const TwoLabelCollectionViewCellIdentifier = @"TwoLabelCollectionViewCell";
@interface TwoLabelCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@end
