//
//  NCCalculatorModel.h
//  NastyaCalculator3
//
//  Created by Анастасия Долгих on 4/14/14.
//  Copyright (c) 2014 Nastya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NCCalculatorModel : NSObject
- (NSNumber *)calculateWithFirstNumber:(NSNumber *)firstNumber
                       secondNumber:(NSNumber *)secondNumber
                               sign:(NSString *)sign
                                 error: (NSError **) error;


@end
