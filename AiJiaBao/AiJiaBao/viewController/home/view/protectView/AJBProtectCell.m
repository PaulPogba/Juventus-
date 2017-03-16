//
//  AJBProtectCell.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/3.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBProtectCell.h"

@implementation AJBProtectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

+ (NSString *)reuseIdentifier
{
    return @"AJBProtectCell";
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
