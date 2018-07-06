//
//  ViewController.m
//  RSADemo
//
//  Created by Sunny on 2018/7/6.
//  Copyright © 2018年 sunny. All rights reserved.
//

#import "ViewController.h"
#import "RSAEncryptor.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSString *originalString = @"这是一段将要使用'.der'文件加密的字符串!";
    NSLog(@"加密前:%@", originalString);
   
    
     //使用.der和.p12中的公钥私钥加密解密
    ///公钥加密
    NSString *public_key_path = [[NSBundle mainBundle] pathForResource:@"public_key.der" ofType:nil];
    NSString *encryptStr = [RSAEncryptor encryptString:originalString publicKeyWithContentsOfFile:public_key_path];
    NSLog(@"加密后:%@", encryptStr);
    
    ///私钥解密，私钥文件密码是123456
    NSString *private_key_path = [[NSBundle mainBundle] pathForResource:@"private_key.p12" ofType:nil];
    NSString *decryptStr = [RSAEncryptor decryptString:encryptStr privateKeyWithContentsOfFile:private_key_path password:@"123456"];
    NSLog(@"解密后:%@", decryptStr);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
