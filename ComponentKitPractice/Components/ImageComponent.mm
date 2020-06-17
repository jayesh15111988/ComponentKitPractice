//
//  ImageComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "ImageComponent.h"

@implementation ImageComponent

+(instancetype)newWithImage:(UIImage*)image {
    CKImageComponent *imageComponent =
    [CKImageComponent
     newWithImage:image
     attributes:{
        {
            @selector(setContentMode:), @(UIViewContentModeScaleToFill)
        },
        {
            @selector(setBackgroundColor:), [UIColor whiteColor]
        }
    }
     size:{.height = 200}];

//    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
//        .alignItems = CKFlexboxAlignItemsStretch,
//        .direction = CKFlexboxDirectionColumn
//    } children:{{imageComponent}}];

    return [super newWithComponent:imageComponent];
}

@end
