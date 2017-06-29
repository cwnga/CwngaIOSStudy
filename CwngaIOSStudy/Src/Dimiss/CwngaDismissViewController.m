//
//  CwngaDismissViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 19/04/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import "CwngaDismissViewController.h"
#import "CwngaPresentedViewController.h"
#import "EAPromotionData.h"

@interface CwngaDismissViewController ()

@end

@implementation CwngaDismissViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*

     @interface EAPromotionViewData : JSONModel
     @property (assign, nonatomic) CGFloat leadingSpace;
     @property (assign, nonatomic) CGFloat w;
     @property (assign, nonatomic) CGFloat h;
     @end

     ////text data
     @interface EAPromotionViewTextData : EAPromotionViewData
     @property (strong, nonatomic) NSString *text;
     @property (assign, nonatomic) CGFloat fontSize;
     @property (strong, nonatomic) NSString *backgroundColorCode;
     @property (strong, nonatomic) NSString *borderColorCode;
     @property (strong, nonatomic) NSString *textColorCode;
     @end

     ////PromotionViewImageData
     @interface EAPromotionViewImageData : EAPromotionViewData
     @property (strong, nonatomic) NSString *imageName;
     @end
     
     */

  NSDictionary *cmsPromotionDatas = @[
    @{@"promotionId":@"freeshipping",
      @"pageDatas": @[
              @{
                  @"name": @"listingPage",
                  @"viewDatas": @[
                          @{
                              @"viewId":@"shippingFamilyPromotionView",
                              @"type":@"text",
                              @"leadingSpace":@(111),
                              @"w":@(60),
                              @"h":@(18),
                              @"cmsParameter":@{
                                      @"ccode": @"",
                                      @"moduleId": @"",
                                      @"cmsDataKey": @"",
                                      @"service": @"",
                                      @"property": @"",
                                      },
                              @"contentData":@{
                                      @"text": @"",
                                      @"fontSize": @"",
                                      @"borderWidth": @"",
                                      @"backgroundColorCode": @"",
                                      @"borderColorCode": @"",
                                      @"textColorCode": @"",
                                      },
                              }

                          ]
                  }
              ],
      },
    ];
    NSArray <EAPromotionData *> *promotionDatas = [EAPromotionData arrayOfModelsFromDictionaries:cmsPromotionDatas error:nil];
    NSLog(@"promotionDatas:%@", promotionDatas);
    //    NSArray *testDicArray = @[
//                          @{
//                              @"leadingSpace":@"10.0",
//                              @"w":@"40.0",
//                              @"h":@"20.0",
//                              @"type":@"0", ///text
//                              @"fontSize":@"12.0",
//                              @"backgroundColorCode":@"FF8A00",
//                              @"borderColorCode":@"FFFFFF",
//                              @"textColorCode":@"FFFFFF",
//                              @"text": @"hihi",
//                              @"cmsDataKey": @"cmsDataKey",
//                              @"viewName": @"ttt",
//                              /*
//                               @property (strong, nonatomic) NSString *checkSelector;
//                               @property (strong, nonatomic) NSString *viewName;
//                               */
//
//                              },
//                          @{
//                              @"leadingSpace":@"10.0",
//                              @"w":@"50.0",
//                              @"h":@"50.0",
//                              @"type":@"1", ///image
//                              @"imageName":@"Image-Smile",
//
//                              },
//                          ];
//    NSArray *objs = [EAPromotionManager dataWithDicts:testDicArray];
//    NSLog(@"objs:%@", objs);
//    NSArray *views = [EAPromotionManager viewsWithViewDatas:objs];
//    [views enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        [self.testView addSubview:obj];
//    }];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)presetNewController:(id)sender
{
   CwngaPresentedViewController *test =  [[CwngaPresentedViewController alloc] init];
    test.target = self;
    test.action = @selector(dismiss);
    //test.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    [self presentViewController:test animated:YES completion:nil];
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
