class PhotoModel {
  int? total;
  int? totalPages;
  List<Results>? results;

  PhotoModel({this.total, this.totalPages, this.results});

  PhotoModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  Links? links;
  List<Null>? categories;
  int? likes;
  bool? likedByUser;
  List<Null>? currentUserCollections;
  Null? sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;
  List<Tags>? tags;

  Results(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.promotedAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.description,
      this.altDescription,
      this.urls,
      this.links,
      this.categories,
      this.likes,
      this.likedByUser,
      this.currentUserCollections,
      this.sponsorship,
      this.topicSubmissions,
      this.user,
      this.tags});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    if (json['categories'] != null) {
      categories = <Null>[];
      // json['categories'].forEach((v) {
      //   categories!.add(Null.fromJson(v));
      // });
    }
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    if (json['current_user_collections'] != null) {
      currentUserCollections = <Null>[];
      // json['current_user_collections'].forEach((v) {
      //   currentUserCollections!.add(Null.fromJson(v));
      // });
    }
    sponsorship = json['sponsorship'];
    topicSubmissions = json['topic_submissions'] != null
        ? new TopicSubmissions.fromJson(json['topic_submissions'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    if (this.currentUserCollections != null) {
      // data['current_user_collections'] =
      //     this.currentUserCollections!.map((v) => v.toJson()).toList();
    }
    data['sponsorship'] = this.sponsorship;
    if (this.topicSubmissions != null) {
      data['topic_submissions'] = this.topicSubmissions!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  String? thumb;
  String? smallS3;

  Urls(
      {this.raw,
      this.full,
      this.regular,
      this.small,
      this.thumb,
      this.smallS3});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
    smallS3 = json['small_s3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['raw'] = this.raw;
    data['full'] = this.full;
    data['regular'] = this.regular;
    data['small'] = this.small;
    data['thumb'] = this.thumb;
    data['small_s3'] = this.smallS3;
    return data;
  }
}

class Links {
  String? self;
  String? html;
  String? download;
  String? downloadLocation;

  Links({this.self, this.html, this.download, this.downloadLocation});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    download = json['download'];
    downloadLocation = json['download_location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    // data['download'] = this.download;
    // data['download_location'] = this.downloadLocation;
    return data;
  }
}

class TopicSubmissions {
  Wallpapers? wallpapers;
  Wallpapers? nature;
  Wallpapers? experimental;
  Wallpapers? texturesPatterns;

  TopicSubmissions(
      {this.wallpapers, this.nature, this.experimental, this.texturesPatterns});

  TopicSubmissions.fromJson(Map<String, dynamic> json) {
    wallpapers = json['wallpapers'] != null
        ? new Wallpapers.fromJson(json['wallpapers'])
        : null;
    nature =
        json['nature'] != null ? new Wallpapers.fromJson(json['nature']) : null;
    experimental = json['experimental'] != null
        ? new Wallpapers.fromJson(json['experimental'])
        : null;
    texturesPatterns = json['textures-patterns'] != null
        ? new Wallpapers.fromJson(json['textures-patterns'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // if (this.wallpapers != null) {
    //   data['wallpapers'] = this.wallpapers!.toJson();
    // }
    if (this.nature != null) {
      data['nature'] = this.nature!.toJson();
    }
    // if (this.experimental != null) {
    //   data['experimental'] = this.experimental!.toJson();
    // }
    // if (this.texturesPatterns != null) {
    //   data['textures-patterns'] = this.texturesPatterns!.toJson();
    // }
    return data;
  }
}

class Wallpapers {
  String? status;
  String? approvedOn;

  Wallpapers({this.status, this.approvedOn});

  Wallpapers.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    approvedOn = json['approved_on'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['approved_on'] = this.approvedOn;
    return data;
  }
}

class User {
  String? id;
  String? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  Links? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;
  Social? social;

  User(
      {this.id,
      this.updatedAt,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.twitterUsername,
      this.portfolioUrl,
      this.bio,
      this.location,
      this.links,
      this.profileImage,
      this.instagramUsername,
      this.totalCollections,
      this.totalLikes,
      this.totalPhotos,
      this.acceptedTos,
      this.forHire,
      this.social});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    updatedAt = json['updated_at'];
    username = json['username'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    twitterUsername = json['twitter_username'];
    portfolioUrl = json['portfolio_url'];
    bio = json['bio'];
    location = json['location'];
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    profileImage = json['profile_image'] != null
        ? new ProfileImage.fromJson(json['profile_image'])
        : null;
    instagramUsername = json['instagram_username'];
    totalCollections = json['total_collections'];
    totalLikes = json['total_likes'];
    totalPhotos = json['total_photos'];
    acceptedTos = json['accepted_tos'];
    forHire = json['for_hire'];
    social =
        json['social'] != null ? new Social.fromJson(json['social']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['twitter_username'] = this.twitterUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['bio'] = this.bio;
    data['location'] = this.location;
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    if (this.profileImage != null) {
      data['profile_image'] = this.profileImage!.toJson();
    }
    data['instagram_username'] = this.instagramUsername;
    data['total_collections'] = this.totalCollections;
    data['total_likes'] = this.totalLikes;
    data['total_photos'] = this.totalPhotos;
    data['accepted_tos'] = this.acceptedTos;
    data['for_hire'] = this.forHire;
    if (this.social != null) {
      data['social'] = this.social!.toJson();
    }
    return data;
  }
}

class ResultLinks {
  String? self;
  String? html;
  String? photos;
  String? likes;
  String? portfolio;
  String? following;
  String? followers;

  ResultLinks(
      {this.self,
      this.html,
      this.photos,
      this.likes,
      this.portfolio,
      this.following,
      this.followers});

  ResultLinks.fromJson(Map<String, dynamic> json) {
    self = json['self'];
    html = json['html'];
    photos = json['photos'];
    likes = json['likes'];
    portfolio = json['portfolio'];
    following = json['following'];
    followers = json['followers'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['self'] = this.self;
    data['html'] = this.html;
    data['photos'] = this.photos;
    data['likes'] = this.likes;
    data['portfolio'] = this.portfolio;
    data['following'] = this.following;
    data['followers'] = this.followers;
    return data;
  }
}

class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({this.small, this.medium, this.large});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    return data;
  }
}

class Social {
  String? instagramUsername;
  String? portfolioUrl;
  String? twitterUsername;
  Null? paypalEmail;

  Social(
      {this.instagramUsername,
      this.portfolioUrl,
      this.twitterUsername,
      this.paypalEmail});

  Social.fromJson(Map<String, dynamic> json) {
    instagramUsername = json['instagram_username'];
    portfolioUrl = json['portfolio_url'];
    twitterUsername = json['twitter_username'];
    paypalEmail = json['paypal_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['instagram_username'] = this.instagramUsername;
    data['portfolio_url'] = this.portfolioUrl;
    data['twitter_username'] = this.twitterUsername;
    data['paypal_email'] = this.paypalEmail;
    return data;
  }
}

class Tags {
  String? type;
  String? title;
  Source? source;

  Tags({this.type, this.title, this.source});

  Tags.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    source =
        json['source'] != null ? new Source.fromJson(json['source']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    return data;
  }
}

class Source {
  Ancestry? ancestry;
  String? title;
  String? subtitle;
  String? description;
  String? metaTitle;
  String? metaDescription;
  CoverPhoto? coverPhoto;

  Source(
      {this.ancestry,
      this.title,
      this.subtitle,
      this.description,
      this.metaTitle,
      this.metaDescription,
      this.coverPhoto});

  Source.fromJson(Map<String, dynamic> json) {
    ancestry = json['ancestry'] != null
        ? new Ancestry.fromJson(json['ancestry'])
        : null;
    title = json['title'];
    subtitle = json['subtitle'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    coverPhoto = json['cover_photo'] != null
        ? new CoverPhoto.fromJson(json['cover_photo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ancestry != null) {
      data['ancestry'] = this.ancestry!.toJson();
    }
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    if (this.coverPhoto != null) {
      data['cover_photo'] = this.coverPhoto!.toJson();
    }
    return data;
  }
}

class Ancestry {
  Type? type;
  Type? category;
  Type? subcategory;

  Ancestry({this.type, this.category, this.subcategory});

  Ancestry.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    category =
        json['category'] != null ? new Type.fromJson(json['category']) : null;
    subcategory = json['subcategory'] != null
        ? new Type.fromJson(json['subcategory'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory!.toJson();
    }
    return data;
  }
}

class Type {
  String? slug;
  String? prettySlug;

  Type({this.slug, this.prettySlug});

  Type.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    prettySlug = json['pretty_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slug'] = this.slug;
    data['pretty_slug'] = this.prettySlug;
    return data;
  }
}

class CoverPhoto {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? promotedAt;
  int? width;
  int? height;
  String? color;
  String? blurHash;
  String? description;
  String? altDescription;
  Urls? urls;
  Links? links;
  List<Null>? categories;
  int? likes;
  bool? likedByUser;
  List<Null>? currentUserCollections;
  Null? sponsorship;
  TopicSubmissions? topicSubmissions;
  User? user;

  CoverPhoto(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.promotedAt,
      this.width,
      this.height,
      this.color,
      this.blurHash,
      this.description,
      this.altDescription,
      this.urls,
      this.links,
      this.categories,
      this.likes,
      this.likedByUser,
      this.currentUserCollections,
      this.sponsorship,
      this.topicSubmissions,
      this.user});

  CoverPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    promotedAt = json['promoted_at'];
    width = json['width'];
    height = json['height'];
    color = json['color'];
    blurHash = json['blur_hash'];
    description = json['description'];
    altDescription = json['alt_description'];
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    links = json['links'] != null ? new Links.fromJson(json['links']) : null;
    if (json['categories'] != null) {
      categories = <Null>[];
      // json['categories'].forEach((v) {
      //   categories!.add(new Null.fromJson(v));
      // });
    }
    likes = json['likes'];
    likedByUser = json['liked_by_user'];
    if (json['current_user_collections'] != null) {
      currentUserCollections = <Null>[];
      // json['current_user_collections'].forEach((v) {
      //   currentUserCollections!.add(new Null.fromJson(v));
      // });
    }
    sponsorship = json['sponsorship'];
    topicSubmissions = json['topic_submissions'] != null
        ? new TopicSubmissions.fromJson(json['topic_submissions'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['promoted_at'] = this.promotedAt;
    data['width'] = this.width;
    data['height'] = this.height;
    data['color'] = this.color;
    data['blur_hash'] = this.blurHash;
    data['description'] = this.description;
    data['alt_description'] = this.altDescription;
    if (this.urls != null) {
      data['urls'] = this.urls!.toJson();
    }
    if (this.links != null) {
      data['links'] = this.links!.toJson();
    }
    // if (this.categories != null) {
    //   data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    // }
    data['likes'] = this.likes;
    data['liked_by_user'] = this.likedByUser;
    // if (this.currentUserCollections != null) {
    //   data['current_user_collections'] =
    //       this.currentUserCollections!.map((v) => v.toJson()).toList();
    // }
    data['sponsorship'] = this.sponsorship;
    if (this.topicSubmissions != null) {
      data['topic_submissions'] = this.topicSubmissions!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class TopicSub {
  Wallpapers? nature;

  TopicSub({this.nature});

  TopicSub.fromJson(Map<String, dynamic> json) {
    nature =
        json['nature'] != null ? new Wallpapers.fromJson(json['nature']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.nature != null) {
      data['nature'] = this.nature!.toJson();
    }
    return data;
  }
}
