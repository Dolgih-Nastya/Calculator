//
//  NCCalculatorViewController.m
//  NastyaCalculator3
//


#import "NCCalculatorViewController.h"

@interface NCCalculatorViewController ()
@property(nonatomic, strong) IBOutlet UILabel  *resLabel;

@property(nonatomic, strong) NSString *firstNumber;
@property(nonatomic, strong) NSString *secondNumber;
@property(nonatomic, strong) NSString *sign;
@property BOOL isFirstNumberFilled;
@property(nonatomic, strong) NSString *result;

@end

@implementation NCCalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self resetValues];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)digitalButonClick:(UIButton*)sender
{
    if (!self.isFirstNumberFilled)    {
      self.firstNumber = [self.firstNumber stringByAppendingString:sender.currentTitle];
    }
    else    {
        self.secondNumber = [self.secondNumber stringByAppendingString:sender.currentTitle];
    }
    self.result = [self.result stringByAppendingString:sender.currentTitle];
    self.resLabel.text = self.result;
}

- (IBAction)signButtonClick:(UIButton*)sender
{
    self.sign = sender.currentTitle;
    self.isFirstNumberFilled=YES;
    self.result = [self.result stringByAppendingString:sender.currentTitle];
    self.resLabel.text = self.result;
    
}

- (IBAction)isButtonClick:(UIButton*)sender
{
    
    double value = [self Calculate];
    self.result=[[self.result stringByAppendingString:sender.currentTitle] stringByAppendingString:[NSString stringWithFormat:@"%0.4lf", value]];
    self.resLabel.text = self.result;
    [self resetValues];
}

- (void)resetValues
{
    self.firstNumber  =  @"";
    self.secondNumber =  @"";
    self.sign = @"";
    self.result = @"";
    self.isFirstNumberFilled = NO;
}

- (double)Calculate
{
  
    double num1 = [self.firstNumber doubleValue];
    double num2 = [self.secondNumber doubleValue];
    if ([self.sign isEqual:@"+"])                {
        return num1+num2;
    } else if ([self.sign isEqual:@"-"])         {
        return num1-num2;
    } else if ([self.sign isEqual:@"*"])         {
        return num1*num2;
    } else if ([self.sign isEqualToString:@"/"]) {
        if (num2!=0){  return num1/num2;
        } else {[[[UIAlertView alloc] initWithTitle:@"Error"
                                              message:@"Divide by zero"
                                              delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil ]show];
        return NAN;
    }}
    else{[[[UIAlertView alloc] initWithTitle:@"Error"
                                     message:@"Sign is incorrect"
                                     delegate:self
                                     cancelButtonTitle:@"OK"
                                     otherButtonTitles: nil ]show];
        return NAN;
    }
}
@end
