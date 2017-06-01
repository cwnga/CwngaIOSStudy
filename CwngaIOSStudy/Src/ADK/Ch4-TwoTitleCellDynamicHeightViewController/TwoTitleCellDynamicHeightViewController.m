//
//  TwoTitleCellDynamicHeightViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/31/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "TwoTitleCellDynamicHeightViewController.h"
#import <AppDevKit/AppDevKit.h>
#import "TwoLabelCollectionViewCell.h"
@interface TwoTitleCellDynamicHeightViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation TwoTitleCellDynamicHeightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];

}
- (void)setupCollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:TwoLabelCollectionViewCellIdentifier bundle:nil] forCellWithReuseIdentifier:TwoLabelCollectionViewCellIdentifier];
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
    TwoLabelCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:TwoLabelCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [self stringWithMulti:indexPath.row];
    cell.subTitleLabel.text = [self stringWithMulti:indexPath.row -1];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    TwoLabelCollectionViewCell *cell = (TwoLabelCollectionViewCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:TwoLabelCollectionViewCellIdentifier];
    cell.titleLabel.text = [self stringWithMulti:indexPath.row];
    cell.subTitleLabel.text = [self stringWithMulti:indexPath.row -1];
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];
    return size;
}

- (NSString *)stringWithMulti:(NSInteger)multi
{
    NSMutableString *string = [NSMutableString string];
    if (multi > 0) {
        [string appendString:@"----start---\n"];
        for (NSInteger i = 1; i <= multi; i++) {
            [string appendString:@"1234567890\n"];
        }
        [string appendString:@"----end----"];
    }
    return [string copy];
}


@end
