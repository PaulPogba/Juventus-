//
//  AJBFamilyTwoTableViewCell.h
//  AiJiaBao
//
//  Created by Marchisio on 2017/3/14.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "familyListModel.h"

@class LXWaveProgressView;
@interface AJBFamilyTwoTableViewCell : UITableViewCell
@property (nonatomic,strong)LXWaveProgressView *progressView;
@property (nonatomic,strong)familyListModel *familyListM;
@property (nonatomic,strong)UILabel *nameL;
@property (nonatomic,strong)UILabel *numPage;
@property (nonatomic,strong)UILabel *safeguardNum;
- (void) refreshWithIcon:(NSString *)image;

+ (NSString *) reuseIdentifierStr;

@end
