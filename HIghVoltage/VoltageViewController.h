//
//  ViewController.h
//  HIghVoltage
//
//  Created by Jorge Catalan on 7/29/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VoltageViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIPickerView *voltagePicker;

@property (weak, nonatomic) IBOutlet UITextField *voltageInput;



@end

