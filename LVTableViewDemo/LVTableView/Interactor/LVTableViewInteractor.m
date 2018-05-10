//
//  LVTableViewInteractor.m
//  LVTableViewDemo
//
//  Created by wangnan on 2018/3/29.
//  Copyright © 2018年 Lvmm. All rights reserved.
//

#import "LVTableViewInteractor.h"
#import "LVTableViewRequester.h"
#import "LVCellModel.h"
#import "LVConfig.h"

@interface LVTableViewInteractor ()
@property (nonatomic, weak) id<LVTableViewPresenterProtocol> presenter;
@property (nonatomic, strong) LVTableViewRequester *requester;
@end

@implementation LVTableViewInteractor
/** baseParams 页面传递参数*/
+ (instancetype)interactorWithBaseParams:(NSDictionary *)baseParams presenter:(id<LVTableViewPresenterProtocol>)presenter {
    LVTableViewInteractor *interactor = [[self alloc] init];
    interactor.presenter = presenter;
    [interactor setupParams];
    return interactor;
}

- (void)setupParams {
    //do alloc method
    self.requester = [LVTableViewRequester requesterWithinteractor:self];
    self.dateSource = [[NSMutableArray alloc] init];
}

- (void)viewDidLoadMethod {
    [self.requester viewDidLoadMethod];
    [self performSelector:@selector(loadDateSource) withObject:nil afterDelay:0.5];
}

- (void)loadDateSource {
    [self generateSectionFirst];
    [self generateSectionSecond];
    [self.presenter refreshTableView];
}

- (void)generateSectionFirst {
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:50
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"一一一"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:60
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"二二二"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:70
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"三三三"];
        [sectionArray addObject:cellModel];
    }
    [self.dateSource addObject:sectionArray];
}

- (void)generateSectionSecond {
    NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:50
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"四四四"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:60
                                                   cellIdentifier:kCellIdentifierLVTableViewCell
                                                       dateSource:@"五五五"];
        [sectionArray addObject:cellModel];
    }
    {
        LVCellModel *cellModel = [LVCellModel generateCommonModel:70
                                                   cellIdentifier:kCellIdentifierLVTypeSecondCell
                                                       dateSource:@"六六六"];
        [sectionArray addObject:cellModel];
    }
    [self.dateSource addObject:sectionArray];
}

#pragma mark - protocol part

- (void)dealRequestFailedMethod:(LVMMRequestSetup *)request {
    
}

- (void)dealRequestMsgErrorMethod:(LVMMRequestSetup *)request {
    
}

- (void)dealRequestSuccessMethod:(LVMMRequestSetup *)request {
    
}

@end
