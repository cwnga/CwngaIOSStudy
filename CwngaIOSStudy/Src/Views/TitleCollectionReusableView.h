//
//  TitleCollectionReusableView.h
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString * const TitleCollectionReusableViewIdentifier = @"TitleCollectionReusableView";
@interface TitleCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
