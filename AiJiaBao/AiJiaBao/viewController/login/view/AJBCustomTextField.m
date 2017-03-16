//
//  AJBCustomTextField.m
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/23.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCustomTextField.h"

@interface AJBCustomTextField ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *topLine;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *bottomLine;

@property (nonatomic, assign) CustomTextFieldType type;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *placeholder;

@end

@implementation AJBCustomTextField

- (id) initWithtextFieldPlaceholder :(NSString *) placeholder image:(NSString *)image notification:(void (^)(NSString *text)) notification type:(CustomTextFieldType) type
{
    if (self = [super init]) {

        __weak typeof(self) __weakSelf = self;
        
        self.notification = notification;
        self.type = type;
        self.placeholder = placeholder;
        self.image = image;
        
        [self addSubview:self.topLine];
        [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(0.5);
        }];
        
        [self addSubview:self.imageView];
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(MARGIN_20);
            make.top.equalTo(__weakSelf.mas_top).offset(MARGIN_10);
            make.size.mas_equalTo(__weakSelf.imageView.image.size);
        }];
        
        [self addSubview:self.textField];
        if (type == CustomTextFieldType_PHONE) {
            [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(__weakSelf.imageView.mas_centerY);
                make.left.equalTo(__weakSelf.imageView.mas_right).offset(MARGIN_20);
                make.right.mas_equalTo(__weakSelf.mas_right).offset(-MARGIN_40);
                make.height.mas_equalTo(MARGIN_30);
            }];
        } else if (type == CustomTextFieldType_CODE){
            [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(__weakSelf.imageView.mas_centerY);
                make.left.equalTo(__weakSelf.imageView.mas_right).offset(MARGIN_20);
                make.right.mas_equalTo(__weakSelf.mas_right).offset(-MARGIN_40-80);
                make.height.mas_equalTo(MARGIN_30);
            }];
        } else {
            [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(__weakSelf.imageView.mas_centerY);
                make.left.equalTo(__weakSelf.imageView.mas_right).offset(MARGIN_20);
                make.right.mas_equalTo(__weakSelf.mas_right).offset(-MARGIN_40-MARGIN_20);
                make.height.mas_equalTo(MARGIN_30);
            }];
        }
        
        [self addSubview:self.bottomLine];
        [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(__weakSelf.mas_bottom);
            make.left.mas_equalTo(0);
            make.width.mas_equalTo(SCREEN_WIDTH);
            make.height.mas_equalTo(0.5);
        }];
    }
    return self;
}

- (UITextField *)textField
{
    if (!_textField) {
        self.textField = [[UITextField alloc] init];
        _textField.font = FONT_OF_SIZE_14;
        _textField.textColor = COLOR_UI_333333;
        _textField.tintColor = COLOR_UI_54C1F5;
        _textField.delegate = self;
        if (_type == CustomTextFieldType_PHONE) {
            _textField.keyboardType = UIKeyboardTypeNumberPad;
        } else if (_type == CustomTextFieldType_SECRET) {
            _textField.secureTextEntry = YES;
        }
        _textField.placeholder = _placeholder;
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNotificationTextField) name:UITextFieldTextDidChangeNotification object:nil];
    }
    return _textField;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        _imageView.image = imageNamed(_image);

    }
    return _imageView;
}

- (UILabel *)topLine
{
    if (!_topLine) {
        self.topLine = [[UILabel alloc] init];
        _topLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _topLine;
}

- (UILabel *)bottomLine
{
    if (!_bottomLine) {
        self.bottomLine = [[UILabel alloc] init];
        _bottomLine.backgroundColor = COLOR_UI_dddddd;
    }
    return _bottomLine;
}


- (void) onNotificationTextField
{
    if (_notification) {
        _notification(_textField.text);
    }
}

#pragma mark - textFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (_type == 0) {
        NSUInteger proposedNewLength = textField.text.length - range.length + string.length;
        if (proposedNewLength>11)
        {
            return NO;//限制长度
        }
        return YES;
    } else
    {
        return YES;
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_textField resignFirstResponder];
}

@end
