//
//  NCCalculatorViewController.m
//  NastyaCalculator3
//
//  Created by Maksim on 12.04.14.
//  Copyright (c) 2014 Nastya. All rights reserved.
//

#import "NCCalculatorViewController.h"

@interface NCCalculatorViewController ()
@property(nonatomic, strong) IBOutlet UILabel  *sumLabel;
@property(nonatomic, strong) IBOutlet UIButton *sumButton;
@property(nonatomic, strong) IBOutlet UIButton *digitButton;
@property(nonatomic, strong) IBOutlet UILabel  *resLabel;
@property(nonatomic, strong) NSString* firstNumber;
@property(nonatomic, strong) NSString* secondNumber;
@property(nonatomic, strong) NSString* sign;
@property BOOL isFirstNumberFilled;
@property(nonatomic, strong) NSString* result;
@end

@implementation NCCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.firstNumber  =  [NSString new];
        self.secondNumber =  [NSString new];
        self.sign = [NSString new];
        self.result = [NSString new];
        self.isFirstNumberFilled=NO;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SumButtonClick:(id)sender
{
    NSNumber * sum     = [NSNumber numberWithDouble:1+2];
    self.sumLabel.text = [@"1 + 2 is " stringByAppendingString:[sum stringValue]];
}

- (IBAction)DigitalButonClick:(id)sender
{
    if (self.isFirstNumberFilled==NO)
    {
      self.firstNumber=[self.firstNumber stringByAppendingString:[(UIButton*) sender currentTitle]];
    }
    else
    {
        self.secondNumber=[self.secondNumber stringByAppendingString:[(UIButton*) sender currentTitle]];
    }
    self.result = [self.result stringByAppendingString:[(UIButton*) sender currentTitle]];
    self.resLabel.text = self.result;
}

- (IBAction)SignButtonClick:(id)sender
{
    self.sign = [(UIButton*) sender currentTitle];
    self.isFirstNumberFilled=YES;
    self.result = [self.result stringByAppendingString:[(UIButton*) sender currentTitle]];
    self.resLabel.text = self.result;
    
}

- (IBAction)IsButtonClick:(id)sender
{
    
    double value = [self Calculate];
    self.result=[[self.result stringByAppendingString:[(UIButton*) sender currentTitle]] stringByAppendingString:[NSString stringWithFormat:@"%f", value]];
    self.resLabel.text = self.result;
    self.firstNumber=[NSString new];
    self.secondNumber=[NSString new];
    self.sign = [NSString new];
    self.result = [NSString new];
    self.isFirstNumberFilled=NO;
}

- (double)Calculate
{
  
    double num1 = [self.firstNumber doubleValue];
    double num2 = [self.secondNumber doubleValue];
    if ([self.sign isEqual:@"+"])
    {
        return num1+num2;
    }
    else if ([self.sign isEqual:@"-"])
    {
        return num1-num2;
    }
    else if ([self.sign isEqual:@"*"])
    {
        return num1*num2;
    }
    else
    {
        return num1/num2;
    }
}
@end
