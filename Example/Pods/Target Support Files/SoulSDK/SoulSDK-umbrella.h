#import <UIKit/UIKit.h>

#import "SLApiAlbum.h"
#import "SLApiAuth.h"
#import "SLApiPasswordAuth.h"
#import "SLApiPhoneAuth.h"
#import "SLApiChats.h"
#import "SLApiEvents.h"
#import "SLApiMe.h"
#import "SLApiPhoto.h"
#import "SLApiUser.h"
#import "SLApiUsers.h"
#import "SLFilter.h"
#import "SLHttpClient.h"
#import "SLHttpClientProtocol.h"
#import "SLHTTPHeadersManager.h"
#import "SLResponseSerializer.h"
#import "SLHTTPRequest.h"
#import "SLResponse.h"
#import "SLUploadRequest.h"
#import "SLApiBase.h"
#import "SLStorage.h"
#import "SLStorageProtocol.h"
#import "NSMutableDictionary+SLHelper.h"
#import "SLAlbumMapperProtocol.h"
#import "SLAlbumResponseMapperProtocol.h"
#import "SLCompleteAlbumsResponseMapperProtocol.h"
#import "SLMiniAlbumsResponseMapperProtocol.h"
#import "SLAlbumMapper.h"
#import "SLAlbumResponseMapper.h"
#import "SLCompleteAlbumMapper.h"
#import "SLCompleteAlbumsResponseMapper.h"
#import "SLMiniAlbumMapper.h"
#import "SLMiniAlbumsResponseMapper.h"
#import "SLAlbum.h"
#import "SLAlbumResponse.h"
#import "SLCompleteAlbum.h"
#import "SLCompleteAlbumsResponse.h"
#import "SLMiniAlbum.h"
#import "SLMiniAlbumsResponse.h"
#import "SLAuthorizationMapperProtocol.h"
#import "SLPhoneAuthRequestMapperProtocol.h"
#import "SLPhoneAuthVerifyMapperProtocol.h"
#import "SLAuthorizationMapper.h"
#import "SLPhoneAuthRequestMapper.h"
#import "SLPhoneAuthVerifyMapper.h"
#import "SLAuthorization.h"
#import "SLPhoneAuthRequest.h"
#import "SLPhoneAuthVerify.h"
#import "SLChatMapperProtocol.h"
#import "SLChatsManyMapperProtocol.h"
#import "SLChatsObjectCountMapperProtocol.h"
#import "SLChatsOneMapperProtocol.h"
#import "SLChatMapper.h"
#import "SLChatsManyMapper.h"
#import "SLChatsObjectCountMapper.h"
#import "SLChatsOneMapper.h"
#import "SLChat.h"
#import "SLChatsMany.h"
#import "SLChatsObjectCount.h"
#import "SLChatsOne.h"
#import "SLObjectMapperProtocol.h"
#import "SLObjectMapper.h"
#import "SLObject.h"
#import "SLEndpointMapperProtocol.h"
#import "SLEndpointMapper.h"
#import "SLEndpoint.h"
#import "SLErrorMapperProtocol.h"
#import "SLErrorMapper.h"
#import "SLError.h"
#import "SLErrorResponse.h"
#import "SLEventReactionsMapperProtocol.h"
#import "SLEventReactionsUserMapperProtocol.h"
#import "SLEventMapperProtocol.h"
#import "SLEventsResponseMapperProtocol.h"
#import "SLEventTypeMapperProtocol.h"
#import "SLEventReactionsMapper.h"
#import "SLEventReactionsUserMapper.h"
#import "SLChatEventMapper.h"
#import "SLEndpointEventMapper.h"
#import "SLEventMapper.h"
#import "SLEventsResponseMapper.h"
#import "SLEventTypeMapper.h"
#import "SLMeEventMapper.h"
#import "SLReactionsEventMapper.h"
#import "SLUserEventMapper.h"
#import "SLEventReactions.h"
#import "SLEventReactionsUser.h"
#import "SLChatEvent.h"
#import "SLEndpointEvent.h"
#import "SLEvent.h"
#import "SLEventsResponse.h"
#import "SLEventType.h"
#import "SLMeEvent.h"
#import "SLReactionsEvent.h"
#import "SLUserEvent.h"
#import "SLAdditionalInfoMapperProtocol.h"
#import "SLObjectCountMapperProtocol.h"
#import "SLPagingAfterMetaMapperProtocol.h"
#import "SLPagingOffsetMetaMapperProtocol.h"
#import "SLUserRecsMetaMapperProtocol.h"
#import "SLAdditionalInfoMapper.h"
#import "SLObjectCountMapper.h"
#import "SLPagingAfterMetaMapper.h"
#import "SLPagingOffsetMetaMapper.h"
#import "SLUserRecsMetaMapper.h"
#import "SLAdditionalInfo.h"
#import "SLObjectCount.h"
#import "SLPagingAfterMeta.h"
#import "SLPagingOffsetMeta.h"
#import "SLUserRecsMeta.h"
#import "SLLocationMapperProtocol.h"
#import "SLLocationMapper.h"
#import "SLLocation.h"
#import "SLTextMessage.h"
#import "SLNotificationTokensMapperProtocol.h"
#import "SLNotificationTokensMapper.h"
#import "SLNotificationTokens.h"
#import "SLFilterableParametersMapperProtocol.h"
#import "SLUserParametersMapperProtocol.h"
#import "SLFilterableParametersMapper.h"
#import "SLUserParametersMapper.h"
#import "SLFilterableParameters.h"
#import "SLUserParameters.h"
#import "SLPhotoMapperProtocol.h"
#import "SLPhotoResponseMapperProtocol.h"
#import "SLPhotoURLMapperProtocol.h"
#import "SLPhotoMapper.h"
#import "SLPhotoResponseMapper.h"
#import "SLPhotoURLMapper.h"
#import "SLPhoto.h"
#import "SLPhotoResponse.h"
#import "SLPhotoURL.h"
#import "SLReactionMapperProtocol.h"
#import "SLReactionsMapperProtocol.h"
#import "SLReactionMapper.h"
#import "SLReactionsMapper.h"
#import "SLReaction.h"
#import "SLReactions.h"
#import "SLAvailableSubscriptionMapperProtocol.h"
#import "SLAvailableSubscriptionsMapperProtocol.h"
#import "SLSubscriptionDurationMapperProtocol.h"
#import "SLSubscriptionServiceMapperProtocol.h"
#import "SLSubscriptionServicesMapperProtocol.h"
#import "SLAvailableSubscriptionMapper.h"
#import "SLAvailableSubscriptionsMapper.h"
#import "SLSubscriptionDurationMapper.h"
#import "SLSubscriptionServiceMapper.h"
#import "SLSubscriptionServicesMapper.h"
#import "SLAvailableSubscription.h"
#import "SLAvailableSubscriptions.h"
#import "SLSubscriptionDuration.h"
#import "SLSubscriptionService.h"
#import "SLSubscriptionServices.h"
#import "SLMeUserResponseMapperProtocol.h"
#import "SLOtherUserResponseMapperProtocol.h"
#import "SLUserMapperProtocol.h"
#import "SLUsersFilterResponseMapperProtocol.h"
#import "SLUsersRecsResponseMapperProtocol.h"
#import "SLMeUserMapper.h"
#import "SLMeUserResponseMapper.h"
#import "SLOtherUserMapper.h"
#import "SLOtherUserResponseMapper.h"
#import "SLUserMapper.h"
#import "SLUsersFilterResponseMapper.h"
#import "SLUsersRecsResponseMapper.h"
#import "SLBaseUser.h"
#import "SLMeUser.h"
#import "SLMeUserResponse.h"
#import "SLOtherUserResponse.h"
#import "SLUser.h"
#import "SLUsersFilterResponse.h"
#import "SLUsersRecsResponse.h"
#import "SLChatManager.h"
#import "SLConfig.h"
#import "SoulSDK.h"

FOUNDATION_EXPORT double SoulSDKVersionNumber;
FOUNDATION_EXPORT const unsigned char SoulSDKVersionString[];

