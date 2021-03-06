/*
 *  Copyright (c) 2014-present, Facebook, Inc.
 *  All rights reserved.
 *
 *  This source code is licensed under the BSD-style license found in the
 *  LICENSE file in the root directory of this source tree. An additional grant
 *  of patent rights can be found in the PATENTS file in the same directory.
 *
 */

#import <CoreGraphics/CoreGraphics.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(SizeRange)
@interface CKSizeRange_SwiftBridge : NSObject

- (instancetype)initWithMinSize:(CGSize)minSize maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
