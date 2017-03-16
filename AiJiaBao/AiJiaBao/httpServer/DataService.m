//
//  BaseAPIList.h
//  Bylaw
//
//  Created by Marchisio on 17/3/11.
//  Copyright © 2017年 小Marchisio. All rights reserved.
//

#import "DataService.h"
//#import "AFNetworking.h"
#import "FCUUID.h"

#ifdef DEBUG
#define SLog(format, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define SLog(format, ...)
#endif

@implementation DataService

+ (void)postWithinterfaceType:(NSString *)interfaceType param:(id)param responseBlock:(requestSuccessBlock)responseDataBlock loadTokenRespnseBlock:(void (^)(BOOL success))loadTokenRespnseBlock  hud:(MBProgressHUD *)hud {
  
    NSDictionary *parameter = [NSDictionary dictionaryWithObjectsAndKeys:interfaceType,@"interfaceType",[FCUUID uuidForDevice],@"mac",[AJBUserDefaults getToken],@"token",param,@"criteria",nil];
    NSString *string = [parameter mj_JSONString];
    SLog(@"Http Request: %@\n===========Response============\n\n\n", string);
    
    [NetworkRequest postRequest:BaseURL params:parameter success:^(id responseObj) {
        
        [self parseHttpSuccessForData:responseObj responseDataBlock:responseDataBlock loadTokenRespnseBlock:loadTokenRespnseBlock hud:hud];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)task.response;
        [self parseHttpErrorForResponse:task.response statusCode:httpResponse.statusCode error:error hud:hud];
        
    } progressBlock:^(NSProgress *uploadProgress) {
        
    }];
}

+ (void)parseHttpSuccessForData: (id) responseObject responseDataBlock:(requestSuccessBlock)responseDataBlock loadTokenRespnseBlock:(void (^)(BOOL success))loadTokenRespnseBlock hud: (MBProgressHUD *) hud
{
    NSString *string = [responseObject mj_JSONString];
    SLog(@"Http Request: %@\n===========Response============\n\n\n", string);
    
    RestNetworkRequestResp *resp = [RestNetworkRequestResp mj_objectWithKeyValues:responseObject];
    
    if (resp.operFlag != 0) {
        responseDataBlock(responseObject);
        [hud hideAnimated:YES];
    } else {
        [DataService errorCodeResponseWithResp:resp  loadTokenRespnseBlock:loadTokenRespnseBlock hud:hud];
    }
}


//HTTP网络错误或服务器错误
+ (void) parseHttpErrorForResponse: (NSURLResponse *) response statusCode: (NSInteger) statusCode error : (NSError *) error hud: (MBProgressHUD *) hud
{
    if (response)
    {
        NSLog(@"Http Request Error: %@\n %@", error, [response mj_JSONString]);
    }else
    {
        NSLog(@"Http Request Error: %@", error);
    }
    
    if (hud) {
        if ([NetworkRequest checkNetworkStatus]) {
            hud.label.text = @"连接服务器错误,请重试";
        } else {
            hud.label.text = @"网络连接失败，请检查你的网络";
        }
        [self hud:hud];
    }
}


/**
    失败之后的处理
 */
+ (void) errorCodeResponseWithResp:(RestNetworkRequestResp *)resp loadTokenRespnseBlock:(void (^)(BOOL success))loadTokenRespnseBlock  hud: (MBProgressHUD *) hud
{
    NSLog(@"resp.message --  %@",resp.message);
    if (resp.message != nil && resp.message.length>0 && resp.errcode == 000)
    {
        if (hud)
        {
            hud.detailsLabel.text = resp.message;
            [self hud:hud];
        }else
        {
            [MBProgressHUD toastError:resp.message];
        }
    }else
    {
        [hud hideAnimated:YES];
        if (resp.errcode == 004) {
            NSLog(@"客户实效，跳转登陆页面");
        } else if (resp.errcode == 003) {
            NSLog(@"token实效，重新获取token");
            [DataService postLoadTokenAgainWithloadTokenRespnseBlock:loadTokenRespnseBlock];
        } else if (resp.errcode == 999){
            NSLog(@"系统异常");
        }
    }
}


#pragma mark - hud
+ (void) hud:(MBProgressHUD *)hud
{
    [hud setType:HUDTypeOnlyText];
    hud.bezelView.color = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    hud.detailsLabel.textColor = [UIColor whiteColor];
    [hud hideAnimated:YES afterDelay:2];
}


#pragma mark - load token again
+ (void) postLoadTokenAgainWithloadTokenRespnseBlock:(void (^)(BOOL success))loadTokenRespnseBlock
{
    // 申请用户令牌
    NSLog(@" ----- %@",@"申请用户令牌");
    
    NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:[AJBUserDefaults getUserPhone],@"mobile",[AJBUserDefaults getUserPassword],@"logonPwd",nil];
    [DataService postWithinterfaceType:TOKEN_APPLY param:param responseBlock:^(id responseObject) {
        
        RestRegisterResp *resp = [RestRegisterResp mj_objectWithKeyValues:responseObject];
        JSONRegisterObj *obj = [JSONRegisterObj mj_objectWithKeyValues:[resp.result objectAtIndex:0]];
        [AJBUserDefaults saveToken:SAFE_STR(obj.token)];
        
        loadTokenRespnseBlock(YES);
        
    } loadTokenRespnseBlock:nil hud:nil];

}


@end
