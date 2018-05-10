# LVTableViewDemo

## TableView 减负
</br>
写在前面：该文档旨在提供一种减负tableView代理中代码的思路，具体见demo。

思路就是，一个cell对应一个Model，通过组装Model将每个cell的高度预计算好存储，免去每次都计算的麻烦，通过cellIdentifier关联到对应的cell。并且通过协议把cellForRow和didClickForRow方法中cell的处理分发到对应的cell中去操作，从而实现VC减负的目的。

#### 1.组装dateSource
dateSource是一个二维数组，第一维代表section，第二维代表cell。每个cell对应的是一个实现了PlaceCommonCellModelProtocol协议的Model。

协议内容如下：

```
@protocol PlaceCommonCellModelProtocol <NSObject>
/** cell的高度*/
@property (nonatomic, assign) float cellHeight;
/** cell标识*/
@property (nonatomic, copy) NSString *cellIdentifier;

@end
```
#### 2.cell处理
这里cell做点处理，cell实现PlaceCommonCellProtocol协议，用处是将cellForRow和didClickForRow中各个cell操作分发到对应的cell中执行，减少VC中代码。

协议内容如下：

```
@class TicketProduct;
@protocol PlaceCommonCellProtocol <NSObject>
@optional
/** cell的代理*/
@property (nonatomic, weak) id<PlaceCommonCallBackDelegate> delegate;
/** 分发cellForRow和didClickForRow方法*/
- (void)updateCellUIWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath;
- (void)didSelectRowWithDataSource:(NSArray *)dataSource withIndexPath:(NSIndexPath *)indexPath;
@end
```

这里PlaceCommonCellProtocol是一个common协议，在具体实现时候可以自定义个新协议继承自common协议，好处是各页面属性和方法回调可以区分开。（这里标示optional好处是cell实现协议时不强制实现该属性，视需要实现）

举个栗子：

```
#import "PlaceCommonCellProtocol.h"
@class TicketProduct;
@protocol PlaceDetailCellProtocol <PlaceCommonCellProtocol>
@optional
/** 产品对象*/
@property (nonatomic, strong) TicketProduct *ticketProduct;
@end
```

#### 3.tableView的delegate和datesource方法

numberOfSectionsInTableView 返回值就是dateSource的count。

numberOfRowsInSection 返回值就是dateSource每个section的count。

heightForRowAtIndexPath 返回值就可以直接使用dateSource中Model算好的高度，不用每次都计算。

cellForRowAtIndexPath和didSelectRowAtIndexPath 则通过PlaceCommonCellProtocol协议分发到对应的cell中。

代码如下：

```
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.interactor.dateSource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    NSArray *item = self.interactor.dateSource[section];
    return (item.count > 0) ? ((section == 0) ? 0 : NEWSECTIONHEADERHEIGHT) : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *item = self.interactor.dateSource[section];
    return item.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<PlaceCommonCellModelProtocol> item = self.interactor.dateSource[indexPath.section][indexPath.row];
    return item.cellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id<PlaceCommonCellModelProtocol> object = self.interactor.dateSource[indexPath.section][indexPath.row];
    UITableViewCell<PlaceCommonCellProtocol> *cell = [tableView dequeueReusableCellWithIdentifier:object.cellIdentifier];
    if ([cell respondsToSelector:@selector(ticketProduct)]) {
        cell.ticketProduct = self.interactor.ticketProduct;
    }
    if ([cell respondsToSelector:@selector(delegate)] && !cell.delegate) {
        cell.delegate = self;
    }
    if ([cell respondsToSelector:@selector(updateCellUIWithDataSource:withIndexPath:)]) {
        [cell updateCellUIWithDataSource:self.interactor.dateSource withIndexPath:indexPath];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell<PlaceCommonCellProtocol> *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell respondsToSelector:@selector(didSelectRowWithDataSource:withIndexPath:)]) {
        [cell didSelectRowWithDataSource:self.interactor.dateSource withIndexPath:indexPath];
    }
}
```
