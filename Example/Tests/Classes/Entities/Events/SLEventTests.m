//
//  SLEventTests.m
//  SoulSDK
//
//  Created by Mikhail on 09.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

#import "SLTEventsDataManager.h"

SpecBegin(SLEvent)

describe(@"event object mapping", ^{

    // given
    NSString *kIdKey = @"recordId";
    NSString *kTimeKey = @"time";
    NSString *kTypeKey = @"type";

    NSInteger idInteger = 14;
    NSString *idString = @"14";
    
    double timeDouble = 13424123423.239;
    NSString *timeString = @"13424123423.239";

    NSDictionary *typeDict = @{
                               @"action": @"change",
                               @"object": @"user"
                               };

    SLTEventsDataManager *eventsData = [SLTEventsDataManager new];
    NSObject<SLEventMapperProtocol> *eventMapper = [SLEventMapper new];

    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;

        SLEvent *event = [eventMapper _mapEvent:dict];
        expect(event).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};

        SLEvent *event = [eventMapper _mapEvent:dict];
        expect(event).to.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kIdKey: @(idInteger),
                               kTimeKey: @(timeDouble),
                               kTypeKey: typeDict,
                               };

        SLEvent *event = [eventMapper _mapEvent:dict];
        expect(event).notTo.beNil();

        expect(event.recordId).to.equal( @(idInteger) );
        expect(event.time).to.equal( @(timeDouble) );
        expect(event.type).notTo.beNil();
    });
    
    it(@"mapping #2", ^{
        
        NSDictionary *dict = @{
                               kIdKey: idString,
                               kTimeKey: timeString,
                               kTypeKey: typeDict,
                               };
        
        SLEvent *event = [eventMapper _mapEvent:dict];
        expect(event).notTo.beNil();

        expect(event.recordId).to.equal( @(idInteger) );
        expect(event.time).to.equal( @(timeDouble) );
        expect(event.type).notTo.beNil();
    });

    it(@"mapping from NSNull", ^{
        NSDictionary *dict = @{
                               kIdKey: [NSNull null],
                               kTimeKey: [NSNull null],
                               kTypeKey: [NSNull null],
                               };
        
        SLEvent *event = [eventMapper _mapEvent:dict];
        expect(event).to.beNil();
    });

    ////////////////////////////////////////////////////
    // SLMeEventMapper
    ////////////////////////////////////////////////////

    NSDictionary *meEventDict = [eventsData meEvent];

    it(@"me event mapping #1", ^{

        NSDictionary *dict = meEventDict;
        SLMeEvent *meEvent = [eventMapper mapMeEvent:dict];

        expect(meEvent).notTo.beNil();
        expect(meEvent.me).notTo.beNil();
    });

    it(@"me event mapping #2", ^{

        NSDictionary *dict = meEventDict;
        SLEvent *event = [eventMapper mapEvent:dict];

        expect(event).notTo.beNil();
        expect(event).to.beInstanceOf([SLMeEvent class]);

        SLMeEvent *meEvent = (SLMeEvent *)event;
        expect(meEvent).notTo.beNil();
    });

    ////////////////////////////////////////////////////
    // SLUserEventMapper
    ////////////////////////////////////////////////////
    NSDictionary *userEventDict = [eventsData userEvent];

    it(@"user event mapping #1", ^{

        NSDictionary *dict = userEventDict;
        SLUserEvent *userEvent = [eventMapper mapUserEvent:dict];

        expect(userEvent).notTo.beNil();
        expect(userEvent.user).notTo.beNil();
    });

    it(@"user event mapping #2", ^{

        NSDictionary *dict = userEventDict;
        SLEvent *event = [eventMapper mapEvent:dict];

        expect(event).notTo.beNil();
        expect(event).to.beInstanceOf([SLUserEvent class]);

        SLUserEvent *userEvent = (SLUserEvent *)event;
        expect(userEvent).notTo.beNil();
    });

    ////////////////////////////////////////////////////
    // SLChatEventMapper
    ////////////////////////////////////////////////////

    NSDictionary *chatEventDict = [eventsData chatEvent];

    it(@"chat event mapping #1", ^{

        NSDictionary *dict = chatEventDict;
        SLChatEvent *chatEvent = [eventMapper mapChatEvent:dict];

        expect(chatEvent).notTo.beNil();
        expect(chatEvent.chat).notTo.beNil();
    });

    it(@"chat event mapping #2", ^{

        NSDictionary *dict = chatEventDict;
        SLEvent *event = [eventMapper mapEvent:dict];

        expect(event).notTo.beNil();
        expect(event).to.beInstanceOf([SLChatEvent class]);

        SLChatEvent *chatEvent = (SLChatEvent *)event;
        expect(chatEvent).notTo.beNil();
    });

    ////////////////////////////////////////////////////
    // SLReactionsEventMapper
    ////////////////////////////////////////////////////

    NSDictionary *reactionsEventDict = [eventsData reactionsEvent];

    it(@"reactions event mapping #1", ^{

        NSDictionary *dict = reactionsEventDict;
        SLReactionsEvent *reactionsEvent = [eventMapper mapReactionsEvent:dict];

        expect(reactionsEvent).notTo.beNil();
        expect(reactionsEvent.reactions).notTo.beNil();
    });

    it(@"reactions event mapping #2", ^{

        NSDictionary *dict = reactionsEventDict;
        SLEvent *event = [eventMapper mapEvent:dict];

        expect(event).notTo.beNil();
        expect(event).to.beInstanceOf([SLReactionsEvent class]);

        SLReactionsEvent *reactionsEvent = (SLReactionsEvent *)event;
        expect(reactionsEvent).notTo.beNil();
    });

    ////////////////////////////////////////////////////
    // SLEndpointEvent
    ////////////////////////////////////////////////////

    NSDictionary *endpointEventDict = [eventsData endpointEvent];

    it(@"endpoint event mapping #1", ^{

        NSDictionary *dict = endpointEventDict;
        SLEndpointEvent *endpointEvent = [eventMapper mapEndpointEvent:dict];

        expect(endpointEvent).notTo.beNil();
    });

    it(@"endpoint event mapping #2", ^{

        NSDictionary *dict = endpointEventDict;
        SLEvent *event = [eventMapper mapEvent:dict];

        expect(event).notTo.beNil();
        expect(event).to.beInstanceOf([SLEndpointEvent class]);

        SLEndpointEvent *endpointEvent = (SLEndpointEvent *)event;
        expect(endpointEvent).notTo.beNil();
    });

});

SpecEnd