//
//  ViewController.m
//  TestOC&JS
//
//  Created by vsKing on 2018/4/20.
//  Copyright © 2018年 vsKing. All rights reserved.
//

#import "ViewController.h"
#import "WEBViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    
}



- (void)viewDidAppear:(BOOL)animated{
    WEBViewController * web = [[WEBViewController alloc] init];
    [self.navigationController pushViewController:web animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
