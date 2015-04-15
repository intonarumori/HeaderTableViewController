//
//  ImageScrollView.m
//  TopPictureTest
//
//  Created by Daniel Langh on 14/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import "ImageScrollView.h"


@interface ImageScrollView ()

@property (nonatomic) NSArray *imageViews;

@end

#pragma mark -

@implementation ImageScrollView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.pagingEnabled = YES;
}

#pragma mark -

- (void)setImages:(NSArray *)images
{
    _images = images;
    
    [self updateImageViews];
}

- (void)updateImageViews
{
    [self.imageViews makeObjectsPerformSelector:@selector(removeFromSuperview)];

    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    NSMutableArray *imageViews = [NSMutableArray array];
    int i = 0;
    for(UIImage *image in _images)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        imageView.image = image;
        imageView.tag = i;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)]];
        [imageViews addObject:imageView];
        
        [self addSubview:imageView];
        
        i++;
    }
    self.imageViews = imageViews;
    self.contentSize = CGSizeMake(_images.count * width, height);
}

#pragma mark -

- (void)tap:(UIGestureRecognizer *)tap
{
    if(tap.state == UIGestureRecognizerStateRecognized)
    {
        NSString *title = [NSString stringWithFormat:@"%ld image", (long)tap.view.tag];
        [[[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
    }
}

#pragma mark -

- (NSInteger)currentPageIndex
{
    return roundf(self.contentOffset.x / self.bounds.size.width);
}

- (void)setCurrentPageIndex:(NSInteger)currentPageIndex
{
    [self setCurrentPageIndex:currentPageIndex animated:NO];
}
- (void)setCurrentPageIndex:(NSInteger)currentPageIndex animated:(BOOL)animated
{
    CGFloat offsetX = currentPageIndex * self.bounds.size.width;
    [self setContentOffset:CGPointMake(offsetX, 0) animated:animated];
}

#pragma mark -


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat height = self.bounds.size.height;
    CGFloat width = self.bounds.size.width;
    
    int i=0;
    for(UIImageView *imageView in self.imageViews)
    {
        imageView.frame = CGRectMake(i*width, 0, width, height);
        i++;
    }
    
    self.contentSize = CGSizeMake(width * self.imageViews.count, height);
}

@end
