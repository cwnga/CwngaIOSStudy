//
//  RectiveCocoaGettingStartViewController.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 21/09/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RectiveCocoaGettingStartViewController.h"

@interface RectiveCocoaGettingStartViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation RectiveCocoaGettingStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /*
     * RACSequence
     */

    /*
     RACSequence
     array + map
     */
    NSArray *array=@[@(1),@(2),@(3),@(4)];
    RACSequence *sequence = [array rac_sequence];
    id mapData = [sequence map:^id(id value) {
        return @([value integerValue] * 2);
    }];
    NSLog(@"after map:%@",[mapData array]); //after map: (2,4,6,8)

    /*
     RACSequence
     array + filter
     */
    id filterData = [sequence filter:^BOOL(id value) {
        return [value integerValue] %2 == 0;
    }];
    NSLog(@"after filter:%@",[filterData array]); //after filter:(2,4)


    NSDictionary *dictionary = @{@"key1":@"value1",
                                 @"key2":@"value2",
                                 @"key3":@"value3"};
    [dictionary.rac_sequence.signal subscribeNext:^(RACTuple * _Nullable x) {
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"key:%@, value:%@", key, value);
    }];


    //
    //
    //    RACSequence *normalizedLongWords = [[@[@"AAA", @"BB", @"CCC"].rac_sequence
    //                                         filter:^ BOOL (NSString *word) {
    //                                             return [word length] >= 2;
    //                                         }]
    //                                        map:^(NSString *word) {
    //                                            return [word lowercaseString];
    //                                        }];
    //    NSLog(@"normalizedLongWords:%@", normalizedLongWords );


    /*
     RACSignal
     */

    RACSignal *signal = [RACSignal createSignal:
                         ^RACDisposable *(id<RACSubscriber> subscriber)
                         {
                             [subscriber sendNext:@1];
                             [subscriber sendNext:@2];
                             [subscriber sendNext:@3];
                             [subscriber sendNext:@4];
                             [subscriber sendCompleted];
                             [subscriber sendNext:@5]; //subscriber can not get this value

                             return [RACDisposable disposableWithBlock:^{
                                 NSLog(@"signal dispose");
                             }];
                         }];
    RACDisposable *disposable = [signal subscribeNext:^(id x) {
        NSLog(@"subscribe value = %@", x);
    } error:^(NSError *error) {
        NSLog(@"error: %@", error);
    } completed:^{
        NSLog(@"completed");
    }];

    [disposable dispose];

    [[signal map:^id(id value) {
        return [NSNumber numberWithInteger:([value integerValue] * 2)];
    }] subscribeNext:^(id x) {
        NSLog(@"map: %@", x);
        //2,4,6,8
    }];

    [[signal filter:^BOOL(NSNumber *number) {
        return [number integerValue] % 2 == 0;
    }] subscribeNext:^(id x) {
        NSLog(@"filter:%@", x);
        //2, 4
    }];

    [[signal flattenMap:^RACStream *(id value) {
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,(int64_t)(5 * NSEC_PER_SEC)),
                           dispatch_get_main_queue(), ^{
                               [subscriber sendNext:@(10)];
                           });
            return nil;
        }];
    }] subscribeNext:^(id x) {
        NSLog(@"flattenMap-------:%@", x);
    }];


    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@":%@", x);
    }];

    [[self.button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"tap");
    }];
}

@end
