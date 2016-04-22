//
//  SLNotificationTokensTests.m
//  SoulSDK
//
//  Created by Mikhail on 25.02.16.
//  Copyright © 2016 Mikhail Shershnev. All rights reserved.
//

SpecBegin(SLNotificationTokens)

describe(@"notification tokens mapping", ^{

    // given
    NSString *kGCMTokenKey = @"GCM";
    NSString *kAPNSTokenKey = @"APNS";

    //
    NSString *gcmTokenString = @"APA91bHPRgkF3JUikC4ENAHEeMrd41Zxv3hVZjC9KtT8OvPVGJ-hQMRKRrZuJAEcl7B338qju59zJMjw2DELjzEvxwYv7hH5Ynpc1ODQ0aT4U4OFEeco8ohsN5PjL1iC2dNtk2BAokeMCg2ZXKqpc8FXKmhX94kIxQ";
    NSString *apnsTokenString = @"e7e567bc6585447054e82702a8065bcd2878b085d664ef349daca7692ebecff7";

    SLNotificationTokensMapper *notificationTokensMapper = [SLNotificationTokensMapper new];

    //
    it(@"mapping from nil dict", ^{

        NSDictionary *dict = nil;
        SLNotificationTokens *notificationTokens = [notificationTokensMapper mapNotificationTokens:dict];

        expect(notificationTokens).to.beNil();
    });
    
    it(@"mapping from empty dict", ^{

        NSDictionary *dict = @{};
        SLNotificationTokens *notificationTokens = [notificationTokensMapper mapNotificationTokens:dict];

        expect(notificationTokens).notTo.beNil();
        expect(notificationTokens.gcmToken).to.beNil();
        expect(notificationTokens.apnsToken).to.beNil();
    });

    it(@"normal mapping", ^{

        NSDictionary *dict = @{
                               kGCMTokenKey: gcmTokenString,
                               kAPNSTokenKey: apnsTokenString,
                               };

        SLNotificationTokens *notificationTokens = [notificationTokensMapper mapNotificationTokens:dict];

        //
        expect(notificationTokens).notTo.beNil();
        expect(notificationTokens.gcmToken).to.equal(gcmTokenString);
        expect(notificationTokens.apnsToken).to.equal(apnsTokenString);
    });

    it(@"mapping from NSNull", ^{

        NSDictionary *dict = @{
                               kGCMTokenKey: [NSNull null],
                               kAPNSTokenKey: [NSNull null],
                               };

        SLNotificationTokens *notificationTokens = [notificationTokensMapper mapNotificationTokens:dict];

        //
        expect(notificationTokens).notTo.beNil();
        expect(notificationTokens.gcmToken).to.beNil();
        expect(notificationTokens.apnsToken).to.beNil();
    });
    
});

SpecEnd