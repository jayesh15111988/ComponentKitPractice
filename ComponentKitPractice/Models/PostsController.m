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

    NSArray <NSString *> *allReactions = @[@"like_reaction", @"love_reaction", @"surprised_reaction", @"laughter_reaction"];

    NSArray<NSString *> *descriptions = @[
        @"This is my code for the first time. Really proud to have implemented this awesome function",
        @"Just bought this Sofa. Isn't this beautiful??????",
        @"Having dinner on this beautiful table. Amazing purchase",
        @"I love Android. I have an Android phone",
        @"Working from home is fun. Until I spill the coffee on my work table. Now I have to clean this up. Gonna take forever"];

    NSArray <NSString *> *usernames = @[@"Jay", @"Ishu", @"Jayesh", @"Clock", @"Chicken tikka masala"];

    NSArray <NSString *> *whenPosted = @[@"7 hrs • Facebook for iOS", @"2 hrs • Facebook for Android", @"6 hrs • Palghar, India", @"Sponsored", @"17 hrs • Chicago, USA"];

    NSArray<NSString *> *imagenames = @[@"carbon", @"sofa", @"diningtable", @"android", @"coffee"];
    NSMutableArray<UIImage *> *allImages = [NSMutableArray new];

    for (NSString *imageName in imagenames) {
        [allImages addObject:[UIImage imageNamed:imageName]];
    }

    NSMutableArray<Post *> *allPosts = [NSMutableArray new];

    for (NSInteger i = 0; i < 5; i++) {

        NSMutableDictionary<NSString *, NSNumber *> *reactions = [NSMutableDictionary new];

        NSInteger randomLimit = arc4random_uniform(2) + 3;
        for (NSInteger i = 0; i < randomLimit; i++) {
            NSUInteger reactionIndex = arc4random_uniform(4);
            NSUInteger randomNumber = arc4random_uniform(10);

            [reactions setObject:@(randomNumber)
                          forKey:allReactions[reactionIndex]];
        }

        Post *post = [[Post alloc]
                       initWithProfilePhoto:profileImage
                       username:usernames[i]
                       whenPosted:whenPosted[i]
                       views:100
                       postDescription:descriptions[i]
                       postImage:allImages[i]
                       whoLiked:[NSString stringWithFormat:@"Random and %u more", arc4random_uniform(100)]
                       commentsCount:arc4random_uniform(40)
                       reactions:reactions
                       sharesCount: arc4random_uniform(50)];
        [allPosts addObject:post];
    }
    return allPosts;
}

@end
