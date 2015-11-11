//
//  LoginViewController.m
//  BuyBooks
//
//  Created by QianFeng on 15/11/5.
//  Copyright © 2015年 马扬. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"


@interface LoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;

@property (strong, nonatomic) IBOutlet UIButton *login;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    设置页面标题
    self.navigationItem.title = @"登 陆";
//    圆角
    [self addMasksToBounds];
//    添加→导航按钮
    [self createNavigationBar];
//    填充账号密码框
    [self fillUserAndPassWord];
//    设置导航栏不隐藏
    self.navigationController.navigationBar.hidden = NO;
}

-(void)setBlock:(BLCOKHIDD)block{
    self.hidd = block;
}


//填充账号密码输入
- (void)fillUserAndPassWord{
    NSString * localUserName = [[NSUserDefaults standardUserDefaults]objectForKey:@"userName"];
    self.userName.text = localUserName;
    NSString * localPassWord = [[NSUserDefaults standardUserDefaults]objectForKey:@"passWord"];
    self.passWord.text = localPassWord;
}


//创建页面左侧的注册按钮
-(void)createNavigationBar{
    /*UIBarButtonItemStylePlain*/
    UIBarButtonItem * right = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleBordered target:self action:@selector(rightButtonDidCliked:)];
    
    self.navigationItem.rightBarButtonItem = right;
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:self action:@selector(leftButtonDidCliked:)];
    self.navigationItem.leftBarButtonItem = left;
}

- (void)leftButtonDidCliked:(UIBarButtonItem *)button{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.hidd();
}


//当注册按钮被点击
- (void)rightButtonDidCliked:(UIBarButtonItem *)button{
    RegisterViewController * regist = [[RegisterViewController alloc]init];
    __weak typeof(self)weakself = self;
    [regist setBlock:^{
        [weakself fillUserAndPassWord];
    }];
    
//    跳转到注册页面
    [self.navigationController pushViewController:regist animated:YES];
}


//设置登录按钮被点击
- (IBAction)loginButtonDidCliked:(id)sender {
    BOOL rel = [self judgeInput];
    if (rel) {
//        开始登陆功能

        NSString * localUserName = [[NSUserDefaults standardUserDefaults]objectForKey:@"userName"];

        NSString * localPassWord = [[NSUserDefaults standardUserDefaults]objectForKey:@"passWord"];
        
        if ([localUserName isEqualToString:self.userName.text] && [localPassWord isEqualToString:self.passWord.text]) {
//            登陆成功
            [self.navigationController popViewControllerAnimated:YES];
            self.hidd();
        }else{
            UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"账号或密码错误!\n为了保护用户利益，我们实行账号和手机绑定，每个手机永久只能登陆一个账号！" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            [alert show];
        }

    }
}
//参数合法性判断
- (BOOL)judgeInput{
    if (self.userName.text.length == 0 || self.passWord.text.length == 0) {
        return NO;
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"用户名或密码不能为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    }
    return YES;
}

//添加圆角
- (void)addMasksToBounds{
    self.login.layer.masksToBounds = YES;
    self.login.layer.cornerRadius = 5.f;
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
    
}
@end
