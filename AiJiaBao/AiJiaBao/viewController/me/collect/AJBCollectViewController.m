//
//  AJBCollectViewController.m
//  AiJiaBao
//
//  Created by nuhgroup on 2017/3/8.
//  Copyright © 2017年 nuhgroup. All rights reserved.
//

#import "AJBCollectViewController.h"

@interface AJBCollectViewController ()

@property (nonatomic, strong) NSMutableArray *dateSource;

@end

@implementation AJBCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dateSource = [[NSMutableArray alloc] init];
    [_dateSource addObject:@"0元领碎屏无忧险"];
    [_dateSource addObject:@"意外保障计划"];
    [_dateSource addObject:@"北京2017年社保"];
    
    [self setRightBarButtonItem1WithImage:@"homeA"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onRightItemAction:(UIButton *)sender
{
    NSLog(@"搜索");
}
#pragma mark ---  delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dateSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *reuseIdentifier = @"AJBCollectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
        cell.textLabel.font = FONT_OF_SIZE_14;
        cell.textLabel.textColor = COLOR_UI_333333;
    }
    cell.textLabel.text = [_dateSource objectAtIndex:indexPath.section];
    cell.imageView.image = imageNamed(@"homeA");
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        __weak typeof(self) __weakSelf =  self;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定删除这条收藏" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *delete = [UIAlertAction actionWithTitle:@"删除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [__weakSelf.dateSource removeObjectAtIndex:indexPath.section];
            [__weakSelf.tableView reloadData];
        }];
        
        [alert addAction:cancel];
        [alert addAction:delete];
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return MARGIN_15;
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
