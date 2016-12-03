//
//  ViewController.m
//  ReactiveCocoaStudy
//
//  Created by Anson Ng on 9/27/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "ViewController.h"
#import "TitleCollectionReusableView.h"

#import "CollectionViewCell.h"
static  NSString * const ReuseIdentifier = @"CollectionViewCell";
@interface ViewController () <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *data;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = @[
                  @{
                      @"title": @"Algorithm",
                      @"cells": @[
                              @{
                                  @"title" : @"Binary Tree Ordering",
                                  @"className": @"BinaryTreeViewController"
                                  },
                              ],
                      },
                  @{
                      @"title": @"ADK",
                      @"cells": @[
                              @{
                                  @"title" : @"DynamicHeightViewController",
                                  @"className": @"DynamicHeightViewController"
                                  },
                              @{
                                  @"title" : @"DynamicTextViewHeightViewController",
                                  @"className": @"DynamicTextViewHeightViewController"
                                  },
                              @{
                                  @"title" : @"ADK Image Color",
                                  @"className": @"ADKImageColorViewController"
                                  },
                              @{
                                  @"title" : @"Two Title labels cell",
                                  @"className": @"TwoTitleCellDynamicHeightViewController"
                                  },
                              //DynamicLeftRightLabelViewController

                              @{
                                  @"title" : @"Two Title labels (left, right) cell",
                                  @"className": @"DynamicLeftRightLabelViewController"
                                  },
                              ],
                      //TwoTitleCellDynamicHeightViewController

                      },

                  @{
                      @"title": @"ReactiveCoCoa",
                      @"cells": @[
                              @{
                                  @"title" : @"CH1",
                                  @"className": @"Ch1ViewController"
                                  },
                              @{
                                  @"title" : @"CH2",
                                  @"className": @"Ch2ViewController"
                                  },
                              //Ch3CombineLatest
                              @{
                                  @"title" : @"Ch3 - CombineLatest",
                                  @"className": @"Ch3CombineLatestViewControlller"
                                  },

                              ]

                      }
                  ];
    [self.collectionView registerNib:[UINib nibWithNibName:ReuseIdentifier bundle:nil] forCellWithReuseIdentifier:ReuseIdentifier];

    [self.collectionView registerNib:[UINib nibWithNibName:TitleCollectionReusableViewIdentifier bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TitleCollectionReusableViewIdentifier];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
{
    return [self.data[section][@"cells"] count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = (CollectionViewCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdentifier forIndexPath:indexPath];
    cell.titleLabel.text = [self.data[indexPath.section][@"cells"][indexPath.item] valueForKey:@"title"];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return  self.data.count;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = [self.data[indexPath.section][@"cells"][indexPath.item] valueForKey:@"className"];
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.collectionView.bounds.size.width, 50.0f);
}

- (UICollectionReusableView *)collectionView: (UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath  {
    TitleCollectionReusableView *titleView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TitleCollectionReusableViewIdentifier forIndexPath:indexPath];

    titleView.titleLabel.text = self.data[indexPath.row][@"title"];
    return titleView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(self.collectionView.bounds.size.width, 50.0f);
}
@end
