# CwngaIOSStudy

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
* think about 01 => to be 0, can not begin with "0"
* think about 01 => to be 0, can not begin with "0"
* think about 10 => to be 1, can not 1=>A + 0=>?, will not be 2
* think about 191 => 
  1 => 1;
  19 => 1+9, 19
  191 => 1+9+1, 19+1, (can not i-2 result (1+91))
* so answer to be 2


https://leetcode.com/problems/decode-ways/




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


