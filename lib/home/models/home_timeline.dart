class Tweet {
  String createdAt;
  int id;
  String idStr;
  String? text;
  String? fullText;
  String? source;
  bool? truncated;
  int? inReplyToStatusId;
  String? inReplyToStatusIdStr;
  int? inReplyToUserId;
  String? inReplyToUserIdStr;
  String? inReplyToScreenName;
  User? user;
  Coordinates? coordinates;
  Place? place;
  int? quotedStatusId;
  String? quotedStatusIdStr;
  bool? isQuoteStatus;
  Tweet? quotedStatus;
  Tweet? retweetedStatus;
  ExtendedTweet? extendedTweet;
  int? quoteCount;
  int? replyCount;
  int? retweetCount;
  int? favoriteCount;
  Entities? entities;
  ExtendedEntities? extendedEntities;
  bool? favorites;
  bool? retweeted;
  bool? possiblySensitive;
  String? filterLevel;
  String? lang;

  Tweet(
    this.createdAt,
    this.id,
    this.idStr, {
    this.text,
    this.fullText,
    this.source,
    this.truncated,
    this.user,
    this.isQuoteStatus,
    this.retweetCount,
    this.entities,
    this.extendedEntities,
    this.retweeted,
    this.filterLevel,
    this.inReplyToStatusId,
    this.inReplyToStatusIdStr,
    this.inReplyToUserId,
    this.inReplyToUserIdStr,
    this.inReplyToScreenName,
    this.coordinates,
    this.place,
    this.quotedStatusId,
    this.quotedStatusIdStr,
    this.quotedStatus,
    this.retweetedStatus,
    this.extendedTweet,
    this.quoteCount,
    this.replyCount,
    this.favoriteCount,
    this.favorites,
    this.possiblySensitive,
    this.lang,
  });

  factory Tweet.fromJson(Map<String, dynamic> json) => Tweet(
        json['created_at'],
        json['id'],
        json['id_str'],
        text: json['text'],
        fullText: json['full_text'],
        source: json['source'],
        truncated: json['truncated'],
        user: json['user'] != null ? User.fromJson(json['user']) : null,
        isQuoteStatus: json['is_quote_status'],
        retweetCount: json['retweet_count'],
        entities: json['entities'] != null
            ? Entities.fromJson(json['entities'])
            : null,
        extendedEntities: json['extended_entities'] != null
            ? ExtendedEntities.fromJson(json['extended_entities'])
            : null,
        retweeted: json['retweeted'],
        filterLevel: json['filter_level'],
        inReplyToStatusId: json['in_reply_to_status_id'],
        inReplyToStatusIdStr: json['in_reply_to_status_id_str'],
        inReplyToUserId: json['in_reply_to_user_id'],
        inReplyToUserIdStr: json['in_reply_to_user_id_str'],
        inReplyToScreenName: json['in_reply_to_screen_name'],
        coordinates: json['coordinates'] != null
            ? Coordinates.fromJson(json['coordinates'])
            : null,
        place: json['place'] != null ? Place.fromJson(json['place']) : null,
        quotedStatusId: json['quoted_status_id'],
        quotedStatusIdStr: json['quoted_status_id_str'],
        quotedStatus: json['quoted_status'] != null
            ? Tweet.fromJson(json['quoted_status'])
            : null,
        retweetedStatus: json['retweeted_status'] != null
            ? Tweet.fromJson(json['retweeted_status'])
            : null,
        extendedTweet: json['extended_tweet'] != null
            ? ExtendedTweet.fromJson(json['extended_tweet'])
            : null,
        quoteCount: json['quote_count'],
        replyCount: json['reply_count'],
        favoriteCount: json['favorite_count'],
        favorites: json['favorited'],
        possiblySensitive: json['possibly_sensitive'],
        lang: json['lang'],
      );
}

class ExtendedTweet {
  String fullText;
  Entities? entities;
  ExtendedTweet(this.fullText, this.entities);

