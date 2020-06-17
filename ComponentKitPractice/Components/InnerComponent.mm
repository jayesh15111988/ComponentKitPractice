//
//  InnerComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "InnerComponent.h"
#import "DescriptionComponent.h"
#import "Post.h"
#import "PostContext.h"
#import "BottomButtonsRowComponent.h"
#import "PostIdentifyComponent.h"
#import "ReactionCommentsComponent.h"
#import "ImageComponent.h"

@implementation InnerComponent

+(instancetype)newWithPost:(Post *)post andContext:(PostContext *)context {

    PostIdentifyComponent *postIdentityComponent = [PostIdentifyComponent newWithPost:post];

    DescriptionComponent *descriptionComponent = [DescriptionComponent newWithDescription:post.postDescription];

    ImageComponent *imageComponent = [ImageComponent newWithImage:post.postImage];

    NSArray<UIImage *> *images = @[[UIImage imageNamed:@"like"], [UIImage imageNamed:@"comment"], [UIImage imageNamed:@"share"]];

    NSArray<UIImage *> *highlightedImages = @[[UIImage imageNamed:@"like_sup"], [UIImage imageNamed:@"comment"], [UIImage imageNamed:@"share"]];

    NSArray<NSString *> * titles = @[@"Like", @"Comment", @"Share"];

    ReactionCommentsComponent *reactionCommentsComponent = [ReactionCommentsComponent newWith:post];

    BottomButtonsRowComponent *rowsButtonComponents =
    [BottomButtonsRowComponent
     newWithImages:images highlightedImages:highlightedImages titles:titles];

    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent
                                            newWithView:{} size:{} style:{
        .alignItems = CKFlexboxAlignItemsStretch,
        .direction = CKFlexboxDirectionColumn
    } children:{{postIdentityComponent, .sizeConstraints = {.height = 54}}, {descriptionComponent}, {imageComponent}, {reactionCommentsComponent}, {horizontalComponent()}, {rowsButtonComponents}}];

    return [super newWithComponent:flexBoxComponent];
}

static CKComponent *horizontalComponent() {
    CKComponent *lineComponent = [CKComponent newWithView:{
        [UIView class],
        {
            {@selector(setBackgroundColor:), [UIColor colorWithRed:0.96 green:0.964 blue:0.98 alpha:1.0]}
        }
    } size:{.height = 1}];

    return [CKInsetComponent newWithInsets:{.top = 0, .bottom = 5, .left = 10, .right = 10} component:lineComponent];
}

@end
