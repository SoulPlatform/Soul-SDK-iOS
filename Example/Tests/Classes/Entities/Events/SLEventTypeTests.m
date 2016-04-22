//
//  SLEventTypeTests.m
//  SoulSDK
//
//  Created by Mikhail on 09.03.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLEventType)

describe(@"event type object mapping", ^{

    // given
    NSString *kActionKey = @"action";
    NSString *kObjectKey = @"object";

    NSString *objectMe = @"me";
    NSString *objectUser = @"user";
    NSString *objectChat = @"chat";
    NSString *objectEndpoint = @"endpoint";
    NSString *objectReactions = @"reactions";

    NSString *actionChange = @"change";
    NSString *actionAddition = @"addition";

    NSString *actionUnknown = @"none";
    NSString *objectUnknown = @"none";

    NSObject<SLEventTypeMapperProtocol> *typeMapper = [SLEventTypeMapper new];

    it(@"mapping from nil dict", ^{
        
        NSDictionary *dict = nil;
        
        SLEventType *type = [typeMapper mapEventType:dict];
        expect(type).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{
        
        NSDictionary *dict = @{};
        
        SLEventType *type = [typeMapper mapEventType:dict];
        expect(type).notTo.beNil();
    });

    it(@"mapping #1", ^{

        NSDictionary *dict = @{
                               kObjectKey: objectMe,
                               kActionKey: actionChange,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionChangeType) );
        expect(type.object).to.equal( @(SLEventObjectMeType) );
    });
    
    it(@"mapping #2", ^{
        
        NSDictionary *dict = @{
                               kObjectKey: objectUser,
                               kActionKey: actionChange,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionChangeType) );
        expect(type.object).to.equal( @(SLEventObjectUserType) );
    });

    it(@"mapping #3", ^{

        NSDictionary *dict = @{
                               kObjectKey: objectChat,
                               kActionKey: actionAddition,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionAdditionType) );
        expect(type.object).to.equal( @(SLEventObjectChatType) );
    });

    it(@"mapping #4", ^{

        NSDictionary *dict = @{
                               kObjectKey: objectEndpoint,
                               kActionKey: actionAddition,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionAdditionType) );
        expect(type.object).to.equal( @(SLEventObjectEndpointType) );
    });

    it(@"mapping #5", ^{

        NSDictionary *dict = @{
                               kObjectKey: objectReactions,
                               kActionKey: actionChange,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionChangeType) );
        expect(type.object).to.equal( @(SLEventObjectReactionsType) );
    });

    it(@"mapping #6", ^{

        NSDictionary *dict = @{
                               kObjectKey: objectUnknown,
                               kActionKey: actionUnknown,
                               };

        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.equal( @(SLEventActionUnknownType) );
        expect(type.object).to.equal( @(SLEventObjectUnknownType) );
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kObjectKey: [NSNull null],
                               kActionKey: [NSNull null],
                               };
        SLEventType *type = [typeMapper mapEventType:dict];

        expect(type).notTo.beNil();
        expect(type.action).to.beFalsy();
        expect(type.object).to.beFalsy();
    });

});

SpecEnd