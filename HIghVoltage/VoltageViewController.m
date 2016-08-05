//
//  ViewController.m
//  HIghVoltage
//
//  Created by Jorge Catalan on 7/29/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "VoltageViewController.h"

@interface VoltageViewController () <UIPickerViewDelegate,UIPickerViewDataSource>


@property (strong, nonatomic)NSArray *types;

@end

@implementation VoltageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Voltage";
    self.voltagePicker.delegate = self;
    self.voltagePicker.dataSource = self;
    
    
    self.types = @[@"watts",@"volts",@"amps",@"ohms"];
    
    [self.voltageInput becomeFirstResponder];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - UIPickerViewDelegate
-(nullable NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.types[row];

}


#pragma mark - UIPickerViewDataSource


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;

}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return self.types.count;
}



@end
