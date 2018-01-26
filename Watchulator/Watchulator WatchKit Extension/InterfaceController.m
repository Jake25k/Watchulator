//
//  InterfaceController.m
//  Watchulator WatchKit Extension
//
//  Created by Jake Moore on 12/18/17.
//  Copyright © 2017 Jake Moore. All rights reserved.
//

#import "InterfaceController.h"


@interface InterfaceController ()

@end


@implementation InterfaceController

NSString * mathValue = @"0"; //value to keep track of input
NSString * firstValue = @"0"; //value for first input
NSString * secondValue = @"0"; //value for second input
NSString * sign = @"";
NSString * negativeValue = @"-";
float finalNumber;
BOOL alreadyCalculated = false;

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    self.mathOutput.text = @"0";
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

-(BOOL)firstAndOnlyZero {
    if ([mathValue isEqualToString: @"0"])
        return true;
    else
        return false;
}

-(void)addDigit:(NSString *) d; {
    NSString * addedValue = d;
    NSString * finalString = [mathValue stringByAppendingString: addedValue];
    self.mathOutput.text = finalString;
    mathValue = finalString;
}

-(void)addFirstDigit: (NSString *) d; {
    self.mathOutput.text = d;
    mathValue = d;
}

-(BOOL)containsSigns {
    if ([mathValue rangeOfString:@"+"].location == NSNotFound && [mathValue rangeOfString:@"-"].location == NSNotFound && [mathValue rangeOfString:@"x"].location == NSNotFound && [mathValue rangeOfString:@"/"].location == NSNotFound)
        return false;
    else
        return true;
             
}

-(NSString *)getLastCharacter {
    if ([mathValue length] != 0){
        NSString * character = [mathValue substringFromIndex: [mathValue length] - 1];
        return character;
    }
    else
        return mathValue; //only one value
}

-(void)removeLastCharacter {
    if ([mathValue length] != 0){
        mathValue = [mathValue substringToIndex:mathValue.length-(mathValue.length>0)];
        self.mathOutput.text = mathValue;
    }
}

-(NSString *)getFirstCharacter {
    if ([mathValue length] != 0){
        NSString * character = [mathValue substringFromIndex: 1];
        return character;
    }
    else
        return mathValue; //only one value
}

-(void) makeItNegativeOrPositive {
    if([mathValue isEqualToString: @"0."] || [mathValue isEqualToString: @"0"])
        ;
    else{
        negativeValue = @"-";
        if ([mathValue rangeOfString:@"-"].location == NSNotFound){ //its positive
            negativeValue = [negativeValue stringByAppendingString: mathValue];
            mathValue = negativeValue;
            self.mathOutput.text = mathValue;
        }
        else{
            mathValue = [mathValue substringFromIndex: 1];
            self.mathOutput.text = mathValue;
        }
    }
}

-(BOOL) lastCharASign {
    if ([[self getLastCharacter] isEqualToString: @"+"])
        return true;
    else if ([[self getLastCharacter] isEqualToString: @"-"])
        return true;
    else if ([[self getLastCharacter] isEqualToString: @"x"])
        return true;
    else if ([[self getLastCharacter] isEqualToString: @"/"])
        return true;
    else
        return false;
}

-(void)calculate {
    
    if ([sign isEqualToString: @"+"])
        finalNumber = [firstValue floatValue] + [secondValue floatValue];
    else if ([sign isEqualToString: @"_"])
         finalNumber = [firstValue floatValue] - [secondValue floatValue];
    else if ([sign isEqualToString: @"x"])
        finalNumber = [firstValue floatValue] * [secondValue floatValue];
    else //division
        finalNumber = [firstValue floatValue] / [secondValue floatValue];
    
    self.mathOutput.text = [NSString stringWithFormat:@"%g",finalNumber];
    mathValue = [NSString stringWithFormat:@"%g",finalNumber];
    alreadyCalculated = true;
}

-(void) clear {
    self.mathOutput.text = @"0";
    mathValue = @"0";
    firstValue = @"0";
    secondValue = @"0";
    negativeValue = @"-";
}

-(void) checkIfCalculated {
    if (alreadyCalculated){
        [self clear];
        alreadyCalculated = false; //reset to false
    }
}

- (IBAction)clearButton {
    [self clear];
}

- (IBAction)zeroButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"0"];
    }
    else if ([self firstAndOnlyZero])
        ; //do nothing
    else{
        [self addDigit:@"0"];
    }
}

- (IBAction)oneButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"1"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"1"];
    else{
        [self addDigit:@"1"];
    }
}

- (IBAction)twoButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"2"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"2"];
    else
       [self addDigit:@"2"];
}

- (IBAction)threeButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"3"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"3"];
    else
        [self addDigit:@"3"];
}

- (IBAction)fourButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"4"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"4"];
    else
        [self addDigit:@"4"];
}

- (IBAction)fiveButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"5"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"5"];
    else
        [self addDigit:@"5"];
}

- (IBAction)sixButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"6"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"6"];
    else
        [self addDigit:@"6"];
}

- (IBAction)sevenButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"7"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"7"];
    else
        [self addDigit:@"7"];
}

- (IBAction)eightButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"8"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"8"];
    else
        [self addDigit:@"8"];
}

- (IBAction)nineButton {
    [self checkIfCalculated];
    
    if ([self lastCharASign]){
        [self addFirstDigit:@"9"];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"9"];
    else
        [self addDigit:@"9"];
}

- (IBAction)decimalButton {
    if ([self lastCharASign]){
        [self addFirstDigit:@"0."];
    }
    else if ([self firstAndOnlyZero])
        [self addFirstDigit:@"0."];
    else if ([[self getLastCharacter] isEqualToString: @"."]){
        [self makeItNegativeOrPositive];
        [self removeLastCharacter ];
    }
    else if ([mathValue rangeOfString:@"."].location != NSNotFound)
        [self makeItNegativeOrPositive];
    else
        [self addDigit:@"."];
}

- (IBAction)divisionButton {
    if ([self firstAndOnlyZero])
        ; //do nothing
    else{
        if ([self lastCharASign]){
            [self removeLastCharacter];
        }
    firstValue = mathValue;
    sign = @"/";
    [self addDigit:@"/"];
    }
}

- (IBAction)multiplicationButton {
    if ([self firstAndOnlyZero])
        ; //do nothing
    else{
        if ([self lastCharASign]){
            [self removeLastCharacter];
        }
    }
    firstValue = mathValue;
    sign = @"x";
    [self addDigit:@"x"];
}

- (IBAction)additionButton {
    if ([self firstAndOnlyZero])
        ; //do nothing
    else{
        if ([self lastCharASign]){
            [self removeLastCharacter];
        }
    }
    firstValue = mathValue;
    sign = @"+";
    [self addDigit:@"+"];
}

- (IBAction)subtractButton {
    if ([self firstAndOnlyZero])
        ; //do nothing
    else{
        if ([self lastCharASign]){
            [self removeLastCharacter];
        }
    }
    firstValue = mathValue;
    sign = @"_";
    [self addDigit:@"-"];
}

- (IBAction)equalButton {
    secondValue = mathValue;
    if ([self firstAndOnlyZero])
        ; //do nothing
    else
        [self calculate];
}

@end



