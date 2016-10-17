//
//  ViewController.m
//  TimeForgeDemo
//
//  Created by Gordon Sandercox on 10/14/16.
//  Copyright © 2016 Gordon Sandercox. All rights reserved.
//

#import "ViewController.h"
#import "ScrambledViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize NameField;
@synthesize ScrambleButton;
NSMutableString *tempName;
NSString *tempGender;
NSArray *genderTypes = nil;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ScrambleButton.titleLabel.font = [UIFont systemFontOfSize:30.0];
    
    //initialize the gender types array
    genderTypes = @[@"male",@"female"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didSelectScrambleIt:(UIButton *)sender {
    int r = arc4random_uniform(2);
    NSMutableString *newName = [self nameScrambler: NameField.text];
    NSString *randomGender = genderTypes[r];
    tempName = newName;
    tempGender = randomGender;
    
    [self performSegueWithIdentifier:@"SegueToScrambledViewController" sender:nil];
    
    
}

//Scrambles the submitted name
- (NSMutableString*)nameScrambler: (NSMutableString*) name{
    //Convert the TextField's text to a Mutable String
    NSMutableString *mutableName = [name mutableCopy];
    
    //Create a string without any spaces
    NSMutableString *noSpaceName = [[mutableName stringByReplacingOccurrencesOfString:@" " withString:@""] mutableCopy];
    
    //Find the length of the Mutable String
    NSUInteger strLen = [mutableName length];
    
    //Store the format of the string in an array
    NSMutableArray *formatArray = [self storeStringFormat:mutableName withLength:strLen];
    
    //Permutate the name without spaces
    NSMutableString *newName = [self stringScramble:noSpaceName];
    
    //Format newName
    NSMutableString *formattedNewName = [self formatNewName:newName withArray:formatArray withLength:strLen];
    
    return formattedNewName;
}

//Stores the format of the string in an array
- (NSMutableArray *) storeStringFormat: (NSMutableString *) mutableName withLength:(NSUInteger) strLen{
    NSMutableArray *placeArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < strLen; i++){
        char c = [mutableName characterAtIndex:i];
        BOOL isUppercase = [[NSCharacterSet uppercaseLetterCharacterSet] characterIsMember:[mutableName characterAtIndex:i]];
        if (c == ' ') {
            placeArray[i] = @"s";
        }
        else if(isUppercase){
            placeArray[i] = @"u";
        }
        else{
            placeArray[i] = @"l";
        }
    }
    return placeArray;
}

//Edits the string to be the original name's format
-(NSMutableString *) formatNewName: (NSMutableString *) newName withArray: (NSMutableArray *) formatArray withLength: (NSUInteger) strLen{
    
    for (int i = 0; i<strLen; i++) {
        if([formatArray[i]  isEqual: @"s"]){
            [newName insertString:@" " atIndex:i];
        }
        else if ([formatArray[i] isEqual: @"u"]){
            NSString *c = [newName substringWithRange:NSMakeRange(i, 1)];
            c = [c capitalizedString];
            [newName replaceCharactersInRange:NSMakeRange(i, 1) withString: c];
        }
        else{
            NSString *c = [newName substringWithRange:NSMakeRange(i, 1)];
            c = [c lowercaseString];
            [newName replaceCharactersInRange:NSMakeRange(i, 1) withString: c];
        }
    }
    return newName;
}

//Permutates the name
- (NSMutableString *) stringScramble: (NSMutableString *) name{
    NSMutableString *newName;
    newName = [NSMutableString stringWithString:name];
    
    for (int i = ([name length] - 1); i > 0; i--) {
        int rand = (arc4random() % (i + 1));
        NSString *lastChar = [NSString stringWithFormat:@"%c",[newName characterAtIndex:i]];
        NSString *randChar = [NSString stringWithFormat:@"%c",[newName characterAtIndex:rand]];
        // Swap the elements
        [newName replaceCharactersInRange:NSMakeRange(rand, 1) withString:lastChar];
        [newName replaceCharactersInRange:NSMakeRange(i, 1) withString:randChar];
    }
    
    return newName;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"SegueToScrambledViewController"])
    {
        // Get reference to the destination view controller
        ScrambledViewController *vc = [segue destinationViewController];
        // Pass any objects to the view controller here, like...
        [vc setNewName:tempName];
        [vc setNewGender:tempGender];
    }
}


@end
