//
//  PostsController.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "PostsController.h"
#import "Post.h"

@implementation PostsController

- (NSArray<Post *> *)allPosts {
    UIImage *profileImage = [UIImage imageNamed:@"profile"];
    UIImage *postImage = [UIImage imageNamed:@"carbon"];

    NSDictionary <NSString*, NSNumber*> *reactions = @{@"like2": @100, @"love": @200, @"laughter": @30};

    Post *post1 = [[Post alloc] initWithProfilePhoto:profileImage username:@"sdasdas" whenPosted:@"sadsad" views:100 postDescription:@"dsasd" postImage:postImage whoLiked:@"Jayesh K. and 10 more" commentsCount:30 reactions:reactions sharesCount: 10];
    return @[post1, post1, post1, post1];
}

@end
