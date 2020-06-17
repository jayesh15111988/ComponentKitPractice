//
//  ReactionCommentsComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/16/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
@class Post;
NS_ASSUME_NONNULL_BEGIN

@interface ReactionCommentsComponent : CKCompositeComponent

+(instancetype)newWith:(Post *)post;

@end

NS_ASSUME_NONNULL_END
