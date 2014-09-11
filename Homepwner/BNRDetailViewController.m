//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Guwanjith Tennekoon on 9/11/14.
//  Copyright (c) 2014 GT. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController ()

    <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *namefield;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation BNRDetailViewController

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    //If the device has a camera, take a picture, otherwise pick from photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    
    //Place image picker on the screen
    [self presentViewController:imagePicker
                       animated:YES
                     completion:NULL];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.namefield.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d",item.valueInDollars];
    
    //NSDateFormatter will turn date into a simple date string
    static NSDateFormatter *dateFormatter;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    //Use a filtered NSDate Object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //Clear first responder
    [self.view endEditing:YES];
    
    //"Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.namefield.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

-(void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_valueField resignFirstResponder];
    [_serialNumberField resignFirstResponder];
    [_namefield resignFirstResponder];
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //Get picked image from info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    //Store the image in the BNRImageStore for this key
    [[BNRImageStore sharedStore] setImage:image
                                   forKey:self.item.itemKey];
    
    //Put that image onto the screen
    self.imageView.image = image;
    
    //Take image picker off the screen - need to dismiss method
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
