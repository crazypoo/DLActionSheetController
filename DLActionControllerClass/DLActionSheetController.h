//
//  DLActionSheetController.h
//  DLActionController
//
//  Created by XueYulun on 15/3/30.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DLActionSheetController;
@protocol DLActionDelegate <NSObject>

- (void)DLAction: (DLActionSheetController *)controller click: (NSInteger)index;

@end

@interface DLActionSheetController : UIViewController

@property (nonatomic, assign) id<DLActionDelegate> delegate;

- (void)hideActionController;

- (instancetype)initWithName: (NSArray *)nameArray enable: (NSArray *)statuArray color: (NSArray *)colorArray;

@end
