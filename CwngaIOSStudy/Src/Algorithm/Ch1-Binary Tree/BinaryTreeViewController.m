//
//  BinaryTreeViewController.m
//  CwngaIOSStudy
//
//  Created by Anson Ng on 10/22/16.
//  Copyright © 2016 Yahoo! Inc. All rights reserved.
//

#import "BinaryTreeViewController.h"

@interface Node : NSObject

@property (assign, nonatomic) CGFloat value;
@property (strong, nonatomic) Node *leftNode;
@property (strong, nonatomic) Node *rightNode;

@end

@implementation Node


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %f", [super description], self.value];
}

@end

@interface BinaryTreeViewController ()
@property (weak, nonatomic) IBOutlet UILabel *errorMessageLabel;
@property (weak, nonatomic) IBOutlet UITextView *inputTextView;
@property (weak, nonatomic) IBOutlet UITextView *inOrderTextView;
@property (weak, nonatomic) IBOutlet UITextView *preOrderTextView;
@property (weak, nonatomic) IBOutlet UITextView *postOrderTextView;
@property (strong, nonatomic) Node *tree;
@end

@implementation BinaryTreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}
- (void)handleNumbers:(NSArray *)number
{
    self.tree = nil;
    // NSArray *number = @[@(4),@(3), @(7),@(5),@(6),@(1),];
    [number enumerateObjectsUsingBlock:^(NSNumber *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Node *node = [[Node alloc]init];
        node.value = [obj floatValue];
        self.tree = [self insertNewNode:node withParentNode:self.tree];
    }];
    NSLog(@"tree:%@", self.tree);

    NSMutableArray *inOrderArray = [NSMutableArray array];
    [self inOrder:self.tree array:inOrderArray];
    NSLog(@"inOrderArray:%@", inOrderArray);
    self.inOrderTextView.text = [NSString stringWithFormat:@"%@", [inOrderArray componentsJoinedByString:@"\n"]];

    NSMutableArray *preOrderArray = [NSMutableArray array];
    [self preOrder:self.tree array:preOrderArray];
    NSLog(@"preOrderArray:%@", preOrderArray);

    self.preOrderTextView.text = [NSString stringWithFormat:@"%@", [preOrderArray componentsJoinedByString:@"\n"]];

    NSMutableArray *postOrderArray = [NSMutableArray array];
    [self postOrder:self.tree array:postOrderArray];
    NSLog(@"postOrderArray:%@", postOrderArray);
    self.postOrderTextView.text = [NSString stringWithFormat:@"%@", [postOrderArray componentsJoinedByString:@"\n"]];

}

- (NSArray *)inOrder:(Node *)node array:(NSMutableArray *)array
{
    if (node) {
        [self inOrder:node.leftNode array:array];
        [array addObject:node];
        [self inOrder:node.rightNode array:array];
    }
    return nil;
}

- (NSArray *)preOrder:(Node *)node array:(NSMutableArray *)array
{
    if (node) {
        [array addObject:node];
        [self preOrder:node.leftNode array:array];
        [self preOrder:node.rightNode array:array];
    }
    return nil;
}
- (NSArray *)postOrder:(Node *)node array:(NSMutableArray *)array
{
    if (node) {
        [self postOrder:node.leftNode array:array];

        [self postOrder:node.rightNode array:array];
        [array addObject:node];
    }
    return nil;
}

- (Node *)insertNewNode:(Node *)newNode withParentNode:(Node *)parentNode
{

    if (!parentNode) {
        parentNode = newNode;

    } else {
        if (newNode.value >= parentNode.value) {
            if (parentNode.rightNode) {
                [self insertNewNode:newNode withParentNode:parentNode.rightNode];
            } else {
                parentNode.rightNode = newNode;
            }
        } else {
            if (parentNode.leftNode) {
                [self insertNewNode:newNode withParentNode:parentNode.leftNode];
            } else {
                parentNode.leftNode = newNode;
            }
        }
    }
    return  parentNode;
}

- (IBAction)tapRunButton:(id)sender
{
    NSArray *textArray = [self.inputTextView.text componentsSeparatedByString:@","];
    NSMutableArray *numbers = [NSMutableArray array];
    [textArray enumerateObjectsUsingBlock:^(NSString *string, NSUInteger idx, BOOL * _Nonnull stop) {
        [numbers addObject:[NSNumber numberWithFloat:[string floatValue]]];
    }];
    self.errorMessageLabel.text = [NSString stringWithFormat:@"input:%@", [numbers componentsJoinedByString:@","]];
    [self handleNumbers:numbers];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
