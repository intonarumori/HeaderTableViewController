//
//  ImagesViewController.m
//  TopPictureTest
//
//  Created by Daniel Langh on 15/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import "ImagesViewController.h"

#import "ImageScrollView.h"

@interface ImagesViewController () <UIScrollViewDelegate>

@property (nonatomic) ImageScrollView *imageScrollView;
@property (nonatomic) UIPageControl *pageControl;

@end

@implementation ImagesViewController

- (void)loadView
{
    CGRect frame = CGRectMake(0, 0, 320, 480);
    
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor whiteColor];
    self.view = view;
    
    ImageScrollView *imageScrollView = [[ImageScrollView alloc] initWithFrame:frame];
    imageScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageScrollView.delegate = self;
    self.imageScrollView = imageScrollView;
    
    [self.view addSubview:self.imageScrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, frame.size.height-30, frame.size.width, 30.0f)];
    self.pageControl.backgroundColor = [UIColor blackColor];
    [self.pageControl addTarget:self action:@selector(pageChanged:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    [self.view addSubview:self.pageControl];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *images = @[[UIImage imageNamed:@"car.jpg"],
                                    [UIImage imageNamed:@"car2.jpg"],
                                    [UIImage imageNamed:@"car.jpg"],
                                    [UIImage imageNamed:@"car2.jpg"],
                                    [UIImage imageNamed:@"car.jpg"],
                                    [UIImage imageNamed:@"car2.jpg"],
                                    [UIImage imageNamed:@"car.jpg"],
                                    [UIImage imageNamed:@"car2.jpg"],
                                    [UIImage imageNamed:@"car.jpg"],
                                    [UIImage imageNamed:@"car2.jpg"],
                                    [UIImage imageNamed:@"car.jpg"],];
    self.imageScrollView.images = images;
    self.pageControl.numberOfPages = images.count;
}

#pragma mark -

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self finishScrolling];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if(!decelerate)
    {
        [self finishScrolling];
    }
}

- (void)finishScrolling
{
    NSInteger pageIndex = [self.imageScrollView currentPageIndex];
    self.pageControl.currentPage = pageIndex;
}

#pragma mark -

- (void)pageChanged:(UIPageControl *)pageControl
{
    [self.imageScrollView setCurrentPageIndex:pageControl.currentPage animated:YES];
}

@end
