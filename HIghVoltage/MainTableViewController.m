//
//  MainTableViewController.m
//  HIghVoltage
//
//  Created by Jorge Catalan on 7/29/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

#import "MainTableViewController.h"
#import "HIghVoltageCalculator.h"
#import "VoltageViewController.h"

@interface MainTableViewController ()<UIPopoverPresentationControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *wattsLabel;
@property (weak, nonatomic) IBOutlet UILabel *voltsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ampsLabel;
@property (weak, nonatomic) IBOutlet UILabel *ohmsLabel;
@property(weak,nonatomic)IBOutlet UIBarButtonItem *plusButton;
@property(weak,nonatomic)IBOutlet UIBarButtonItem *clearButton;


@property(strong,nonatomic)HIghVoltageCalculator *calculator;
@property(strong,nonatomic)VoltageViewController *voltage;

@property(strong,nonatomic)NSMutableArray *selectedVoltageArray;
@property(strong,nonatomic)NSMutableDictionary *voltageDictionary;

@property BOOL recievedWatts, recievedVolts, recievedAmps, recievedOhms;

-(void)setTextForVoltage;
-(void)performVoltageCalculations;


@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"HIgh Voltage Calculator";
    
    self.calculator = [[HIghVoltageCalculator alloc]init];
    self.voltageDictionary = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@0,@"watts",@0,@"volts",@0,@"amps",@0,@"ohms", nil];
    self.recievedAmps = NO;
    self.recievedOhms = NO;
    self.recievedVolts = NO;
    self.recievedWatts = NO;
    
    [self setTextForVoltage];
    
    self.selectedVoltageArray = [[NSMutableArray alloc]init];

    
}

-(void)setTextForVoltage{
    self.ampsLabel.text = [NSString stringWithFormat:@"%@",self.voltageDictionary[@"amps"]];
    self.voltsLabel.text = [NSString stringWithFormat:@"%@",self.voltageDictionary[@"volts"]];
    self.wattsLabel.text = [NSString stringWithFormat:@"%@",self.voltageDictionary[@"watts"]];
    self.ohmsLabel.text = [NSString stringWithFormat:@"%@",self.voltageDictionary[@"ohms"]];

}

-(void)performVoltageCalculations{
    
    //for Watts
    if(!self.recievedWatts){
        if(self.recievedVolts && self.recievedAmps){
            self.voltageDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsFromVolts:[self.voltageDictionary[@"volts"]intValue]
            andAmps:[self.voltageDictionary[@"amps"]intValue]]];
        
        }else if (self.recievedVolts && self.recievedOhms){
            self.voltageDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsFromVolts:[self.voltageDictionary[@"volts"]intValue]
            andOhms:[self.voltageDictionary[@"ohms"]intValue]]];
        }else if(self.recievedAmps && self.recievedOhms){
            self.voltageDictionary[@"watts"] = [NSNumber numberWithInt:[self.calculator calculateWattsFromAmps:[self.voltageDictionary[@"amps"]intValue]
            andOhms:[self.voltageDictionary[@"ohms"]intValue]]];

                }
    }
    // for Volts
    if(!self.recievedVolts){
    if(self.recievedAmps && self.recievedOhms){
        self.voltageDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsFromAmps:[self.voltageDictionary[@"amps"]intValue]
        andOhms:[self.voltageDictionary[@"ohms"]intValue]]];
    }else if (self.recievedWatts && self.recievedAmps){
        self.voltageDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsFromWatts:[self.voltageDictionary[@"watts"]intValue]
        andAmps:[self.voltageDictionary[@"amps"]intValue]]];
    }else if(self.recievedWatts && self.recievedOhms){
        self.voltageDictionary[@"volts"] = [NSNumber numberWithInt:[self.calculator calculateVoltsFromWatts:[self.voltageDictionary[@"watts"]intValue]
        andOhms:[self.voltageDictionary[@"ohms"]intValue]]];
    }
        
}
    //for Amps
    if(!self.recievedAmps){
        if(self.recievedVolts && self.recievedOhms){
            self.voltageDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsFromVolts:[self.voltageDictionary[@"volts"]intValue]
            andOhms:[self.voltageDictionary[@"ohms"]intValue]]];
            
        }else if (self.recievedWatts && self.recievedVolts){
            self.voltageDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsFromWatts:[self.voltageDictionary[@"watts"]intValue]
            andVolts:[self.voltageDictionary[@"volts"]intValue]]];
        }else if(self.recievedWatts && self.recievedOhms){
            self.voltageDictionary[@"amps"] = [NSNumber numberWithInt:[self.calculator calculateAmpsFromWatts:[self.voltageDictionary[@"watts"]intValue]
            andOhms:[self.voltageDictionary[@"ohms"]intValue]]];
        }
    }
    //for Ohms
    if(!self.recievedOhms){
        if(self.recievedVolts && self.recievedAmps){
            self.voltageDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsFromVolts:[self.voltageDictionary[@"volts"]intValue]
            andAmps:[self.voltageDictionary[@"ohms"]intValue]]];
            
        }else if (self.recievedVolts && self.recievedWatts){
            self.voltageDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsFromVolts:[self.voltageDictionary[@"volts"]intValue]
            andWatts:[self.voltageDictionary[@"watts"]intValue]]];
        }else if(self.recievedWatts && self.recievedAmps){
            self.voltageDictionary[@"ohms"] = [NSNumber numberWithInt:[self.calculator calculateOhmsFromWatts:[self.voltageDictionary[@"watts"]intValue]
            andAmps:[self.voltageDictionary[@"amps"]intValue]]];

                }
            }
        }
