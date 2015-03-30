# DLActionSheetController
DLActionSheetController is an action sheet controller easier for use.

使用须知:

1. 必须设置一下当前的模态样式

```
- (IBAction)DLAction:(id)sender {

DLActionSheetController * actionVC = [[DLActionSheetController alloc] initWithName:@[@"投诉", @"撤销问题", @"取消问题"] enable:@[@(YES), @(NO), @(YES)] color:@[[UIColor redColor], [UIColor lightGrayColor], [UIColor blackColor]]];

// Must
self.definesPresentationContext = YES;
actionVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;

// BGColor
actionVC.view.backgroundColor = [UIColor clearColor];

actionVC.delegate = self;
[self presentViewController:actionVC animated:YES completion:^{

}];
}

```

- Delegate method

```
- (void)DLAction:(DLActionSheetController *)controller click:(NSInteger)index {

NSLog(@"%ld", index);
}

```