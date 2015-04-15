//
//  Created by Daniel Langh on 14/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import "RMHeaderTableViewController.h"

@interface RMHeaderTableViewController ()

@property (nonatomic) UITableViewStyle tableViewStyle;

@end

@implementation RMHeaderTableViewController

#pragma mark -

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if(self)
    {
        [self setupInitialState];
        self.tableViewStyle = style;
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupInitialState];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupInitialState];
    }
    return self;
}

- (void)setupInitialState
{
    _headerHeight = 200.0f;
    _clearsSelectionOnViewWillAppear = YES;
}

#pragma mark -

- (void)loadView
{
    CGRect rect = CGRectMake(0, 0, 320, 480);
    UIView *view = [[UIView alloc] initWithFrame:rect];
    view.backgroundColor = [UIColor redColor];
    self.view = view;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:rect style:self.tableViewStyle];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if(self.topViewController)
    {
        [self addTopViewController];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSArray *indexPaths = self.tableView.indexPathsForSelectedRows;
    if(indexPaths.count > 0) {
        for(NSIndexPath *indexPath in indexPaths) {
            [self.tableView deselectRowAtIndexPath:indexPath animated:animated];
        }
    }
}

#pragma mark -

- (void)setTopViewController:(UIViewController *)topViewController
{
    if(_topViewController)
    {
        [self removeTopViewController];
    }
    
    _topViewController = topViewController;
    
    if(self.isViewLoaded)
    {
        [self addTopViewController];
    }
}

- (void)removeTopViewController
{
    UIViewController *viewController = self.topViewController;
    UIView *view = viewController.view;
    
    [viewController removeFromParentViewController];
    [view removeFromSuperview];
    [viewController didMoveToParentViewController:nil];
}

- (void)addTopViewController
{
    if(self.topViewController)
    {
        UIViewController *viewController = self.topViewController;
        UIView *view = viewController.view;
        
        [self addChildViewController:viewController];
        view.frame = CGRectMake(0, -_headerHeight, self.tableView.bounds.size.width, _headerHeight);
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleBottomMargin;
        [self.tableView addSubview:view];
        [viewController didMoveToParentViewController:self];
        
        self.tableView.contentInset = UIEdgeInsetsMake(_headerHeight, 0, 0, 0);
    }
    else
    {
        self.tableView.contentInset = UIEdgeInsetsZero;
    }
}

#pragma mark -

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if(self.topViewController)
    {
        CGFloat offsetY = scrollView.contentOffset.y;
        CGFloat height = MAX(-offsetY - self.topLayoutGuide.length, _headerHeight);
        self.topViewController.view.frame = CGRectMake(0, -height, self.tableView.bounds.size.width, height);
    }
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSAssert(NO, @"RMHeaderTableViewController: you should override tableView:numberOfRowsInSection:");
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    NSAssert(NO, @"RMHeaderTableViewController: you should override numberOfSectionsInTableView:");
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSAssert(NO, @"RMHeaderTableViewController: tableView:cellForRowAtIndexPath:");
    return nil;
}

@end
