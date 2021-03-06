//
//  RiderCreditCardDetailTableViewController.h
//  BZRide
//
//  Created by Kyeesha Technologies on 12/30/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <DLRadioButton/DLRadioButton.h>

@interface RiderCreditCardDetailTableViewController : UITableViewController
{

}


@property (strong, nonatomic) IBOutlet UITableView *riderCreditCardTable;
@property (weak, nonatomic) IBOutlet UITextField *cardNum;
@property (weak, nonatomic) IBOutlet UITextField *billAdd1;
@property (weak, nonatomic) IBOutlet UITextField *billAdd2;
@property (weak, nonatomic) IBOutlet UITextField *creditCity;
@property (weak, nonatomic) IBOutlet UITextField *creditState;
@property (weak, nonatomic) IBOutlet UITextField *creditZip;
@property (weak, nonatomic) IBOutlet UITextField *creditExpMonth;
@property (weak, nonatomic) IBOutlet UITextField *creditExpYear;
@property (weak, nonatomic) IBOutlet UITextField *creditCvv;
@property (weak, nonatomic) IBOutlet DLRadioButton *debitBtn;
@property (weak, nonatomic) IBOutlet DLRadioButton *creditBtn;
@property (weak, nonatomic) IBOutlet DLRadioButton *masterBtn;
@property (weak, nonatomic) IBOutlet DLRadioButton *visaBtn;
@property (weak, nonatomic) IBOutlet DLRadioButton *amexBtn;



- (IBAction)done:(UIButton *)sender;



@end
