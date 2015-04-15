//
//  ImageScrollView.h
//  TopPictureTest
//
//  Created by Daniel Langh on 14/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageScrollView : UIScrollView

@property (nonatomic) NSArray *images;
@property (nonatomic) NSInteger currentPageIndex;

- (void)setCurrentPageIndex:(NSInteger)currentPageIndex animated:(BOOL)animated;
- (void)setup NS_REQUIRES_SUPER;

@end
