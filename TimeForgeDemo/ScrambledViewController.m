//
//  ScrambledViewController.m
//  TimeForgeDemo
//
//  Created by Gordon Sandercox on 10/14/16.
//  Copyright © 2016 Gordon Sandercox. All rights reserved.
//

#import "ScrambledViewController.h"

@interface ScrambledViewController ()

@end

@implementation ScrambledViewController
@synthesize NewNameLabel;
@synthesize NewGenderLabel;
NSString *newNameTemp;
NSString *newGenderTemp;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NewNameLabel.text = newNameTemp;
    NewGenderLabel.text = newGenderTemp;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNewName: (NSMutableString *) newName{
    newNameTemp = newName;
}

- (void)setNewGender: (NSString *) newGender{
    newGenderTemp = newGender;
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
