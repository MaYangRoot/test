//
//  RegisterViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterUrlRequest.h"






/*
 *注册的时候密码需要设置成******
 *密码需要输入两次
 */

@interface RegisterViewController ()<UIAlertViewDelegate>

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
@property (strong, nonatomic) IBOutlet UIButton *regist;

@property (strong, nonatomic) NSString * ret; //注册结果返回

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注 册";
//    为按钮添加圆角
    [self addMasksToBounds];
    
    [self setBlock];
    
    [self createNavigationBar];
    
}


//设置注册的回调
-(void)setBlock{
    __weak typeof(self) weakself = self;
    RegisterUrlRequest * manager =[RegisterUrlRequest manager];
//    网络请求成功地回调
    [manager setSuccessBlock:^(NSString *str) {
        
        weakself.ret = str;
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:weakself cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        alert.tag = 1;
        [alert show];
        
    }];
//    网络请求失败的回调
    [manager setFailBlock:^(NSString *str) {
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:str delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
    }];
}

//创建页面左侧的注册按钮
-(void)createNavigationBar{
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(leftButtonDidCliked:)];
    self.navigationItem.leftBarButtonItem = left;
}

//点击返回
- (void)leftButtonDidCliked:(UIBarButtonItem *)button{
    [self.navigationController popViewControllerAnimated:YES];
    self.fill();
}


//注册按钮被点击
- (IBAction)registerButtonDidCliked:(id)sender {
//    参数合法性判断
    BOOL rel = [self judgeInput];
    
    if(rel){
//    执行注册操作
        [[RegisterUrlRequest manager]createRequest:REGISTER AndUserName:self.userName.text AndPassWord:self.passWord.text];
    }
}

//用来在注册完之后通知登陆页面把密码填上
-(void)setBlock:(BLCOKFILL)block{
    self.fill = block;
}


//参数合法性判断
-(BOOL)judgeInput{
//    p判断用户名或密码是不是空
    if(self.userName.text.length == 0 || self.passWord.text.length == 0 ){
        
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"用户名或密码不能为空！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        return NO;
        
    }
    
//    判断用户名或密码是不是含有非法字符
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[A-Za-z0-9]+$" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSTextCheckingResult *result = [regex firstMatchInString:self.userName.text options:0 range:NSMakeRange(0, [self.userName.text length])];
    
    if (!result) {
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入合法字符，用户名只能为数字或字母！" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        [alert show];
        
        return NO;
    }
    return YES;
}

//添加圆角
- (void)addMasksToBounds{
    self.regist.layer.masksToBounds = YES;
    self.regist.layer.cornerRadius = 5.f;
}


#pragma  mark UIAlert ------协议
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"%ld",buttonIndex);
    if ([self.ret isEqualToString:@"注册成功"] && alertView.tag == 1) {
        [self.navigationController popViewControllerAnimated:YES];
        self.fill();
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
