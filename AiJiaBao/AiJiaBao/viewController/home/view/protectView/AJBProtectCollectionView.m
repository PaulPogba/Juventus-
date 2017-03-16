//
//  AJBProtectCollectionView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectCollectionView.h"
#import "AJBProtectCollectionViewCell.h"

@interface AJBProtectCollectionView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation AJBProtectCollectionView

- (instancetype)init
{
    if (self = [super init]) {
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.width.equalTo(__weakSelf.mas_width);
            make.height.equalTo(__weakSelf.mas_height);
        }];
    }
    return self;
}

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.itemSize = CGSizeMake(80, 100);
        layout.minimumLineSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[AJBProtectCollectionViewCell class] forCellWithReuseIdentifier:[AJBProtectCollectionViewCell reuseIdentifier]];
        
    }
    return _collectionView;
}

#pragma mark - delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AJBProtectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AJBProtectCollectionViewCell reuseIdentifier] forIndexPath:indexPath];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
