//
//  ViewController.m
//  ComponentKitPractice
//
//  Created by Jayesh Kawli on 6/14/20.
//  Copyright © 2020 Jayesh Kawli. All rights reserved.
//

#import "ViewController.h"
#import "Post.h"
#import "PostContext.h"
#import "PostsController.h"
#import "MainPostComponent.h"
#import <ComponentKit/ComponentKit.h>

@interface ViewController ()<CKComponentProvider, UICollectionViewDelegateFlowLayout>

@end

@implementation ViewController {
    CKCollectionViewDataSource *_dataSource;
    CKComponentFlexibleSizeRangeProvider *_sizeRangeProvider;
    NSArray<Post *> *_allPosts;
}

- (instancetype)initWithCollectionViewLayout:(UICollectionViewLayout *)layout {
    if (self = [super initWithCollectionViewLayout:layout]) {
        _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
        self.title = @"My ComponentKit Practice";
        PostsController *postsController = [[PostsController alloc] init];
        _allPosts = [postsController allPosts];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.collectionView.backgroundColor = [UIColor colorWithRed:0.96 green:0.964 blue:0.98 alpha:1.0];
    self.collectionView.delegate = self;

    const CKSizeRange sizeRange = [_sizeRangeProvider sizeRangeForBoundingSize:self.collectionView.bounds.size];

    PostContext *context = [[PostContext alloc] init];

    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration<Post *, PostContext *> alloc] initWithComponentProviderFunc:ComponentProvider context:context sizeRange:sizeRange];

    _dataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:self.collectionView supplementaryViewDataSource:nil configuration:configuration];

    CKDataSourceChangeset *initialChangeSet = [[[CKDataSourceChangesetBuilder dataSourceChangeset] withInsertedSections:[NSIndexSet indexSetWithIndex:0]] build];
    [_dataSource applyChangeset:initialChangeSet mode:CKUpdateModeAsynchronous userInfo:nil];

    // Now apply the new changeset
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    __weak typeof(self) weakSelf = self;
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf->_dataSource applyChangeset:[self updatedChangeSet] mode:CKUpdateModeAsynchronous userInfo:nil];
    });
}

-(CKDataSourceChangeset *)updatedChangeSet {
    NSMutableDictionary<NSIndexPath *, Post *> *items = [NSMutableDictionary new];

    for (NSInteger i = 0; i < _allPosts.count; i ++) {
        [items setObject:_allPosts[i] forKey:[NSIndexPath indexPathForRow:i inSection:0]];
    }
    return [[[CKDataSourceChangesetBuilder dataSourceChangeset] withInsertedItems:items] build];
}

static CKComponent *ComponentProvider(Post *post, PostContext *postContext) {
    return [MainPostComponent newWithPost:post andContext:postContext];
}

#pragma mark: UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_dataSource announceWillDisplayCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    return [_dataSource announceDidEndDisplayingCell:cell];
}

@end
