//
//  Ch2CollectionViewReladViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 21/05/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "Ch2CollectionViewReladViewController.h"
#import "CollectionViewCell.h"
static  NSString * const ReuseIdentifier = @"CollectionViewCell";
@interface Ch2CollectionViewReladViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (assign, nonatomic) BOOL enableSetData;
@end

@implementation Ch2CollectionViewReladViewController
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [self.collectionView reloadItemsAtIndexPaths:self.collectionView.indexPathsForVisibleItems];//enableSetData = NO
    self.enableSetData = YES;
    [self.collectionView reloadData];//will only call size, will not call cellForItemAtIndexPath:

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerNib:[UINib nibWithNibName:ReuseIdentifier bundle:nil] forCellWithReuseIdentifier:ReuseIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;

    if ([self.collectionView respondsToSelector:@selector(setPrefetchingEnabled:)]) {
        [self.collectionView setPrefetchingEnabled:NO];
    }



    //   [self.collectionView reloadData];

}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return 2;
}

- (NSInteger)numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog([NSString stringWithFormat:@"CELL section:%ld index:%ld", (long)indexPath.section, (long)indexPath.row]);
    CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];

    cell.titleLabel.text = self.enableSetData ? [NSString stringWithFormat:@"section:%ld index:%ld", (long)indexPath.section, (long)indexPath.row] : @"no set";
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  20;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog( [NSString stringWithFormat:@"SIZE section:%ld index:%ld", (long)indexPath.section, (long)indexPath.row]);
    return CGSizeMake(self.collectionView.bounds.size.width, 50.0f);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{

    return CGSizeMake(self.collectionView.bounds.size.width, 50.0f);
}

@end
