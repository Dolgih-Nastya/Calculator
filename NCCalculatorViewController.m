//
//  NCCalculatorViewController.m
//  NastyaCalculator3
//


#import "NCCalculatorViewController.h"
#import "NCCalculatorModel.h"

@interface NCCalculatorViewController ()
@property(nonatomic, strong) IBOutlet UILabel  *resLabel;
@property(nonatomic, strong) NCCalculatorModel *calcModel;

@property(nonatomic, strong) NSString *firstNumber;
@property(nonatomic, strong) NSString *secondNumber;
@property(nonatomic, strong) NSString *sign;
@property BOOL isSignFilled;
@property BOOL isFirstNumberFilled;
@property BOOL isDotPresent;
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
    self.calcModel = [NCCalculatorModel new];
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
    if (!self.isSignFilled){
        self.sign = sender.currentTitle;
        self.isSignFilled = YES;
        self.isFirstNumberFilled=YES;
        self.isDotPresent = NO;
        self.result = [self.result stringByAppendingString:sender.currentTitle];
        self.resLabel.text = self.result;
    }
    
}

- (IBAction)dotButtonClick:(UIButton*)sender
{
    if (!self.isDotPresent){
        if (!self.isFirstNumberFilled){
            self.firstNumber = [self.firstNumber stringByAppendingString:sender.currentTitle];
        }
        else {
            self.secondNumber = [self.result stringByAppendingString: sender.currentTitle];
        }
        self.result = [self.result stringByAppendingString:sender.currentTitle];
        self.resLabel.text = self.result;
        self.isDotPresent = YES;
    }
}

- (IBAction)isButtonClick:(UIButton*)sender
{
    
    NSError *error = nil;
    double value = [self.calcModel calculateWithFirstNumber:@(self.firstNumber.doubleValue)
                                               secondNumber:@(self.secondNumber.doubleValue)
                                                       sign:self.sign
                                                       error:&error].doubleValue;
    if (!error){
        self.result = [[self.result stringByAppendingString:sender.currentTitle] stringByAppendingString: [NSString stringWithFormat:@"%0.4lf", value]];
    }else{
        self.result=@"Error";
        [[[UIAlertView alloc] initWithTitle:@"Error" message:error.userInfo[@"description"] delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil] show ];
    }
    self.resLabel.text = self.result;
    [self resetValues];
}

- (void)resetValues
{
    self.firstNumber  =  @"";
    self.secondNumber =  @"";
    self.sign = @"";
    self.result = @"";
    self.isSignFilled = NO;
    self.isFirstNumberFilled = NO;
}

@end
