//
//  EALiveSocket.h
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 25/05/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
@class EALiveSocket;

@protocol EALiveSocketDelegate <NSObject>

@optional

- (void)didEALiveSocketOpen:(EALiveSocket *)socket;
- (void)didEALiveSocketClose:(EALiveSocket *)socket;
- (void)eaLiveSocket:(EALiveSocket *)socket didReceiveMessage:(id)message;
- (void)eaLiveSocket:(EALiveSocket *)socket didFailWithError:(NSError *)error;

@end

@interface EALiveSocket : NSObject

@property (weak, nonatomic) id <EALiveSocketDelegate> delegate;

- (instancetype)initWithURL:(NSURL *)url;
- (void)open;
- (void)close;
- (void)joinRoomWithId:(NSString *)roomId;


@end
