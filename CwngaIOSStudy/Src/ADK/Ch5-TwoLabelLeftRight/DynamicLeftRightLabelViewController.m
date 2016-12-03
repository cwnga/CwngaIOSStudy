//
//  DynamicLeftRightLabelViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 11/14/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "DynamicLeftRightLabelViewController.h"
#import "ADKCollectionViewDynamicSizeSubCell.h"
@interface DynamicLeftRightLabelViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DynamicLeftRightLabelViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];

}
- (void)setupCollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:ADKCollectionViewDynamicSizeSubCellIdentifier bundle:nil] forCellWithReuseIdentifier:ADKCollectionViewDynamicSizeSubCellIdentifier];
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
    ADKCollectionViewDynamicSizeSubCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:ADKCollectionViewDynamicSizeSubCellIdentifier forIndexPath:indexPath];
    cell.label1.text = [self stringWithMulti:indexPath.row];
    cell.label1.text = [self stringWithMulti:indexPath.row -1];
    cell.label2.text = [self stringWithMulti:indexPath.row];
    cell.label2.text = [self stringWithMulti:indexPath.row -1];
    cell.cellWidthConstraint.constant = collectionView.bounds.size.width;
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    ADKCollectionViewDynamicSizeSubCell *cell = (ADKCollectionViewDynamicSizeSubCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:ADKCollectionViewDynamicSizeSubCellIdentifier];
    cell.label1.text = [self stringWithMulti:indexPath.row];
    cell.label1.text = [self stringWithMulti:indexPath.row -1];
    cell.label2.text = [self stringWithMulti:indexPath.row];
    cell.label2.text = [self stringWithMulti:indexPath.row -1];
    cell.cellWidthConstraint.constant = collectionView.bounds.size.width;
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];
    return size;
}

- (NSString *)stringWithMulti:(NSInteger)multi
{
    NSMutableString *string = [NSMutableString string];
    if (multi > 0) {
        [string appendString:@"----start---\n"];
        for (NSInteger i = 1; i <= multi; i++) {
            [string appendString:@"123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 end1\n"];
        }
        [string appendString:@"----end----"];
    }
    return [string copy];
}



@end
