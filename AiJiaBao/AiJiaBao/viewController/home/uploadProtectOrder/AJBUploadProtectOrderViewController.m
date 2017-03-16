//
//  AJBUploadProtectOrderViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/5.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBUploadProtectOrderViewController.h"
#import "AJBUploadProtectOrderView.h"
#import "AJBSegmentBarView.h"
#import "TZImagePickerController.h"

@interface AJBUploadProtectOrderViewController ()<AJBSegmentBarViewDelegate,UIScrollViewDelegate,TZImagePickerControllerDelegate>

@property (nonatomic, strong) AJBSegmentBarView *segmentBarView;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) AJBUploadProtectOrderView *orderView1;
@property (nonatomic, strong) AJBUploadProtectOrderView *orderView2;

@property (nonatomic, strong) UIView *margin;
@property (nonatomic, strong) UIView *line;

@end

@implementation AJBUploadProtectOrderViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setTitleText:@"保单上传"];
    [self setRightBarButtonItem1WithImage:@"homeA"];
    [self setRightBarButtonItem2WithImage:@"homeA"];
    
    __weak typeof(self) __weakSelf = self;

    [self.view addSubview:self.segmentBarView];
    [self.segmentBarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(SCREEN_WIDTH);
    }];
    
    [self.segmentBarView addSubview:self.margin];
    [self.margin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(__weakSelf.segmentBarView.mas_centerX);
        make.top.mas_equalTo(MARGIN_5);
        make.width.mas_equalTo(1);
        make.bottom.equalTo(__weakSelf.segmentBarView.mas_bottom).offset(-MARGIN_5);
    }];
    
    
    [self.view addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.equalTo(__weakSelf.segmentBarView.mas_bottom);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT - 40);
    }];
    
    [self.scrollView addSubview:self.orderView1];
    [self.orderView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.equalTo(__weakSelf.scrollView.mas_height);
    }];
    
    [self.scrollView addSubview:self.orderView2];
    [self.orderView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(SCREEN_WIDTH);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.equalTo(__weakSelf.scrollView.mas_height);
    }];
}

#pragma mark - getters and setters
- (AJBSegmentBarView *)segmentBarView
{
    if (!_segmentBarView) {
        self.segmentBarView = [[AJBSegmentBarView alloc] initWithCount:2 hiddenLine:NO];
        _segmentBarView.delegate = self;
        [_segmentBarView refresh:@[@"解析中",@"已完成"]];
    }
    return _segmentBarView;
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        self.scrollView = [[UIScrollView alloc] init];
        _scrollView.contentSize = CGSizeMake(SCREEN_WIDTH*2,SCREEN_HEIGHT - NAVITETION_HEIGHT - 40);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

- (AJBUploadProtectOrderView *)orderView1
{
    if (!_orderView1) {
        self.orderView1 = [[AJBUploadProtectOrderView alloc] init];
    }
    return _orderView1;
}

- (AJBUploadProtectOrderView *)orderView2
{
    if (!_orderView2) {
        self.orderView2 = [[AJBUploadProtectOrderView alloc] init];
    }
    return _orderView2;
}

- (UIView *)margin
{
    if (!_margin) {
        self.margin = [[UIView alloc] init];
        _margin.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _margin;
}

- (UIView *)line
{
    if (!_line) {
        self.line = [[UIView alloc] init];
        _line.backgroundColor = COLOR_UI_f1f1f1;
    }
    return _line;
}


#pragma mark - action
- (void)onRightItemAction:(UIButton *)sender
{
    
}

- (void)onRight1ItemAction:(UIButton *)sender
{
    __weak typeof(self) __weakSelf = self;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:3 delegate:__weakSelf];
        imagePickerVc.allowPickingOriginalPhoto = NO;
        imagePickerVc.allowPickingVideo = NO;
        [__weakSelf presentViewController:imagePickerVc animated:YES completion:nil];
    }];
    
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:photo];
    [alert addAction:camera];
    [alert addAction:cannel];
    [self presentViewController:alert animated:YES completion:nil];

}

#pragma mark - scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x/SCREEN_WIDTH;
    [_segmentBarView setSelectIndex:index];
}

- (void)switchButtonWithIndex:(NSInteger)index
{
    __weak typeof(self) _weakSelf = self;
    [UIView animateWithDuration:0.3 animations:^{
        _weakSelf.scrollView.contentOffset = CGPointMake(SCREEN_WIDTH * index, 0);
    }];
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