  factory ExtendedTweet.fromJson(Map<String, dynamic> json) => ExtendedTweet(
        json['full_text'],
        json['entities'] != null ? Entities.fromJson(json['entities']) : null,
      );
}

class Coordinates {
  List<double> coordinates;
  String type;

  Coordinates(
    this.coordinates,
    this.type,
  );

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        json['coordinates'],
        json['type'],
      );
}

class Entities {
  List<Hashtag>? hashtags;
  List<Media>? media;
  List<URL>? urls;
  List<UserMention>? userMentions;

  Entities({this.hashtags, this.media, this.urls, this.userMentions});

  factory Entities.fromJson(Map<String, dynamic> json) => Entities(
        hashtags: json['hashtags'] != null
            ? json['hashtags']
                .map((hashtag) => Hashtag.fromJson(hashtag))
                .toList()
                .cast<Hashtag>()
            : null,
        media: json['media'] != null
            ? json['media']
                .map((media) => Media.fromJson(media))
                .toList()
                .cast<Media>()
            : null,
        urls: json['urls'] != null
            ? json['urls'].map((url) => URL.fromJson(url)).toList().cast<URL>()
            : null,
        userMentions: json['user_mentions'] != null
            ? json['user_mentions']
                .map((mention) => UserMention.fromJson(mention))
                .toList()
                .cast<UserMention>()
            : null,
      );
}

class ExtendedEntities {
  List<Media>? media;

  ExtendedEntities({
    this.media,
  });

  factory ExtendedEntities.fromJson(Map<String, dynamic> json) =>
      ExtendedEntities(
        media: json['media'] != null
            ? json['media']
                .map((media) => Media.fromJson(media))
                .toList()
                .cast<Media>()
            : null,
      );
}

class Hashtag {
  List<int> indices;
  String text;

  Hashtag(
    this.indices,
    this.text,
  );

  factory Hashtag.fromJson(Map<String, dynamic> json) => Hashtag(
        json['indices'].cast<int>(),
        json['text'],
      );
}

class Media {
  String displayUrl;
  String expandedUrl;
  int id;
  String idStr;
  List<int> indices;
  String mediaUrl;
  String mediaUrlHttps;
  Sizes? sizes;
  int? sourceStatusId;
  String? sourceStatusIdStr;
  String type;
  String url;
  VideoInfo? videoInfo;

  Media(
    this.displayUrl,
    this.expandedUrl,
    this.id,
    this.idStr,
    this.indices,
    this.mediaUrl,
    this.mediaUrlHttps,
    this.sizes,
    this.type,
    this.url, {
    this.sourceStatusId,
    this.sourceStatusIdStr,
    this.videoInfo,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        json['display_url'],
        json['expanded_url'],
        json['id'],
        json['id_str'],
        json['indices'].cast<int>(),
        json['media_url'],
        json['media_url_https'],
        json['sizes'] != null ? Sizes.fromJson(json['sizes']) : null,
        json['type'],
        json['url'],
        sourceStatusId: json['source_status_id'],
        sourceStatusIdStr: json['source_status_id_str'],
        videoInfo: json['video_info'] != null
            ? VideoInfo.fromJson(json['video_info'])
            : null,
      );
}

class VideoInfo {
  List<int> aspectRatio;
  int? durationMillis;
  List<VideoVariant> variants;
  VideoInfo(
    this.aspectRatio,
    this.durationMillis,
    this.variants,
  );

  factory VideoInfo.fromJson(Map<String, dynamic> json) => VideoInfo(
        json['aspect_ratio'].cast<int>(),
        json['duration_millis'],
        json['variants']
            .map((variant) => VideoVariant.fromJson(variant))
            .toList()
            .cast<VideoVariant>(),
      );
}

class VideoVariant {
  int? bitrate;
  String contentType;
  String url;

  VideoVariant(this.contentType, this.url, [this.bitrate]);

  factory VideoVariant.fromJson(Map<String, dynamic> json) =>
      VideoVariant(json['content_type'], json['url'], json['bitrate']);
}

class URL {
  String displayUrl;

