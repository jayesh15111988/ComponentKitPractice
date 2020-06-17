//
//  ButtonWithTitleComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ButtonWithTitleComponent : CKCompositeComponent

+(instancetype)newWithImage:(UIImage*)image highlightedImage:(UIImage *)highlightedImage title:(NSString*)title isClickable:(BOOL)isClickable;

@end

NS_ASSUME_NONNULL_END
