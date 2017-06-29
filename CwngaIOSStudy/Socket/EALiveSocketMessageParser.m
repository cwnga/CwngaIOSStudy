//
//  EALiveMessageParser.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 02/06/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//
#import "EALiveMessageParser.h"


@implementation EALiveMessageParser

+ (NSArray <EALiveMessage *> *)parserMessage:(NSString *)message
{
    NSMutableArray *liveMessages = [NSMutableArray array];
    if ([message isKindOfClass:[NSString class]]) {
        NSError *error = nil;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[message dataUsingEncoding:NSUTF8StringEncoding]
                                                             options:NSJSONReadingMutableContainers
                                                               error:&error];
        //{"messages":[{"role":"system","nickname":"system","type":"placeBid","content":"小明已出價 100 元","timestamp":"2017-06-02T08:22:14Z"}]}
        if (!error && dict[@"messages"] && [dict[@"messages"] isKindOfClass:[NSArray class]]) {
            NSArray *messages = dict[@"messages"];
            for (NSDictionary *rowMessage in messages) {
                EALiveMessage *liveMessage = [self parserRowMessageDict:rowMessage];
                if (liveMessage) {
                    [liveMessages addObject:liveMessage];
                }
            }
        }
    }
    return [liveMessages copy];
}

+ (EALiveMessage *)parserRowMessageDict:(NSDictionary *)messageDict
{


    static NSDictionary *messageTypeMapping;
    if (!messageTypeMapping) {

        messageTypeMapping= @{
                              @"placeBid": @"EALivePlaceBidMessage",
                              @"highestBid": @"EALiveHighestBidMessage",
                              @"wonBid": @"EALiveWonBidMessage",
                              @"closedBid": @"EALiveClosedBidMessage",
                              @"cancelledBid": @"EALiveCancelledBidMessage",
                              @"exceededBid": @"EALiveExceededBidMessage",
                              @"productUpdate": @"EALiveProductUpdateMessage",

                              };
    }
    EALiveMessage *liveMessage;
    NSError *err;
    NSString *className = messageTypeMapping[messageDict[@"type"]] ? messageTypeMapping[messageDict[@"type"]] : @"EALiveMessage";
    if (className) {
        liveMessage = [[NSClassFromString(className) alloc] initWithDictionary:messageDict error:&err];
    }
    return liveMessage;
}
@end
