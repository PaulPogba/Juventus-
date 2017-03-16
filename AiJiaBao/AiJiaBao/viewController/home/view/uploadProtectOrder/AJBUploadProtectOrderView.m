//
//  AJBUploadProtectOrderView.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/5.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBUploadProtectOrderView.h"
#import "AJBUploadProtectOrderCell.h"

@interface AJBUploadProtectOrderView ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation AJBUploadProtectOrderView

- (instancetype)init
{
    if (self = [super init]) {
        
        __weak typeof(self) __weakSelf = self;
        [self addSubview:self.collectionView];
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(0);
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
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/2, 245);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[AJBUploadProtectOrderCell class] forCellWithReuseIdentifier:[AJBUploadProtectOrderCell reuseIdentifier]];
    }
    return _collectionView;
}

#pragma mark - delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AJBUploadProtectOrderCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AJBUploadProtectOrderCell reuseIdentifier] forIndexPath:indexPath];
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

@end
