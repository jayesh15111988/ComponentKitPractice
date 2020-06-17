//
//  PostIdentifyComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "PostIdentifyComponent.h"
#import "Post.h"

@implementation PostIdentifyComponent

+(instancetype)newWithPost:(Post *)post {

    CKImageComponent *profileImageComponent =
    [CKImageComponent
     newWithImage:post.photo
     attributes:{
        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)}
        //{CKComponentViewAttribute::LayerAttribute(@selector(setCornerRadius:)), @27.0}
        }
     size:{
        // No op
    }];

    CKLabelComponent *usernameLabelComponent =
    [CKLabelComponent
     newWithLabelAttributes:{
        .string = post.username,
        .font = [UIFont systemFontOfSize:14.0],
        .color = [UIColor blackColor]
    }
     viewAttributes:{}
     size:{
        .height = CKRelativeDimension::Percent(0.5)
    }];
    
    CKLabelComponent *whenPostedLabelComponent =
    [CKLabelComponent
     newWithLabelAttributes:{
        .string = post.whenPosted,
        .font = [UIFont systemFontOfSize:12.0],
        .color = [UIColor lightGrayColor]
    }
     viewAttributes:{}
     size:{
        .height = CKRelativeDimension::Percent(1.0)
    }];

//    CKImageComponent *earthImageComponent = [CKImageComponent newWithImage:[UIImage imageNamed:@"earth"] attributes:{
//        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
//    } size:{.height = CKRelativeDimension::Percent(1.0)}];

    CKImageComponent *earthImageComponent = [CKImageComponent newWithImage:[UIImage imageNamed:@"earth"] attributes:{
        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
    } size:{12, 12}];

    CKFlexboxComponent *whenPostedWithGlobaFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{.height = CKRelativeDimension::Percent(0.5)} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter
    } children:{{whenPostedLabelComponent}, {earthImageComponent, .spacingBefore = 5.0, .alignSelf = CKFlexboxAlignSelfCenter, /*.flexBasis = CKRelativeDimension::Percent(0.5)*/}}];

    CKFlexboxComponent *labelNamesFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionColumn
    } children:{
        {usernameLabelComponent},
        {whenPostedWithGlobaFlexBoxComponent}
    }];

    UIImage *dotsImage = [UIImage imageNamed:@"dots"];
    CKImageComponent *imageComponent = [CKImageComponent newWithImage:dotsImage attributes:{
        {@selector(setContentMode:), @(UIViewContentModeScaleAspectFit)},
        {@selector(setBackgroundColor:), [UIColor clearColor]}
    } size:{.height = CKRelativeDimension::Percent(1.0)}];

    CKFlexboxComponent *profilePictureFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter
    } children: {
        {profileImageComponent, .spacingBefore = 5.0, .flexBasis = CKRelativeDimension::Percent(0.125), .sizeConstraints = {.height = CKRelativeDimension::Percent(1.0)}},
        {labelNamesFlexBoxComponent, .spacingBefore = 5.0, .position = {.left = 0}}
    }];

    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow
    } children:{
        {profilePictureFlexBoxComponent, .sizeConstraints = {.width = CKRelativeDimension::Percent(0.9)}},
        {imageComponent, .position = {.right = 0}, .sizeConstraints = {.width = CKRelativeDimension::Percent(0.1)}}
    }];

    return [super newWithComponent:flexBoxComponent];
}

@end
