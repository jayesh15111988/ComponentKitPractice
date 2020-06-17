//
//  ImageComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageComponent : CKCompositeComponent

+(instancetype)newWithImage:(UIImage*)image;

@end

NS_ASSUME_NONNULL_END
