//
//  AJBToolViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/9.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBToolViewController.h"
#import "AJBToolCell.h"

@interface AJBToolViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation AJBToolViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setTitleText:@"常用工具"];
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(NAVITETION_HEIGHT);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(SCREEN_HEIGHT - NAVITETION_HEIGHT);
    }];
}

#pragma mark - getters and setters 
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/2,(SCREEN_HEIGHT - NAVITETION_HEIGHT)/3);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[AJBToolCell class] forCellWithReuseIdentifier:[AJBToolCell reuseIdentifier]];
        
    }
    return _collectionView;
    
}


#pragma mark - collection delegate
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AJBToolCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[AJBToolCell reuseIdentifier] forIndexPath:indexPath];
    [cell refreshWithImage:@"homeA" title:@"社保计算器"];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
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
