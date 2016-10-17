//
//  ScrambledViewController.h
//  TimeForgeDemo
//
//  Created by Gordon Sandercox on 10/14/16.
//  Copyright © 2016 Gordon Sandercox. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrambledViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *NewNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *NewGenderLabel;
- (void)setNewGender: (NSString *) newGender;
- (void)setNewName: (NSMutableString *) newName;

@end
