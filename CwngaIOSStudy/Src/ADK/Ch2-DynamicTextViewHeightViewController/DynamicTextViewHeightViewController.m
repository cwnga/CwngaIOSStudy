//
//  DynamicTextViewHeightViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "DynamicTextViewHeightViewController.h"
#import "TextViewCollectionViewCell.h"
#import <AppDevKit/AppDevKit.h>
@interface DynamicTextViewHeightViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DynamicTextViewHeightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];

}
- (void)setupCollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:TextViewCollectionViewCellIndentifier bundle:nil] forCellWithReuseIdentifier:TextViewCollectionViewCellIndentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TextViewCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:TextViewCollectionViewCellIndentifier forIndexPath:indexPath];
    cell.textView.text = [self stringWithMulti:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    TextViewCollectionViewCell *cell = (TextViewCollectionViewCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:TextViewCollectionViewCellIndentifier];

    cell.textView.text = [self stringWithMulti:indexPath.row];
    CGSize textViewSize = [cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, FLT_MAX)];

    cell.textViewHeightConstraint.constant = textViewSize.height;
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];

    return size;
}

- (NSString *)stringWithMulti:(NSInteger)multi
{
    NSMutableString *string = [NSMutableString string];
        [string appendString:@"----start---\n"];
    for (NSInteger i = 1; i <= multi; i++) {
        [string appendString:@"1234567890\n"];
    }
    [string appendString:@"----end----"];
    if (multi == 0) {
        string = [NSMutableString string];
    }
    return [string copy];
}
@end
