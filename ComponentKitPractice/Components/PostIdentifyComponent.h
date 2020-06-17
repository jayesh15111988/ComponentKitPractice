//
//  PostIdentifyComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>
#import "Post.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostIdentifyComponent : CKCompositeComponent

+(instancetype)newWithPost:(Post *)post;

@end

NS_ASSUME_NONNULL_END
