//
//  MainPostComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

@class PostContext;
@class Post;
NS_ASSUME_NONNULL_BEGIN

@interface MainPostComponent : CKCompositeComponent

+(instancetype)newWithPost:(Post *)post andContext:(PostContext *)context;

@end

NS_ASSUME_NONNULL_END
