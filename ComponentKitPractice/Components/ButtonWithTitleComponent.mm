//
//  ButtonWithTitleComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "ButtonWithTitleComponent.h"
#import "Constants.h"
#import <ComponentKit/CKComponentSubclass.h>

@implementation ButtonWithTitleComponent {
    BOOL _isClickable;
}

+(instancetype)newWithImage:(UIImage*)image highlightedImage:(UIImage *)highlightedImage title:(NSString*)title isClickable:(BOOL)isClickable {
//    CKImageComponent *imageComponent = [CKImageComponent newWithImage:image attributes:{
//        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFill)}
//    } size:{35, 35}];

    CKComponentScope scope(self);
    const BOOL isHighlighted = [scope.state() boolValue];

    UIImage *finalImage = isHighlighted ? highlightedImage : image;

    CKButtonComponent* buttonComponent = [CKButtonComponent newWithAction:@selector(buttonTapped) options: {
        .images = {finalImage}, .titleAlignment = NSTextAlignmentLeft, .size = {30, 30},
        .tapTargetExpansion = {.right = -5}
    }];

    UIColor *titleColor = isHighlighted ? Constants.blueColor : [UIColor blackColor];

//    CKLabelComponent *labelComponent = [CKLabelComponent
//    newWithLabelAttributes:{
//        .string = title,
//        .font = [UIFont systemFontOfSize:12.0],
//        .color = textColor
//    }
//    viewAttributes:{}
//    size:{ }];

    CKButtonComponent* titleTextComponent = [CKButtonComponent newWithAction:@selector(buttonTapped) options: {
        .titleAlignment = NSTextAlignmentLeft,
        .titleFont = [UIFont systemFontOfSize:12.0],
        .selected = isHighlighted,
        .titleColors = {titleColor},
        .titles = {title}
    }];

    CKComponent *spacing = [CKComponent newWithView:{
        [UIView class],
        {{@selector(setBackgroundColor:), [UIColor clearColor]}}
    } size:{.width = 5}];

    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .alignItems = CKFlexboxAlignItemsCenter,
        .direction = CKFlexboxDirectionRow
    } children:{{buttonComponent}, {spacing}, {titleTextComponent}}];

    ButtonWithTitleComponent *finalComponent = [super newWithComponent:flexBoxComponent];
    finalComponent->_isClickable = isClickable;

    return finalComponent;
}

-(void)buttonTapped {
    if (_isClickable) {
        [self updateState:^(NSNumber *oldLikeState) {
          return [oldLikeState boolValue] ? @NO : @YES;
        } mode:CKUpdateModeSynchronous];
    }
}

+ (id)initialState
{
  return @NO;
}

@end
