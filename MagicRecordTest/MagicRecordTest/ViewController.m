//
//  ViewController.m
//  MagicRecordTest
//
//  Created by Elaine on 16--15.
//  Copyright © 2016年 yinuo. All rights reserved.
//

#import "ViewController.h"
#import <MagicalRecord/MagicalRecord.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arrayResult = [Person MR_findByAttribute:@"name" withValue:@"cui"];
    
    if (arrayResult.count == 0) {
        Person *person = [Person MR_createEntity];
        person.name = @"cui";
        person.sex = @"男";
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"失败" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];

    } else {
        Person *person = [arrayResult firstObject];
        
//        UIAlertController *alertContrl = [UIAlertController alertControllerWithTitle:@"提示" message:person.name preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:nil];
//        
//        [alertContrl addAction:action];
//        [self presentViewController:alertContrl animated:YES completion:nil];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:person.name message:person.sex delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
        
        NSLog(@"----保存的名字为:%@", person.name);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
