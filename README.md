# DLActionSheetController

[![Join the chat at https://gitter.im/WildDylan/DLActionSheetController](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/WildDylan/DLActionSheetController?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

![](https://travis-ci.org/WildDylan/DLActionSheetController.svg)

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/WildDylan/DLActionSheetController?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

DLActionSheetController is an action sheet controller easier for use.

[Aboud DLActionSheetController](http://www.jianshu.com/p/c182a73983b1)

![](http://upload-images.jianshu.io/upload_images/144590-c025de7c1e55179b.png?imageView2/2/w/1240/q/100)

使用须知:

1. 必须设置一下当前的模态样式

```objective-c
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

```objective-c
- (void)DLAction:(DLActionSheetController *)controller click:(NSInteger)index {

NSLog(@"%ld", index);
}

```
