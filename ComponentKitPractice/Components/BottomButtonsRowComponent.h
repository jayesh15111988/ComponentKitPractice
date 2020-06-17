//
//  BottomButtonsRowComponent.h
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import <ComponentKit/ComponentKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BottomButtonsRowComponent : CKCompositeComponent

+(instancetype)newWithImages:(NSArray<UIImage *> *)images highlightedImages:(NSArray<UIImage *> *)highlightedImages titles:(NSArray<NSString *> *)titles;

@end

NS_ASSUME_NONNULL_END
