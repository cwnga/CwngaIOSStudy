//
//  EALiveMessage.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 02/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface EALiveMessageAttribute : JSONModel

@end


@interface EALiveMessage : JSONModel

@property (strong, nonatomic) NSString *role;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *content;
@property (strong, nonatomic) NSDate *timestamp;
@property (strong, nonatomic) EALiveMessageAttribute <Optional> *attributes;

@end
//placeBid
@interface EALivePlaceBidMessage : EALiveMessage

@end

//HighestBid

@interface EALiveMessageHighestBidAttribute : EALiveMessageAttribute
/*
 1.最高出價者 nickname
 2.最高出價者 ecid
 3.最高出價金額  price
 4.listingId
 */
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *ecid;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *listingId;

@end

@interface EALiveHighestBidMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageHighestBidAttribute *attributes;

@end




//WonBid

@interface EALiveMessageWonBidAttribute : EALiveMessageAttribute
/*
 "1.得標者 nickname
 2.得標者 ecid
 3.得標金額 price
 4.listingId "*/
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *ecid;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *listingId;

@end

@interface EALiveWonBidMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageWonBidAttribute *attributes;

@end


//ClosedBid

@interface EALiveMessageClosedBidAttribute : EALiveMessageAttribute
/*
 "1.listingId
 2.name"*/
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *listingId;


@end

@interface EALiveClosedBidMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageHighestBidAttribute *attributes;

@end


//CancelledBid

@interface EALiveMessageCancelledBidAttribute : EALiveMessageAttribute
/*
 "1.listingId
 2.name"*/
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *listingId;

@end

@interface EALiveCancelledBidMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageCancelledBidAttribute *attributes;

@end


//ExceededBid

@interface EALiveMessageExceededBidAttribute : EALiveMessageAttribute
/*
 "1.listingId
 2.上次出價金額  price"
 */
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *listingId;
@end

@interface EALiveExceededBidMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageExceededBidAttribute *attributes;

@end


//ProductUpdate

@interface EALiveMessageProductUpdateAttribute : EALiveMessageAttribute
/*
 image: https://xxx/xx/xx
 title: zzz
 price: 100
 stock: 12
 listingId
 */
@property (strong, nonatomic) NSString *image;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *price;
@property (strong, nonatomic) NSString *stock;
@property (strong, nonatomic) NSString *listingId;

@end

@interface EALiveProductUpdateMessage : EALiveMessage

@property (strong, nonatomic) EALiveMessageProductUpdateAttribute *attributes;

@end
