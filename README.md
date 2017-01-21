# CwngaIOSStudy

## SKImageLikeAnimationView and UIImageLikeAnimationView
    -(void)fireImage:(UIImage *)image size:(CGSize)size duration:(CGFloat)duration scale:(CGFloat)scale alpha:(CGFloat)alpha
![SKImageLikeAnimationView And UIImageLikeAnimationView](/images/SKImageLikeAnimationView_And_UIImageLikeAnimationView.gif)

## Leetcode 
### ReverseWordsInAString
- hint: string -> array -> revert -> join
https://leetcode.com/problems/reverse-words-in-a-string/

### raction to Recurring Decimal
- hint: mod
(TODO) https://leetcode.com/problems/fraction-to-recurring-decimal/

### Range Sum Query - Mutable  
- hint: segment tree
(TODO) https://leetcode.com/problems/range-sum-query-mutable/

### Decode Ways
- hint: dp

- normal case:
think about 11 => to be 2(1+1, 11), will  be 2
- edge case:
think about 01 => to be 0, can not begin with "0"

think about 01 => to be 0, can not begin with "0"

think about 10 => to be 1, can not 1=>A + 0=>?, will not be 2

think about 191 => 

    1 => 1;
    19 => 1+9, 19
    191 => 1+9+1, 19+1, (can not i-2 result (1+91))
    so answer to be 2


https://leetcode.com/problems/decode-ways/

### Contains Duplicate III
https://leetcode.com/problems/contains-duplicate-iii/

### 3Sum
https://leetcode.com/problems/3sum/

### Largest Number
https://leetcode.com/problems/largest-number/

### Palindrome Partitioning II
https://leetcode.com/problems/palindrome-partitioning-ii/
- hint: 

//check aba, abba,

    for (NSInteger i = 0; i < string.length; i++) {
        for (NSInteger j=0;
             i-j>=0 && i+j <= string.length -1 && [string characterAtIndex:i-j] ==[string characterAtIndex:i+j];
             j++) {
            //for aba
            NSInteger min = MIN([minCutDic[@(i-j-1)] integerValue] + 1, [minCutDic[@(i+j)] integerValue]) ;
            minCutDic[@(i+j)] = @(min);
        }
        for (NSInteger j=0;
             i-j>=0 && i+j <= string.length -1 && [string characterAtIndex:i-j-1] == [string characterAtIndex:i+j];
             j++) {
            //for i = 2, j = 1, abba

            NSInteger min = MIN([minCutDic[@(i-j-2)] integerValue] + 1, [minCutDic[@(i+j)] integerValue]) ;
            minCutDic[@(i+j)] = @(min);
        }
    }
### Longest Substring Without Repeating Characters
https://leetcode.com/problems/longest-substring-without-repeating-characters/

    -> abcabcbb
    NSInteger max = 0;
    NSMutableDictionary *charLastIndexMap = [NSMutableDictionary dictionary];///map to record char last index.
    for (NSInteger i = 0, j = 0; i < string.length; i++) {
        NSString *chart = [string substringWithRange:NSMakeRange(i, 1)];
        if (charLastIndexMap[chart]) {
            j = MAX(j, [charLastIndexMap[chart] integerValue] + 1); ///< abba, i=2, j befor:0, after:b:1+1=>2,get string:b | i=3, j:2, a:0+1=1 < j(2), no update j, will get substring: ba
        }
        charLastIndexMap[chart] = @(i); 
        max = MAX(max, i - j + 1);      

    }
    return max;
    ///input: abcabcbb
    Test Case '-[LongestSubstringWithoutRepeatingCharactersSpec TestLongestSubstringWithoutRepeatingCharacters_Test_2]' started.
    2016-12-04 17:57:21.523 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
    }
    2016-12-04 17:57:21.523 CwngaIOSStudy[91415:1579478] ===Loop=i:(0),j,(0)==
    2016-12-04 17:57:21.523 CwngaIOSStudy[91415:1579478] substring:start:[i(0)-j(0)], length:(1), text:(a)
    2016-12-04 17:57:21.524 CwngaIOSStudy[91415:1579478] new max:1
    2016-12-04 17:57:21.524 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 0;
    }
    2016-12-04 17:57:21.524 CwngaIOSStudy[91415:1579478] ===Loop=i:(1),j,(0)==
    2016-12-04 17:57:21.524 CwngaIOSStudy[91415:1579478] substring:start:[i(1)-j(0)], length:(2), text:(ab)
    2016-12-04 17:57:21.525 CwngaIOSStudy[91415:1579478] new max:2
    2016-12-04 17:57:21.525 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 0;
        b = 1;
    }
    2016-12-04 17:57:21.533 CwngaIOSStudy[91415:1579478] ===Loop=i:(2),j,(0)==
    2016-12-04 17:57:21.533 CwngaIOSStudy[91415:1579478] substring:start:[i(2)-j(0)], length:(3), text:(abc)
    2016-12-04 17:57:21.533 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.533 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 0;
        b = 1;
        c = 2;
    }
    2016-12-04 17:57:21.533 CwngaIOSStudy[91415:1579478] ===Loop=i:(3),j,(0)==
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] ===MAPPED===
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] charLastIndexMap[chart]{a} => 0
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] j:0
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] substring:start:[i(3)-j(1)], length:(3), text:(bca)
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.534 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 1;
        c = 2;
    }
    2016-12-04 17:57:21.535 CwngaIOSStudy[91415:1579478] ===Loop=i:(4),j,(1)==
    2016-12-04 17:57:21.535 CwngaIOSStudy[91415:1579478] ===MAPPED===
    2016-12-04 17:57:21.535 CwngaIOSStudy[91415:1579478] charLastIndexMap[chart]{b} => 1
    2016-12-04 17:57:21.558 CwngaIOSStudy[91415:1579478] j:1
    2016-12-04 17:57:21.558 CwngaIOSStudy[91415:1579478] substring:start:[i(4)-j(2)], length:(3), text:(cab)
    2016-12-04 17:57:21.558 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 4;
        c = 2;
    }
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] ===Loop=i:(5),j,(2)==
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] ===MAPPED===
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] charLastIndexMap[chart]{c} => 2
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] j:2
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] substring:start:[i(5)-j(3)], length:(3), text:(abc)
    2016-12-04 17:57:21.559 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 4;
        c = 5;
    }
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] ===Loop=i:(6),j,(3)==
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] ===MAPPED===
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] charLastIndexMap[chart]{b} => 4
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] j:3
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] substring:start:[i(6)-j(5)], length:(2), text:(cb)
    2016-12-04 17:57:21.560 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 6;
        c = 5;
    }
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] ===Loop=i:(7),j,(5)==
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] ===MAPPED===
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] charLastIndexMap[chart]{b} => 6
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] j:5
    2016-12-04 17:57:21.561 CwngaIOSStudy[91415:1579478] substring:start:[i(7)-j(7)], length:(1), text:(b)
    2016-12-04 17:57:21.562 CwngaIOSStudy[91415:1579478] new max:3
    2016-12-04 17:57:21.562 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 7;
        c = 5;
    }
    2016-12-04 17:57:21.562 CwngaIOSStudy[91415:1579478] charLastIndexMap:{
        a = 3;
        b = 7;
        c = 5;
    }
    2016-12-04 17:57:21.562 CwngaIOSStudy[91415:1579478] max:3

