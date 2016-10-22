//
//  TextViewCollectionViewCell.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const TextViewCollectionViewCellIndentifier = @"TextViewCollectionViewCell";
@interface TextViewCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;

@end
