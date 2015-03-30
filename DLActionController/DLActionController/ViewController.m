//
//  ViewController.m
//  DLActionController
//
//  Created by XueYulun on 15/3/30.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "ViewController.h"
#import "DLActionSheetController.h"

@interface ViewController () <DLActionDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)DLAction:(id)sender {
    
    DLActionSheetController * actionVC = [[DLActionSheetController alloc] initWithName:@[@"投诉", @"撤销问题", @"取消问题"] enable:@[@(YES), @(NO), @(YES)] color:@[[UIColor redColor], [UIColor lightGrayColor], [UIColor blackColor]]];
    
    self.definesPresentationContext = YES;
    actionVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    actionVC.view.backgroundColor = [UIColor clearColor];
    
    actionVC.delegate = self;
    [self presentViewController:actionVC animated:YES completion:^{
        
    }];
}

- (void)DLAction:(DLActionSheetController *)controller click:(NSInteger)index {
    
    NSLog(@"%ld", index);
}

@end
