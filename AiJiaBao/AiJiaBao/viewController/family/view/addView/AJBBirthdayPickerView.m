//
//  AJBBirthdayPickerView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/6.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//


#import "AJBBirthdayPickerView.h"

@interface AJBBirthdayPickerView ()<UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIButton *rightItem;
    NSInteger SelectedYearRow;
    NSInteger SelectedMonthRow;
    NSInteger SelectedDayRow;
}

@property (nonatomic, strong) NSArray *month;
@property (nonatomic, strong) NSMutableArray *year,*days;
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) NSString *string;
@property (nonatomic,strong)UIView *headView;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) UIButton *cancleBtn;

@end

@implementation AJBBirthdayPickerView


- (instancetype)init
{
    if (self = [super init]) {
        self.alpha = 0;
        self.hidden = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy"];
        [formatter setDateFormat:@"MM"];
        [formatter setDateFormat:@"dd"];
        _year = [[NSMutableArray alloc]init];
        
        for (int i = 1897; i <= 2017 ; i++)
        {
            [_year addObject:[NSString stringWithFormat:@"%d年",i]];
        }
        _month = @[@"1月",@"2月",@"3月",@"4月",@"5月",@"6月",@"7月",@"8月",@"9月",@"10月",@"11月",@"12月"];
        
        _days = [[NSMutableArray alloc]init];
        
        for (int i = 1; i <= 31; i++)
        {
            [_days addObject:[NSString stringWithFormat:@"%d日",i]];
        }
        
        
        [self addSubview:self.headView];
        [self.headView addSubview:self.pickView];
        [self.headView addSubview:self.sureBtn];
        [self.headView addSubview:self.cancleBtn];
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(SCREEN_HEIGHT);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(180);
        }];
        //
        [self.pickView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.headView).with.insets(UIEdgeInsetsMake(30, 0, 0, 0));
        }];
        
        
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.headView).with.insets(UIEdgeInsetsMake(10, SCREEN_WIDTH - 60, 150, 20));
            
        }];
        [self.cancleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.headView).with.insets(UIEdgeInsetsMake(10, 20, 150,SCREEN_WIDTH - 60));
        }];
        
        
        NSString *currentyearString = [NSString stringWithFormat:@"%@年",@"1990"];
        NSString *currentmoString = [NSString stringWithFormat:@"%@月",@"6"];
        NSString *currentdayString = [NSString stringWithFormat:@"%@日",@"15"];
        
        _string = [NSString stringWithFormat:@"%@-%@-%@",currentyearString,currentmoString,currentdayString];
        
        [_pickView selectRow:[_year indexOfObject:currentyearString] inComponent:0 animated:YES];
        [_pickView selectRow:[_month indexOfObject:currentmoString] inComponent:1 animated:YES];
        [_pickView selectRow:[_days indexOfObject:currentdayString] inComponent:2 animated:YES];
        
        
    }
    return self;
}

- (UIPickerView *)pickView
{
    if (!_pickView) {
        _pickView = [[UIPickerView alloc] init];
        _pickView.delegate = self;
        _pickView.dataSource = self;
        _pickView.backgroundColor = [UIColor whiteColor];
    }
    return _pickView;
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [UIView new];
        _headView.backgroundColor = [UIColor whiteColor];
    }
    return _headView;
}


- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_sureBtn setTitle:@"确定" forState:UIControlStateNormal];
        _sureBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_sureBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(sureBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}
- (UIButton *)cancleBtn{
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancleBtn setTitle:@"取消" forState:UIControlStateNormal];
        _cancleBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_cancleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_cancleBtn addTarget:self action:@selector(cancleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancleBtn;
}


- (void) showPickerView {
    
    __weak typeof(self)__weakSelf = self;
    __weakSelf.alpha = 1;
    __weakSelf.hidden = NO;
    [UIView animateWithDuration:0.2 animations:^{
        __weakSelf.headView.top = SCREEN_HEIGHT - 180;
    } completion:^(BOOL finished) {
    }];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //year
    if (component == 0)
    {
        return [_year count];
    }
    else if (component == 1) //month
    {
        return [_month count];
    }
    else // day
    { // day
        if (SelectedMonthRow == 0 || SelectedMonthRow == 2 || SelectedMonthRow == 4 || SelectedMonthRow == 6 || SelectedMonthRow == 7 || SelectedMonthRow == 9 || SelectedMonthRow == 11)
        {
            return 31;
        }
        else if (SelectedMonthRow == 1)
        {
            int yearint = [[_year objectAtIndex:SelectedYearRow]intValue ];
            
            if(((yearint %4==0)&&(yearint %100!=0))||(yearint %400==0)){
                return 29;
            }
            else
            {
                return 28;
            }
        }
        else
        {
            return 30;
        }
    }
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return SCREEN_WIDTH/3;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView
            viewForRow:(NSInteger)row
          forComponent:(NSInteger)component
           reusingView:(UIView *)view {
    
    UILabel *pickerLabel = (UILabel *)view;
    
    if (pickerLabel == nil) {
        CGRect frame = CGRectMake(0, 0,80,80);
        pickerLabel = [[UILabel alloc] initWithFrame:frame];
        [pickerLabel setTextAlignment:NSTextAlignmentCenter];
        [pickerLabel setBackgroundColor:[UIColor clearColor]];
        [pickerLabel setFont:FONT_OF_SIZE_17];
    }
    
    if (component == 0)
    {
        pickerLabel.text =  [_year objectAtIndex:row]; // Year
    }
    else if (component == 1)
    {
        pickerLabel.text =  [_month objectAtIndex:row];  // Month
    }
    else if (component == 2)
    {
        pickerLabel.text =  [_days objectAtIndex:row]; // Date
    }
    return pickerLabel;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0)
    {
        SelectedYearRow = row;
        [pickerView reloadAllComponents];
    }
    else if (component == 1)
    {
        SelectedMonthRow = row;
        [pickerView reloadAllComponents];
    }
    else if (component == 2)
    {
        SelectedDayRow = row;
        [pickerView reloadAllComponents];
    }
    _string = [NSString stringWithFormat:@"%@-%@-%@",[_year objectAtIndex:[pickerView selectedRowInComponent:0]],[_month objectAtIndex:[pickerView selectedRowInComponent:1]],[_days objectAtIndex:[pickerView selectedRowInComponent:2]]];
}

- (void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self hiddenPickerView];
}

- (void) hiddenPickerView {
    __weak typeof(self) __weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        __weakSelf.alpha = 0;
        __weakSelf.headView.top = SCREEN_HEIGHT;
    } completion:^(BOOL finished) {
        __weakSelf.hidden = YES;
    }];
}


#pragma BtnClick
- (void)sureBtnClick:(UIButton *)button{
    [self hiddenPickerView];
    if (self.blcok) {
        self.blcok(_string);
    }
#warning 此处进行回调
}
- (void)cancleBtnClick:(UIButton *)button{
    [self hiddenPickerView];
}

@end