### Simplify Path
(TODO)https://leetcode.com/problems/simplify-path/
### Maximum Product Subarray
https://leetcode.com/problems/maximum-product-subarray/
- dp {min: max:}
    
    NSInteger min = MIN(MIN(tmp1, tmp2), [nums[i] integerValue]); //最小和自己比一次
    NSInteger max = MAX(MAX(tmp1, tmp2), [nums[i] integerValue]); //最大和自己比一次

### Longest Palindromic Substring
https://leetcode.com/problems/longest-palindromic-substring/
-> aa
-> aba

### Add Two Numbers
https://leetcode.com/problems/add-two-numbers/

### Count Complete Tree Nodes
https://leetcode.com/problems/count-complete-tree-nodes/
- https://en.wikipedia.org/wiki/Binary_tree#Types_of_binary_trees

### Two Sum

### MaxSequenceSubArrayCount

### Word Break
https://leetcode.com/problems/word-break/

### Minimum Size Subarray Sum
https://leetcode.com/problems/minimum-size-subarray-sum/



### Maximum Depth of Binary Tree
https://leetcode.com/problems/maximum-depth-of-binary-tree/





## Algorithm
### Binary Tree Ordering

node structure

    @interface Node : NSObject
    
    @property (assign, nonatomic) CGFloat value;
    @property (strong, nonatomic) Node *leftNode;
    @property (strong, nonatomic) Node *rightNode;
    
    @end



insert node

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

inorder, preorder, postorder

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

## ADK
### DynamicHeight Cell(label)
- NEED add view width constraint 
    
DynamicHeightViewController

    cell.cellWidth.constant = collectionView.bounds.size.width; //width constraint
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    CollectionViewCell *cell = (CollectionViewCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:CollectionViewCellIdentifier];
    cell.titleLabel.text = [self stringWithMulti:indexPath.row];
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];
    return size;

### DynamicHeight Cell(textview)
DynamicTextViewHeightViewController
- cell text view add height constraint
    ex:TextViewCollectionViewCell 

code:

    @property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;

- calculate text view height constraint ([cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, FLT_MAX)];)

code:

    CGSize textViewSize = [cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, FLT_MAX)]; ///<NOTE set 
    CGSize preferredSize = CGSizeMake(self.collectionView.bounds.size.width, 0.0f);
    TextViewCollectionViewCell *cell = (TextViewCollectionViewCell *)[[ADKNibCacheManager sharedInstance] instanceForNibNamed:TextViewCollectionViewCellIndentifier];

    cell.textView.text = [self stringWithMulti:indexPath.row];
    CGSize textViewSize = [cell.textView sizeThatFits:CGSizeMake(cell.textView.frame.size.width, FLT_MAX)];

    cell.textViewHeightConstraint.constant = textViewSize.height;
    CGSize size = [[ADKCellDynamicSizeCalculator sharedInstance] sizeForDynamicHeightCellInstance:cell preferredSize:preferredSize];

