//
//  EALiveSocket.m
//  CwngaIOSStudy
//
//  Created by  Anson Ng on 25/05/2017.
//  Copyright © 2017 Yahoo! Inc. All rights reserved.
//
#import <SocketRocket/SocketRocket.h>
#import <UIKit/UIKit.h>
#import "EALiveSocket.h"

@interface EALiveSocket () <SRWebSocketDelegate>

@property (strong, nonatomic) SRWebSocket *webSocket;
@property (strong, nonatomic)  void(^joinRoomBlock)(void);
@end

@implementation EALiveSocket


- (instancetype)initWithURL:(NSURL *)url
{
    self = [super init];
    self.webSocket = (SRWebSocket *)[[SRWebSocket alloc] initWithURL:[NSURL URLWithString:@"ws://joiningcoining.corp.sg3.yahoo.com:4080/messages/v1/chatRooms"]];
    self.webSocket.delegate = self;
    return self;
}

- (void)open
{
    [self.webSocket open];
}

- (void)close
{
    [self.webSocket close];
}
#pragma mark - Send Message Message Methods
- (void)joinRoomWithId:(NSString *)roomId
{
    __weak typeof (self) weakSelf = self;
    self.joinRoomBlock = ^() {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:@{
                                                                     @"action": @"join",
                                                                     @"chatRoom": @{@"id": roomId}
                                                                     }
                                                           options:0
                                                             error:&error];
        [weakSelf.webSocket send:[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding]];
    };

    if (self.webSocket.readyState == SR_OPEN) {
        self.joinRoomBlock();
    }
}

#pragma mark - <SRWebSocketDelegate>
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    if ([self.delegate respondsToSelector:@selector(eaLiveSocket:didReceiveMessage:)]) {
        [self.delegate eaLiveSocket:self didReceiveMessage:message];
    }
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    if (self.joinRoomBlock) {
        self.joinRoomBlock();
    }
    if ([self.delegate respondsToSelector:@selector(didEALiveSocketOpen:)]) {
        [self.delegate didEALiveSocketOpen:self];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    if ([self.delegate respondsToSelector:@selector(eaLiveSocket:didFailWithError:)]) {
        [self.delegate eaLiveSocket:self didFailWithError:error];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    if ([self.delegate respondsToSelector:@selector(didEALiveSocketClose:)]) {
        [self.delegate didEALiveSocketClose:self];
    }
}

- (void)webSocket:(SRWebSocket *)webSocket didReceivePong:(NSData *)pongPayload
{
}

// Return YES to convert messages sent as Text to an NSString. Return NO to skip NSData -> NSString conversion for Text messages. Defaults to YES.
- (BOOL)webSocketShouldConvertTextFrameToString:(SRWebSocket *)webSocket
{
    return YES;
}


@end
