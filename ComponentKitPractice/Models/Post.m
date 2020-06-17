//
//  Post.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "Post.h"

@implementation Post

- (instancetype)initWithProfilePhoto:(UIImage *)photo username:(NSString *)username whenPosted:(NSString *)whenPosted views:(NSInteger)views postDescription:(NSString *)postDescription postImage:(UIImage *)postImage whoLiked:(NSString *)whoLiked commentsCount:(NSInteger)commentsCount reactions:(NSDictionary<NSString *,NSNumber *> *)reactions sharesCount:(NSInteger)sharesCount {
    if (self = [super init]) {
        _photo = photo;
        _username = username;
        _whenPosted = whenPosted;
        _views = views;
        _postDescription = postDescription;
        _postImage = postImage;
        _whoLiked = whoLiked;
        _commentsCount = commentsCount;
        _reactions = reactions;
        _sharesCount = sharesCount;
    }
    return self;
}

@end