## ReactiveCocoaStudy
ReactiveCocoaStudy

## ch1

### 1. rac_textSignal 

    [self.textField.rac_textSignal subscribeNext:^(id input) {
        NSLog(@"input:%@", input);
    }];

### 2. add filter: ex input.lenght >= 2

    [[self.textField.rac_textSignal filter:^BOOL(NSString * input) {
        return input.length >= 2;
    }] subscribeNext:^(id input) {
        NSLog(@"input:%@", input);
    }];

### 3. throttle

    [[[self.textField.rac_textSignal filter:^BOOL(NSString * input) {
        return input.length >= 2;
    }] throttle:0.6f
      ] subscribeNext:^(id input) {
        NSLog(@"input:%@", input);
    }];
### 4. call RACSignal createSignal -> use flattenMap to chagen signal
#### [RACSignal createSignal:];

    - (RACSignal *)signalForQuery:(NSString *)query
    {
        RACSignal *signal = [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            NSString *q = [[NSString stringWithFormat:@"SELECT * FROM ecsearch.std.search (0, 10) WHERE keyword=\"%@\" and property=\"auction\" and sortBy=\"price\" and sortOrder=\"asc\"", query] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    
            NSString *urlString = [NSString stringWithFormat:@"https://auction.yql.yahoo.com/v1/public/yql?q=%@&format=json", q];
    
            NSURL *url = [NSURL URLWithString:urlString];
            NSURLSession *session = [NSURLSession sharedSession];
            NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
                if (error) {
                    [subscriber sendError:error];
                } else {
                    NSError *jsonError;
                    id json= [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&jsonError];
                    if (jsonError) {
                        [subscriber sendError:jsonError];
                    } else {
                        [subscriber sendNext:json];
                    }
                }
                [subscriber sendCompleted];
    
    
            }];
            [dataTask resume];
            return [RACDisposable disposableWithBlock:^{
                [dataTask cancel];
            }];
        }] retry:5];
        return signal;
    }


#### flattenMap to chagen signal
    [[[[self.textField.rac_textSignal
        filter:^BOOL(NSString * input) {
            return input.length >= 2;
        }] throttle:0.6f
       ] flattenMap:^RACStream *(NSString *value) {
        return [self signalForQuery:value];
    }] subscribeNext:^(id input) {
        NSLog(@"input:%@", input); //will change to api response
    }];

###ch2 
usage of deliverOn, bind data signal to update, rac_liftSelector...

#### case 1: deliverOn:[RACScheduler mainThreadScheduler]] for updateing UI

    [[[[[self.textField.rac_textSignal
          filter:^BOOL(NSString * input) {
              return input.length >= 2;
          }] throttle:0.6f
         ] flattenMap:^RACStream *(NSString *value) {
         return [self signalForQuery:value];
     }] deliverOn:[RACScheduler mainThreadScheduler]]  //update UI need on main thread
      subscribeNext:^(id input) {
          self.data = [input valueForKeyPath:@"query.results.product"];
          NSLog(@"input:%@", input); //will change to api response
          [self.collectionView reloadData];
    }];


#### case 2: bind data to update

    ///NOTE: Bind data to update
    [[[[self.textField.rac_textSignal
        filter:^BOOL(NSString * input) {
            return input.length >= 2;
        }] throttle:0.6f
       ] flattenMap:^RACStream *(NSString *value) {
        return [self signalForQuery:value];
    }]
     subscribeNext:^(id input) {
         self.data = [input valueForKeyPath:@"query.results.product"];
         NSLog(@"input:%@", input); //will change to api response
         //[self.collectionView reloadData]; //DELETE for data as signal
     }];

    //data as signal
    RACSignal *dataSignal = [self rac_valuesForKeyPath:@"data" observer:self];
    [[dataSignal deliverOnMainThread ]subscribeNext:^(id x) {
        //update ui in main thread
        [self.collectionView reloadData];
    }];

#### rac_liftSelector

    RACSignal *didSelectedSignal = [[self rac_signalForSelector:@selector(collectionView:didSelectItemAtIndexPath:) fromProtocol:@protocol(UICollectionViewDelegate)]
                                    map:^id(RACTuple *racTuple) {
                                        NSLog(@"racTuple:%@", racTuple.second);
                                        return racTuple.second;
                                    }];

    [didSelectedSignal subscribeNext:^(NSIndexPath *indexPath) {
        ListingCollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
        Ch2DetailViewController *detailViewController = [[Ch2DetailViewController alloc] init];
        detailViewController.image = cell.imageView.image;
        NSDictionary *data = self.data[indexPath.row];
        detailViewController.title = data[@"title"];
        detailViewController.price = [NSString stringWithFormat:@"$%@", data[@"currentPrice"]];

        [self rac_liftSelector:@selector(presentViewController:animated:completion:) withSignalsFromArray:@[
                                                                                                   [RACSignal return:detailViewController],
                                                                                                   [RACSignal return:@YES],[RACSignal return:nil],
                                                                                                   ]
         ];
    }] ;


