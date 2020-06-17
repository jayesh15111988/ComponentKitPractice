//
//  DescriptionComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DescriptionComponent : CKCompositeComponent

+(instancetype)newWithDescription:(NSString *)description;

@end

NS_ASSUME_NONNULL_END
