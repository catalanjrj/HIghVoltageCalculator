//
//  HIghVoltageCalculator.m
//  HIghVoltage
//
//  Created by Jorge Catalan on 7/29/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "HIghVoltageCalculator.h"

@implementation HIghVoltageCalculator

//do calculations for Watts
-(int)calculateWattsFromVolts:(int)volts andOhms:(int)ohms{
    return (volts * volts) / ohms;
}

-(int)calculateWattsFromVolts:(int)volts andAmps:(int)amps{
    return volts * amps;
}
-(int)calculateWattsFromAmps:(int)amps andOhms:(int)ohms{
    return (amps * amps) * ohms;
}

//do calculations for Volts

-(int)calculateVoltsFromAmps:(int)amps andOhms:(int)ohms{
    return amps * ohms;
}

-(int)calculateVoltsFromWatts:(int)watts andAmps:(int)amps{
    return watts / amps;
}

-(int)calculateVoltsFromWatts:(int)watts andOhms:(int)ohms{
    return sqrt(watts * ohms);
}

//do calculations for Amps

-(int)calculateAmpsFromVolts:(int)volts andOhms:(int)ohms{
    return volts / ohms;
    
}

-(int)calculateAmpsFromWatts:(int)watts andVolts:(int)volts{
    return watts / volts;
}

-(int)calculateAmpsFromWatts:(int)watts andOhms:(int)ohms{
    return sqrt(watts / ohms);
}

//do calculations for Ohms

-(int)calculateOhmsFromVolts:(int)volts andAmps:(int)amps{
    return volts / amps;
}

-(int)calculateOhmsFromVolts:(int)volts andWatts:(int)watts{
    return (volts * volts) / watts;
}

-(int)calculateOhmsFromWatts:(int)watts andAmps:(int)amps{
    return  watts / (amps * amps);
}

@end
