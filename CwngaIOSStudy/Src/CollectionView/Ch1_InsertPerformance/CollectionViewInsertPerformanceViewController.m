//
//  CollectionViewInsertPerformanceViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 03/04/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CollectionViewInsertPerformanceViewController.h"
#import "CollectionViewCell.h"

@interface CollectionViewInsertPerformanceViewController () <UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *datas;
@end

@implementation CollectionViewInsertPerformanceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.datas = [NSMutableArray arrayWithArray:@[]];
    [self.collectionView registerNib:[UINib nibWithNibName:CollectionViewCellIdentifier bundle:nil] forCellWithReuseIdentifier:CollectionViewCellIdentifier];

    [self addData];
}

- (void)addData
{
    __weak typeof (self)weakSelf = self;
    [self addDataInCollectionView];
            NSLog([NSString stringWithFormat:@"%ld", self.datas.count]);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf addData];

    });
}

- (void)addDataInCollectionView
{
    __weak typeof (self)weakSelf = self;
    __block NSIndexPath *indexPath;
    [self.collectionView performBatchUpdates:^{
        indexPath = [NSIndexPath indexPathForItem:weakSelf.datas.count-1 inSection:0];

        [weakSelf.datas addObject:[NSString stringWithFormat:@"%lu", (unsigned long)weakSelf.datas.count]];
        NSMutableArray *indexPaths = [NSMutableArray array];
        [indexPaths addObject:[NSIndexPath indexPathForRow:(weakSelf.datas.count - 1) inSection:0]];
        [weakSelf.collectionView insertItemsAtIndexPaths:indexPaths];
    } completion:^(BOOL finished) {
        NSArray *indexPaths = [weakSelf.collectionView indexPathsForVisibleItems];
        if (indexPath && [indexPaths containsObject:indexPath]) {
            [weakSelf scrollCollectionViewToBottom];
        }
    }];
}


- (void)scrollCollectionViewToBottom
{
    CGSize contentSize = [self.collectionView.collectionViewLayout collectionViewContentSize];
    if (contentSize.height > self.collectionView.bounds.size.height) {
        CGPoint targetContentOffset = CGPointMake(0.0f, contentSize.height - self.collectionView.bounds.size.height);
        [self.collectionView setContentOffset:targetContentOffset];
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.datas.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = self.datas[indexPath.item];
    return cell;
}
#pragma mark - <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize size = self.collectionView.bounds.size;
    size.height = 20.0f;
    return size;
}
@end
