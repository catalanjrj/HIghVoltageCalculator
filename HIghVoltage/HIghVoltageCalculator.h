//
//  HIghVoltageCalculator.h
//  HIghVoltage
//
//  Created by Jorge Catalan on 7/29/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIghVoltageCalculator : NSObject
-(int)calculateWattsFromVolts:(int)volts andOhms:(int)ohms;
-(int)calculateWattsFromVolts:(int)volts andAmps:(int)amps;
-(int)calculateWattsFromAmps:(int)amps andOhms:(int)ohms;

-(int)calculateVoltsFromAmps:(int)amps andOhms:(int)ohms;
-(int)calculateVoltsFromWatts:(int)watts andAmps:(int)amps;
-(int)calculateVoltsFromWatts:(int)watts andOhms:(int)ohms;

-(int)calculateAmpsFromVolts:(int)volts andOhms:(int)ohms;
-(int)calculateAmpsFromWatts:(int)watts andVolts:(int)volts;
-(int)calculateAmpsFromWatts:(int)watts andOhms:(int)ohms;

-(int)calculateOhmsFromVolts:(int)volts andAmps:(int)amps;
-(int)calculateOhmsFromVolts:(int)volts andWatts:(int)watts;
-(int)calculateOhmsFromWatts:(int)watts andAmps:(int)amps;
@end
