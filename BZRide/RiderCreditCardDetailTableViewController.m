//
//  RiderCreditCardDetailTableViewController.m
//  BZRide
//
//  Created by Kyeesha Technologies on 12/30/16.
//  Copyright © 2016 Sooraj. All rights reserved.
//

#import "RiderCreditCardDetailTableViewController.h"
#import <Stripe/Stripe.h>

@interface RiderCreditCardDetailTableViewController ()

@end
NSString *checkFlag;
NSString *checkCard;
//NSString *cardTypeVal;
//NSString *cardProvideVal;

@implementation RiderCreditCardDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapFrom:)];
[self.tableView addGestureRecognizer:tapGestureRecognizer];
    
    NSString *checkValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"checkValueKey"];
    if([checkValue  isEqual: @"2"])
    {
        NSString *cardTypeValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"cardTypeKey"];
        
        if([cardTypeValue  isEqual: @"D"])
           _debitBtn.selected=true;
        else
            _creditBtn.selected=true;
        
        NSString *cardProviderValue = [[NSUserDefaults standardUserDefaults] stringForKey:@"cardProviderKey"];
        
        if([cardProviderValue  isEqual: @"M"])
            _masterBtn.selected=true;
        else if([cardProviderValue  isEqual: @"V"])
            _visaBtn.selected=true;
        else
            _amexBtn.selected=true;
        
        
    NSString *creditCard = [[NSUserDefaults standardUserDefaults] stringForKey:@"creditCardKey"];
    _cardNum.text = creditCard;
    NSString *billAddress1 = [[NSUserDefaults standardUserDefaults] stringForKey:@"add1Key"];
    _billAdd1.text = billAddress1;
    NSString *billAddress2 = [[NSUserDefaults standardUserDefaults] stringForKey:@"add2Key"];
    _billAdd2.text = billAddress2;
    NSString *cityUser = [[NSUserDefaults standardUserDefaults] stringForKey:@"cityKey"];
    _creditCity.text = cityUser;
    NSString *stateuser = [[NSUserDefaults standardUserDefaults] stringForKey:@"stateKey"];
    _creditState.text = stateuser;
    NSString *zipuser = [[NSUserDefaults standardUserDefaults] stringForKey:@"zipKey"];
    _creditZip.text = zipuser;
    NSString *monthuser = [[NSUserDefaults standardUserDefaults] stringForKey:@"monthKey"];
    _creditExpMonth.text = monthuser;
    NSString *yearuser = [[NSUserDefaults standardUserDefaults] stringForKey:@"yearKey"];
    _creditExpYear.text = yearuser;
    NSString *cvvuser = [[NSUserDefaults standardUserDefaults] stringForKey:@"cvvKey"];
    _creditCvv.text = cvvuser;
        
    }
    else{
        _debitBtn.selected=true;
        _masterBtn.selected=true;
        checkFlag = @"D";
        checkCard= @"M";
    }
}

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
   

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) handleTapFrom: (UITapGestureRecognizer *)recognizer
{
    [self.view endEditing:YES];
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (IBAction)done:(UIButton *)sender {
    if([self validate])
 {
     [[NSUserDefaults standardUserDefaults] setObject:_cardNum.text forKey:@"creditCardKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_cardNum.text forKey:@"creditCardKey"];
     
     [[NSUserDefaults standardUserDefaults] setObject:_cardNum.text forKey:@"creditCardKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_billAdd1.text forKey:@"add1Key"];
     [[NSUserDefaults standardUserDefaults] setObject:_billAdd2.text forKey:@"add2Key"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditCity.text forKey:@"cityKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditState.text forKey:@"stateKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditZip.text forKey:@"zipKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditExpMonth.text forKey:@"monthKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditExpYear.text forKey:@"yearKey"];
     [[NSUserDefaults standardUserDefaults] setObject:_creditCvv.text forKey:@"cvvKey"];
     [[NSUserDefaults standardUserDefaults] setObject:@"2" forKey:@"checkValueKey"];
     [[NSUserDefaults standardUserDefaults] setObject:checkFlag forKey:@"cardTypeKey"];
     [[NSUserDefaults standardUserDefaults] setObject:checkCard forKey:@"cardProviderKey"];
     
     STPCardParams *stripCard=[[STPCardParams alloc] init];
        stripCard.number = _cardNum.text;
        stripCard.cvc= _creditCvv.text;
        NSUInteger year = [[self.creditExpYear text] integerValue];
        NSUInteger month = [[self.creditExpMonth text] integerValue];
        stripCard.expYear = year;
        stripCard.expMonth= month;

    [[STPAPIClient sharedClient] createTokenWithCard:stripCard
                                          completion:^(STPToken *token, NSError *error) {
                                              
//                                              if (error) {
//                                                  //[self.delegate paymentViewController:self didFinish:error];
//                                              }
                                              //  [self.backendCharger createBackendChargeWithToken:token
                                              //     completion:^(STPBackendChargeResult result, NSError *error) {
                                              //        if (error) {
                                              //           [self.delegate paymentViewController:self didFinish:error];
                                              //          return;
                                              //       }
                                              //          [self.delegate paymentViewController:self didFinish:nil];
                                              //        }];
                                              if (error) {
                                                  //                                           [self handleError:error];
                                                  NSLog(@"ERRRRR = %@",error);
                                                  UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Please try again"
                                                                                                   message:[NSString stringWithFormat:@"%@",error.localizedDescription]
                                                                                                  delegate:nil
                                                                                         cancelButtonTitle:@"OK"
                                                                                         otherButtonTitles:nil];
                                                  [alert show];
                                              }
                                              else
                                              {
                                              [[NSUserDefaults standardUserDefaults] setObject:token.tokenId forKey:@"stptoken"];
                                              [[NSUserDefaults standardUserDefaults] synchronize];
                                                  [self dismissViewControllerAnimated:YES completion:nil];
                                              }
                                          }];
    }
   
}

-(BOOL)validate
{
    
    
    if([_cardNum.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Credit Card Number"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
           // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self.cardNum becomeFirstResponder];
        return false;
    }
    else if([_billAdd1.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Billing Address1"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.cardNum becomeFirstResponder];
        return false;
    }
    else if([_billAdd2.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Billing Address2"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.billAdd2 becomeFirstResponder];
        return false;
    }
    else if([_creditCity.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter City"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditCity becomeFirstResponder];
        return false;
    }
    else if([_creditState.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter State"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditState becomeFirstResponder];
        return false;
    }
    else if([_creditZip.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Zip"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditZip becomeFirstResponder];
        return false;
    }
    else if([_creditExpMonth.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Month"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditZip becomeFirstResponder];
        return false;
    }
    else if([_creditExpYear.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter Year"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditExpYear becomeFirstResponder];
        return false;
    }
    else if([_creditCvv.text  isEqual: @""])
    {
        UIAlertController *alertController = [UIAlertController  alertControllerWithTitle:@""  message:@"Enter CVV"  preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            // [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        [self.creditCvv becomeFirstResponder];
        return false;
    }
    else
    {
        return true;
    }
}
- (IBAction)logSelectedButton:(DLRadioButton *)radioButton {
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
        }
    } else {
        if ([radioButton.selectedButton.titleLabel.text isEqual: @"Debit"])
            checkFlag = @"D";

         else
             checkFlag = @"C";
        //NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
        NSLog(@"%@ is selected", checkFlag);
    }
    }


- (IBAction)secondlogSelectedButton:(DLRadioButton *)radioButton {
    if (radioButton.isMultipleSelectionEnabled) {
        for (DLRadioButton *button in radioButton.selectedButtons) {
            NSLog(@"%@ is selected.\n", button.titleLabel.text);
           
        }
    } else {
        if ([radioButton.selectedButton.titleLabel.text isEqual: @"Master"])
            checkCard = @"M";
        
        else if ([radioButton.selectedButton.titleLabel.text isEqual: @"Visa"])
            checkCard = @"V";
        else
            checkCard = @"A";
        //NSLog(@"%@ is selected.\n", radioButton.selectedButton.titleLabel.text);
        NSLog(@"%@ is selected", checkCard);

    }
}
@end
