//
//  AJBUserProtectViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/2.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBUserProtectViewController.h"
#import "AJBSegmentBarView.h"
#import "AJBProtectCollectionView.h"
#import "AJBProtectScrollView.h"
#import "AJBUploadProtectOrderViewController.h"

#define COLLECTIONVIEW_HEIGHT 100
#define SELECT_TABBAR_HEIGHT 40

@interface AJBUserProtectViewController ()<AJBSegmentBarViewDelegate,AJBProtectScrollViewDelegate>

@property (nonatomic, strong) AJBProtectCollectionView *collectionView;
@property (nonatomic, strong) AJBProtectScrollView *scrollView;
@property (nonatomic, strong) AJBSegmentBarView *protectBarView;

@end

@implementation AJBUserProtectViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    __weak typeof(self) __weakSelf = self;
    self.view.backgroundColor = COLOR_UI_dddddd;
    
    [self setTitleText:@"个人保障"];
    [self setRightBarButtonItem1WithImage:@"homeA"];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.right.equalTo(__weakSelf.view.mas_right);
        make.height.mas_equalTo(COLLECTIONVIEW_HEIGHT);
    }];
    
    [self.view addSubview:self.protectBarView];
    [self.protectBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.collectionView.mas_bottom).offset(MARGIN_15);
        make.left.mas_equalTo(0);
        make.right.equalTo(__weakSelf.view.mas_right);
        make.height.mas_equalTo(SELECT_TABBAR_HEIGHT);
    }];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(__weakSelf.protectBarView.mas_bottom).offset(MARGIN_15);
        make.left.mas_equalTo(0);
        make.width.equalTo(__weakSelf.view.mas_width);
        make.height.mas_equalTo(SCREEN_HEIGHT - COLLECTIONVIEW_HEIGHT- NAVITETION_HEIGHT - SELECT_TABBAR_HEIGHT - MARGIN_30);
    }];
}

#pragma getters and setters
- (AJBProtectCollectionView *) collectionView
{
    if (!_collectionView)
    {
        self.collectionView = [[AJBProtectCollectionView alloc] init];
    }
    return _collectionView;
}

- (AJBSegmentBarView *)protectBarView
{
    if (!_protectBarView) {
        self.protectBarView = [[AJBSegmentBarView alloc] initWithCount:4 hiddenLine:YES];
        _protectBarView.delegate = self;
        _protectBarView.backgroundColor = COLOR_UI_RANDOM;
        [_protectBarView refresh:@[@"保障中(3)",@"待生效(0)",@"已失效(3)",@"全部(6)"]];
    }
    return _protectBarView;
}

- (AJBProtectScrollView *) scrollView
{
    if (!_scrollView) {
        self.scrollView = [[AJBProtectScrollView alloc] init];
        _scrollView.delegate = self;
    }
    return _scrollView;
}

#pragma mark - delegate
- (void)switchButtonWithIndex:(NSInteger)index
{
    [_scrollView scrollToInex:index];
}

- (void)scrollDelegateToIndex:(NSInteger)index
{
    [_protectBarView setSelectIndex:index];
}

#pragma mark - item action
- (void)onRightItemAction:(UIButton *)sender
{
    AJBUploadProtectOrderViewController *vc = [[AJBUploadProtectOrderViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
