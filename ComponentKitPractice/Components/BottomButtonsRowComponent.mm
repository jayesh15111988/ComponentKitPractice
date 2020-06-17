//
//  BottomButtonsRowComponent.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/15/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "BottomButtonsRowComponent.h"
#import "ButtonWithTitleComponent.h"

@implementation BottomButtonsRowComponent

+(instancetype)newWithImages:(NSArray<UIImage *> *)images highlightedImages:(NSArray<UIImage *> *)highlightedImages titles:(NSArray<NSString *> *)titles {
    auto subComponents = std::vector<CKFlexboxComponentChild>{};

    for (NSInteger i = 0; i < titles.count; i++) {
        ButtonWithTitleComponent *buttonWithTitleComponent =
        [ButtonWithTitleComponent
         newWithImage:images[i]
         highlightedImage:highlightedImages[i]
         title:titles[i]
         isClickable:(i == 0)];

        subComponents.push_back({buttonWithTitleComponent, .alignSelf = CKFlexboxAlignSelfCenter});
    }

    CKFlexboxComponent *flexBoxComponent =
    [CKFlexboxComponent
     newWithView:{}
     size:{}
     style:
    {
        .direction = CKFlexboxDirectionRow,
        .justifyContent = CKFlexboxJustifyContentSpaceEvenly,
        .alignItems = CKFlexboxAlignItemsCenter
    }
     children:subComponents];

    CKInsetComponent *insetComponent =
    [CKInsetComponent
     newWithInsets:
    {
        .top = 5, .bottom = 5, .left = 10, .right = 10
    }
     component:flexBoxComponent];

    return [super newWithComponent:insetComponent];
}

@end
