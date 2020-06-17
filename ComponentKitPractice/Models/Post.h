//
//  Post.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject

@property (nonatomic, readonly, strong) UIImage *photo;
@property (nonatomic, readonly, copy) NSString *username;
@property (nonatomic, readonly, copy) NSString *whenPosted;
@property (nonatomic, readonly, assign) NSInteger views;
@property (nonatomic, readonly, copy) NSString *postDescription;
@property (nonatomic, readonly, strong) UIImage *postImage;
@property (nonatomic, readonly, copy) NSString *whoLiked;
@property (nonatomic, readonly, assign) NSInteger commentsCount;
@property (nonatomic, readonly, copy) NSDictionary <NSString*, NSNumber*> *reactions;
@property (nonatomic, readonly, assign) NSInteger sharesCount;

-(instancetype)initWithProfilePhoto:(UIImage*)photo username:(NSString*)username whenPosted:(NSString*)whenPosted views:(NSInteger)views postDescription:(NSString*)postDescription postImage:(UIImage*)postImage whoLiked:(NSString*)whoLiked commentsCount:(NSInteger)commentsCount reactions:(NSDictionary <NSString*, NSNumber*> *)reactions sharesCount:(NSInteger)sharesCount;

@end

NS_ASSUME_NONNULL_END
