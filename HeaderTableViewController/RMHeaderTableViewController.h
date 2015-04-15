//
//  Created by Daniel Langh on 14/04/15.
//  Copyright (c) 2015 rumori. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RMHeaderTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UIViewController *topViewController;
@property (nonatomic) UITableView *tableView;
@property (nonatomic) BOOL clearsSelectionOnViewWillAppear;

@property (nonatomic) CGFloat headerHeight;

- (void)setupInitialState NS_REQUIRES_SUPER;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

- (instancetype)initWithStyle:(UITableViewStyle)style;

@end