#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"popover"]){
        self.voltage = (VoltageViewController *)segue.destinationViewController;
        self.voltage.modalPresentationStyle = UIModalPresentationPopover;
        self.voltage.popoverPresentationController.delegate = self;
    
    }

}

#pragma mark - button actions 

- (IBAction)clearButton:(UIBarButtonItem *)sender {
    self.voltageDictionary[@"watts"]  = @0;
    self.voltageDictionary[@"volts"]  = @0;
    self.voltageDictionary[@"amps"]  = @0;
    self.voltageDictionary[@"ohms"]  = @0;
    [self setTextForVoltage];
    self.plusButton.enabled = YES;
    [self.selectedVoltageArray removeAllObjects];
    self.recievedAmps = NO;
    self.recievedWatts = NO;
    self.recievedVolts = NO;
    self.recievedOhms = NO;
}
-(IBAction)calculateButtonTapped:(UIStoryboardSegue *)segue{
    self.voltage = (VoltageViewController *)segue.sourceViewController;
    switch ([self.voltage.voltagePicker selectedRowInComponent:0]) {
        case 0:
            self.wattsLabel.text = self.voltage.voltageInput.text;
            self.recievedWatts = YES;
            self.voltageDictionary[@"watts"] = [NSNumber numberWithInteger:[self.voltage.voltageInput.text integerValue]];
            break;
        case 1:
            self.voltsLabel.text = self.voltage.voltageInput.text;
            self.recievedVolts = YES;
            self.voltageDictionary[@"volts"] = [NSNumber numberWithInteger:[self.voltage.voltageInput.text integerValue]];
            break;
        case 2:
            self.ampsLabel.text = self.voltage.voltageInput.text;
            self.recievedAmps = YES;
            self.voltageDictionary[@"amps"] = [NSNumber numberWithInteger:[self.voltage.voltageInput.text integerValue]];
            break;
        case 3:
            self.ohmsLabel.text = self.voltage.voltageInput.text;
            self.recievedOhms = YES;
            self.voltageDictionary[@"ohms"] = [NSNumber numberWithInteger:[self.voltage.voltageInput.text integerValue]];
            break;
        default:
            
            break;
    }
    [self.selectedVoltageArray addObject:self.voltage.voltageInput.text];
    if(self.selectedVoltageArray.count ==2){
        self.plusButton.enabled = NO;
        [self performVoltageCalculations];
        [self setTextForVoltage];
    }
    [self.voltage dismissViewControllerAnimated:YES completion:nil];
    }



#pragma mark - UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController*)controller{
    return UIModalPresentationFullScreen;

}

#pragma mark - VoltageSelectionDelegate

-(void)returnSelectedVoltage:(NSInteger)type andValue:(NSString *)value{
    switch (type) {
        case 0:
            self.wattsLabel.text = value;
            self.recievedWatts = YES;
            self.voltageDictionary[@"watts"] = (NSNumber *)value;
            break;
        case 1:
            self.voltsLabel.text = value;
            self.recievedVolts = YES;
            self.voltageDictionary[@"volts"] = (NSNumber *)value;
            break;
        case 2:
            self.ampsLabel.text = value;
            self.recievedAmps = YES;
            self.voltageDictionary[@"amps"] = (NSNumber *)value;
            break;
        case 3:
            self.ohmsLabel.text = value;
            self.recievedOhms = YES;
            self.voltageDictionary[@"ohms"] = (NSNumber *)value;
            break;
            
        default:
            break;
    }
    [self.selectedVoltageArray addObject:value];
    if(self.selectedVoltageArray.count == 2){
        self.plusButton.enabled = NO;
        [self performVoltageCalculations];
        [self setTextForVoltage];
    
    }


}

    

        
                    







@end