  String expandedUrl;

  List<int> indices;

  String url;

  URL(
    this.displayUrl,
    this.expandedUrl,
    this.indices,
    this.url,
  );

  factory URL.fromJson(Map<String, dynamic> json) => URL(
        json['display_url'],
        json['expanded_url'],
        json['indices'].cast<int>(),
        json['url'],
      );
}

class UserMention {
  int id;

  String idStr;

  List<int> indices;

  String name;

  String screenName;

  UserMention(
    this.id,
    this.idStr,
    this.indices,
    this.name,
    this.screenName,
  );

  factory UserMention.fromJson(Map<String, dynamic> json) => UserMention(
        json['id'],
        json['id_str'],
        json['indices'].cast<int>(),
        json['name'],
        json['screen_name'],
      );
}

class Symbol {
  List<int> indices;

  String text;

  Symbol(this.indices, this.text);

  factory Symbol.fromJson(Map<String, dynamic>? json) => Symbol(
        json?['indices'],
        json?['text'],
      );
}

class Place {
  String id;
  String url;
  String placeType;
  String name;
  String fullName;
  String countryCode;
  String country;

  Place(
    this.id,
    this.url,
    this.placeType,
    this.name,
    this.fullName,
    this.countryCode,
    this.country,
    //this.boundingBox,
  );

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        json['id'],
        json['url'],
        json['place_type'],
        json['name'],
        json['full_name'],
        json['country_code'],
        json['country'],
      );
}

class Sizes {
  Size thumb;
  Size large;
  Size medium;
  Size small;

  Sizes(this.thumb, this.large, this.medium, this.small);

  factory Sizes.fromJson(Map<String, dynamic> json) => Sizes(
        Size.fromJson(json['thumb']),
        Size.fromJson(json['large']),
        Size.fromJson(json['medium']),
        Size.fromJson(json['small']),
      );
}

class Size {
  int w;
  int h;
  String resize;
  Size(this.w, this.h, this.resize);

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        json['w'],
        json['h'],
        json['resize'],
      );
}

class User {
  int id;
  String idStr;
  String name;
  String screenName;
  String? location;
  String? url;
  String? description;
  bool? protected;
  bool? verified;
  int? followersCount;
  int? friendsCount;
  int? listedCount;
  int? favouritesCount;
  int? statusesCount;
  String? createdAt;
  String? profileBannerUrl;
  String? profileImageUrlHttps;
  bool? defaultProfile;
  bool? defaultProfileImage;
  List<String>? withheldInCountries;
  String? withheldScope;
  Tweet? status;

  User(
    this.id,
    this.idStr,
    this.name,
    this.screenName,
    this.createdAt, {
    this.protected,
    this.verified,
    this.followersCount,
    this.friendsCount,
    this.listedCount,
    this.favouritesCount,
    this.statusesCount,
    this.profileBannerUrl,
    this.profileImageUrlHttps,
    this.defaultProfile,
    this.defaultProfileImage,
    this.withheldInCountries,
    this.withheldScope,
    this.location,
    this.url,
    this.description,
    this.status,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['id'],
        json['id_str'],
        json['name'],
        json['screen_name'],
        json['created_at'],
        protected: json['protected'],
        verified: json['verified'],
        followersCount: json['followers_count'],
        friendsCount: json['friends_count'],
        listedCount: json['listed_count'],
        favouritesCount: json['favourites_count'],
        statusesCount: json['statuses_count'],
        profileBannerUrl: json['profile_banner_url'],
        profileImageUrlHttps: json['profile_image_url_https'],
        defaultProfile: json['default_profile'],
        defaultProfileImage: json['default_profile_image'],
        withheldInCountries: json['withheld_in_countries'] != null
            ? json['withheld_in_countries'].cast<String>()
            : null,
        withheldScope: json['withheld_scope'],
        location: json['location'],
        url: json['url'],
        description: json['description'],
        status: json['status'] != null ? Tweet.fromJson(json['status']) : null,
      );
}
