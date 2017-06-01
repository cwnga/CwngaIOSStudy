//
//  DynamicHeightViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "DynamicHeightViewController.h"
#import "CollectionViewCell.h"
#import <AppDevKit/AppDevKit.h>
@interface DynamicHeightViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation DynamicHeightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupCollectionView];

}
- (void)setupCollectionView
{
    [self.collectionView registerNib:[UINib nibWithNibName:CollectionViewCellIdentifier bundle:nil] forCellWithReuseIdentifier:CollectionViewCellIdentifier];
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
    CollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [self stringWithMulti:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    CollectionViewCell *cell = (CollectionViewCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:CollectionViewCellIdentifier];
    cell.cellWidth.constant = collectionView.bounds.size.width;
    cell.titleLabel.text = [self stringWithMulti:indexPath.row];
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];
    return size;
}

- (NSString *)stringWithMulti:(NSInteger)multi
{
    NSMutableString *string = [NSMutableString string];

        [string appendString:@"----start---"];
        for (NSInteger i = 1; i <= multi; i++) {
            [string appendString:@"1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890"];
        }
        [string appendString:@"----end----"];

    return [string copy];
}
@end
