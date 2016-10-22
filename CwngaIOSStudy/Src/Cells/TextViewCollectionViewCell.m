//
//  TextViewCollectionViewCell.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "TextViewCollectionViewCell.h"

@implementation TextViewCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)prepareForReuse
{
    [super prepareForReuse];
    self.textView.text = @"";
}

@end
