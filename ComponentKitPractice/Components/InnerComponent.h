//
//  InnerComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
@class Post;
@class PostContext;

NS_ASSUME_NONNULL_BEGIN

@interface InnerComponent : CKCompositeComponent

+(instancetype)newWithPost:(Post *)post andContext:(PostContext *)context;

@end

NS_ASSUME_NONNULL_END
