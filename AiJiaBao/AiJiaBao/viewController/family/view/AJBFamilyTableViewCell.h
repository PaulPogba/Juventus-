//
//  AJBFamilyTableViewCell.h
//  AiJiaBao
//
//  Created by 医麦思 on 2017/2/24.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "familyListModel.h"
@class LXWaveProgressView;

@interface AJBFamilyTableViewCell : UITableViewCell
@property (nonatomic,strong)LXWaveProgressView *progressView;
@property (nonatomic,strong)UIImageView *peachImageV;
@property (nonatomic,strong)familyListModel *familyListM;

@property (nonatomic,strong)UILabel *nameL;
@property (nonatomic,strong)UILabel *numPage;
@property (nonatomic,strong)UILabel *safeguardNum;

- (void) refreshWithIcon:(NSString *)image;
+ (NSString *) reuseIdentifierStr;

@end
