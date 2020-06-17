//
//  PostsController.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Post;

NS_ASSUME_NONNULL_BEGIN

@interface PostsController : NSObject

-(NSArray<Post *> *)allPosts;

@end

NS_ASSUME_NONNULL_END
