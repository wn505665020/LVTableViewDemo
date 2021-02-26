//
//  LVBaseTableViewController.h
//  LVTableViewDemo
//
//  Created by WN on 2019/8/5.
//  Copyright © 2019 iflytek. All rights reserved.
//

//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//@class EGOMJTableView;
@interface LVBaseTableViewController : UIViewController  //继承 可替换为 baseVC
/** */
//@property (nonatomic, strong) EGOMJTableView *mainTableView;
@property (nonatomic, strong) UITableView *mainTableView; //封装的tableview，不需要就用普通的

/** tableView的数据源*/
@property (nonatomic, strong) NSMutableArray *dataSource;
- (void)registerCell;
@end

NS_ASSUME_NONNULL_END
