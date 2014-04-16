//
//  NCCalculatorModel.m
//  NastyaCalculator3
//
//  Created by Анастасия Долгих on 4/14/14.
//  Copyright (c) 2014 Nastya. All rights reserved.
//

#import "NCCalculatorModel.h"

@implementation NCCalculatorModel
-(NSNumber *) calculateWithFirstNumber:(NSNumber *)firstNumber secondNumber:(NSNumber *)secondNumber sign:(NSString *)sign error:(NSError *__autoreleasing *)error
{
    double num1 = [firstNumber doubleValue];
    double num2 = [secondNumber doubleValue];
    if ([sign isEqualToString:@"+"])             {
        return @(num1+num2);
    } else if ([sign isEqualToString:@"-"])         {
        return @(num1-num2);
    } else if ([sign isEqualToString:@"*"])         {
        return @(num1*num2);
    } else if ([sign isEqualToString:@"/"]) {
        if (num2!=0){  return @(num1/num2);
        } else {
            *error = [[NSError alloc] initWithDomain:@"Incorrect data" code:0 userInfo:@{@"description": @"Divide by zero"}];
        }}
    else{
        *error = [[NSError alloc] initWithDomain:@"Incorrect data" code:0 userInfo:@{@"description": @"Sign is incorrect"}];
        
    }
    
    return  @(NAN);

}
@end
