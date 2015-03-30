//
//  DLActionSheetController.m
//  DLActionController
//
//  Created by XueYulun on 15/3/30.
//  Copyright (c) 2015年 X. All rights reserved.
//

#import "DLActionSheetController.h"

static NSString * DLIDENTIFIER = @"DLActionViewIdentifier";

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface DLActionSheetController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * nameArray;
@property (nonatomic, strong) NSMutableArray * statuArray;
@property (nonatomic, strong) NSMutableArray * colorArray;

@property (nonatomic, strong) UITableView    * tableView;

@property (nonatomic, strong) UIView * DropView;

@end

@implementation DLActionSheetController

- (instancetype)initWithName: (NSArray *)nameArray enable: (NSArray *)statuArray color: (NSArray *)colorArray {
    
    NSAssert(nameArray.count == statuArray.count || nameArray.count == colorArray.count, @"item count in name array should equal to statu array and color array");
    self = [super init];
    if (self) {
        
        _nameArray  = [NSMutableArray arrayWithArray:nameArray];
        _statuArray = [NSMutableArray arrayWithArray:statuArray];
        _colorArray = [NSMutableArray arrayWithArray:colorArray];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /* Basic config */
    
    // Load View
    [self LayoutMyView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self hideActionController];
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    [UIView animateWithDuration:.1 animations:^{
        
        _DropView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - (_nameArray.count * 48) - 4);
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    [UIView animateWithDuration:.1 animations:^{
        
        _DropView.frame = CGRectZero;
    }];
}

/* Table View delegate methods */
#pragma mark -
#pragma mark tableView delegate methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _nameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:DLIDENTIFIER];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:DLIDENTIFIER];
    }
    
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    cell.backgroundColor = [UIColor whiteColor];
    cell.textLabel.text = _nameArray[indexPath.row];
    
    // Content
    UIColor * currentColor = _colorArray[indexPath.row];
    BOOL canClick = [_statuArray[indexPath.row] intValue];
    
    cell.userInteractionEnabled = canClick;
    cell.textLabel.textColor = currentColor;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 48;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self hideActionController];
    if ([self.delegate respondsToSelector:@selector(DLAction:click:)]) {
        
        [self.delegate DLAction:self click:indexPath.row];
    }
}

- (void)hideActionController {
    
    self.view.backgroundColor = [UIColor clearColor];
    
    __weak typeof(self)wself = self;
    [UIView animateWithDuration:.1 animations:^{
        
        // your animation
    } completion:^(BOOL finished) {
        
        [wself dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (void)LayoutMyView {
    
    // Layout My View
    [self.view addSubview:({
        
        // 4px is the title color area height
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - (_nameArray.count * 48) - 2, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        
        // Separator inset http://www.jianshu.com/p/ea19be183d8a
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
            
        }
        
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.scrollEnabled = NO;
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.separatorColor = RGBACOLOR(218, 218, 218, 1.0);
        _tableView;
    })];
    
    // Load color area
    [self.view addSubview:({
        
        UIView * headerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(_tableView.frame) - 2, self.view.frame.size.width, 2)];
        headerView.backgroundColor = RGBACOLOR(27, 122, 199, 1.0);
        headerView;
    })];
    
    [self.view addSubview:({
        
        _DropView = [[UIView alloc] initWithFrame:CGRectZero];
        _DropView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.7];
        _DropView;
    })];
}

@end
