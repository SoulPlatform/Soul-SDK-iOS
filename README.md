#Руководство для iOS
Soul – это mBaaS (mobile backend as a service) облачный сервис, позволяющий создавать и эксплуатировать приложения без необходимости написания server-side кода, поднятия собственных серверов и их поддержки. 

## Описание SoulSDK
**SoulSDK** предоставляет собой набор удобных инструментов для работы с Soul API.
Основные классы SDK:
* `SLApiMe` - предоставляет средства для работы с текущим пользователем. 
* `SLApiAuth` - методы для авторизации пользователей. В данной версии SDK поддерживается авторизации только через подтверждение по SMS
* `SLApiUser` - методы для работы с остальными пользователями: загрузка профиля по id, альбомы, реакции и т.д.
* `SLApiUsers` - методы для поиска, фильтрации рекомендованных пользователей;
* `SLApiAlbum` - методы для работы со своими альбомами: создание, удаление, добавление фото и т.д.
* `SLApiPhoto` - методы для работы с фотографиями: Загрузка, изменение, удаление;
* `SLApiChats` - методы для создания, удаления, постраничной загрузки чатов;
* `SLApiEvents` - получение списка событий для текущего пользователя.

## Установка
Для установки SoulSDK необходимо в pofile добавить следующее:

```
pod 'SoulSDK', :git => 'https://github.com/SoulPlatform/Soul-SDK-iOS', :branch => 'hackathon'
```

## Использование
Добавьте заголовочный файл в ваше приложение чтобы получить все необходимые классы:

```obj-c
#import <SoulSDK/SoulSDK.h>
```

### Инициализация

```obj-c
SLConfig *config = [SLConfig defaultConfig];
config.apiKey = @"*********";

[SoulSDK activateWithApiConfig:config];
```

### Авторизация по телефону

Для авторизации по номеру телефона необходимо получить код подтверждения.

```obj-c
SoulSDK *soulSDK = [SoulSDK instance];
NSString *phoneNumber = @"+79061234567";

[[soulSDK phoneAuth] getCode:phoneNumber success:^(SLPhoneAuthRequest *_Nonnull response) {
    
    NSLog(@"Status: %d", response.status);

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```

После проверки полученного кода пользователь будет зарегистрирован

```obj-c
[[soulSDK phoneAuth] verify:phoneNumber code:code success:^(SLPhoneAuthVerify *_Nonnull response) {

    NSLog(@"%@ / %@", response.me.userId, response.authorization.sessionToken);

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```

### Профиль пользователя

В панеле администратора разработчик определяет параметры пользователей. Информация о пользователе будет использоваться для поиска подходящих партнёров. 

В Soul предусмотрено несколько типов пользовательских параметров: 
* `filterable` - параметры, которые влияют или могут влиять на фильтрацию результатов при поиске пользователей
* `publicVisible` - параметры, доступные другим пользователям
* `publicWritable` - данные пользователя, которые могут быть изменены другими пользователями
* `privateVisible` - данные, доступные для изменения и просмотра только текущим пользователем

```obj-c
NSDictionary *filterable = @{
                             @"age": @(32),
                             @"gender": @"male",
                             @"pets": @"kitten",
                             @"car": @"bmw",
                             };

SoulSDK *soulSDK = [SoulSDK instance];

[[soulSDK me] setFilterableParameters:filterable success:^(SLMeUserResponse *_Nonnull response) {

    NSLog(@"%@", response.me.parameters.filterable);

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```
### Создание альбома

```obj-c
NSString *albumName = @"Best album ever";

[[soulSDK me] addAlbum:albumName success:^{
    
    NSLog(@"success");

} failure:^(NSError * _Nullable error) {

    NSLog(@"%@", error);
}];
```
### Загрузка фотографии

```obj-c

NSData *photoData = UIImagePNGRepresentation(image);

[[soulSDK album] addPhoto:photoData toAlbum:album.name success:^(SLPhotoResponse * _Nonnull response) {

    NSLog(@"%@", response.photo.photoId);

} failure:^(NSError * _Nullable error) {

    NSLog(@"error");
}];
```

### Поиск партнёров

Для поиска партнёров нужно определить сессию поиска и с каждым запросом передавать новый токен запроса. Если поск партнёров завершился неудачно, его можно повторить передав тот же токен.

```obj-c
NSString *session = @"";
NSString *token = @"";

[soulSDK loadBySession:session uniqueToken:token success:^(SLUsersRecsResponse *_Nonnull responce) {

    for (SLUser *user in responce.users) {
    	NSLog(@"%@", user.userId);
    }

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```

### Отправка реакций

В панеле администратора разработчик определяет тип реакции и возможные значения для данного типа реакции.

```obj-c
NSString *type = @"liking";
NSString *value = @"disliked";

NSDate *expiresDate = [NSDate date];
NSNumber *expiresTime = @([expiresDate timeIntervalSince1970]);

[[soulSDK user] sendReactionByType:type value:value userId:user.userId expiresTime:expiresTime success:^(SLOtherUserResponse *_Nonnull responce) {

    NSLog(@"%@", responce.user.reactions.sentByMe);

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```
#### События
Для реакций в панели администратора можно настроить триггеры, которые могут порождать события. Получения новых собитый:

```obj-c
SoulSDK *soulSDK = [SoulSDK instance];
SLEvent *event = [SLEvent new];
NSNumber *limit = @(20);

[[soulSDK events] loadAfter:event.recordId limit:limit success:^(SLApiEventsSuccess *_Nonnull responce) {
    for (SLEvent *user in responce.events) {
    	NSLog(@"%@", user.recordId);
    }

} failure:^(NSError *_Nullable error) {
    NSLog(@"%@", error);
}];
```


### Сообщения

```obj-c
SLChat *lastChat = [SLChat new];
NSNumber *limit = @(20);

[[soulSDK chats] loadChatsAfter:lastChat.chatId limit:limit success:^(SLChatsMany *_Nonnull responce) {

    for (SLChat *chat in responce.chats) {
        NSLog(@"%@ / %@", chat.chatId, chat.channelName);
    }

} failure:^(NSError *_Nullable error) {

    NSLog(@"%@", error);
}];
```
### Загрузка истории

```obj-c
SLChatManager *chatManager = [soulSDK chatManager:chat];

[chatManager getHistory:^(NSArray <SLTextMessage *> *messages) {

    for (SLTextMessage *message in messages) {
        NSLog(@"%@", message.text);
    }

} failure:^{

    NSLog(@"error");
}];
```

### Отправка сообщений

```obj-c
SLChatManager *chatManager = [soulSDK chatManager:chat];
NSString *text = @"Hello, how are you?";

[chatManager sendMessage:text success:^(SLTextMessage *message) {

    NSLog(@"%@", message.text);

} failure:^{

    NSLog(@"error");
}];
```

### Получение сообщений

```obj-c
SLChatManager *chatManager = [soulSDK chatManager:chat];
chatManager.delegate = self;
```

После этого необходимо реализовать протокол `SLChatManagerProtocol`
```obj-c
- (void)messageReceived:(SLTextMessage *)message {

    NSLog(@"%@", message.text);
}
```
