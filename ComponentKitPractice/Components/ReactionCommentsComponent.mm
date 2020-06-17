//
//  ReactionCommentsComponent.mm
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/16/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "Post.h"
#import "ReactionCommentsComponent.h"

@implementation ReactionCommentsComponent

+(instancetype)newWith:(Post *)post {
    CKLabelComponent *whoLikedLabelComponent = [CKLabelComponent
    newWithLabelAttributes:{
        .string = post.whoLiked,
        .font = [UIFont systemFontOfSize:12.0],
        .alignment = NSTextAlignmentLeft,
        .maximumNumberOfLines = 0
    }
    viewAttributes:{
        {@selector(setBackgroundColor:), [UIColor whiteColor]},
        {@selector(setUserInteractionEnabled:), @NO},
    }
    size:{ }];

    auto subComponents = std::vector<CKFlexboxComponentChild>{};

    NSMutableArray<CKImageComponent *> *imageComponents = [NSMutableArray new];

    [post.reactions enumerateKeysAndObjectsUsingBlock:^(NSString *reactionName, NSNumber *count, BOOL* stop) {
        UIImage *reactionImage = [UIImage imageNamed:reactionName];

        CKImageComponent *imageComponent = [CKImageComponent newWithImage:reactionImage attributes:{
            {@selector(setContentMode:), UIViewContentModeScaleAspectFit}
        } size:{15, 15}];

        [imageComponents addObject:imageComponent];
    }];

    for (CKImageComponent * imageComponent in imageComponents) {
        subComponents.push_back({imageComponent, .spacingBefore = -1.0});
    }

    subComponents.push_back({whoLikedLabelComponent, .spacingBefore = 5.0});

    CKFlexboxComponent *whoLikedFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow,
        .justifyContent = CKFlexboxJustifyContentSpaceEvenly,
        .alignItems = CKFlexboxAlignItemsCenter
    } children:subComponents];

    NSString *commentsDescription = [NSString stringWithFormat:@"%ld Comments", post.commentsCount];

    CKLabelComponent *commentsLabelComponent = [CKLabelComponent
    newWithLabelAttributes:{
        .string = commentsDescription,
        .font = [UIFont systemFontOfSize:12.0],
        .alignment = NSTextAlignmentRight,
        .maximumNumberOfLines = 0
    }
    viewAttributes:{
        {@selector(setBackgroundColor:), [UIColor whiteColor]},
        {@selector(setUserInteractionEnabled:), @NO},
    }
    size:{ }];

    NSString *sharesDescription = [NSString stringWithFormat:@"%ld Shares", post.sharesCount];

    CKLabelComponent *sharesLabelComponent = [CKLabelComponent
    newWithLabelAttributes:{
        .string = sharesDescription,
        .font = [UIFont systemFontOfSize:12.0],
        .alignment = NSTextAlignmentRight,
        .maximumNumberOfLines = 0
    }
    viewAttributes:{
        {@selector(setBackgroundColor:), [UIColor whiteColor]},
        {@selector(setUserInteractionEnabled:), @NO},
    }
    size:{ }];

    CKFlexboxComponent *shareCommentsFlexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter,
        .justifyContent = CKFlexboxJustifyContentEnd
    } children:{
        {commentsLabelComponent, .spacingAfter = 5.0},
        {sharesLabelComponent}
    }];

    CKFlexboxComponent *flexBoxComponent = [CKFlexboxComponent newWithView:{} size:{} style:{
        .direction = CKFlexboxDirectionRow,
        .alignItems = CKFlexboxAlignItemsCenter,
        .justifyContent = CKFlexboxJustifyContentSpaceBetween,
        .wrap = CKFlexboxWrapWrap
    } children:{
        {whoLikedFlexBoxComponent},
        {shareCommentsFlexBoxComponent}
    }];

    return [super newWithComponent:[CKInsetComponent newWithInsets:{.top = 10, .bottom = 10, .left = 10, .right = 10} component:flexBoxComponent]];
}

@end
