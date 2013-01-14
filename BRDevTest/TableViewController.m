//
//  TableViewController.m
//  BRDevTest
//
//  Created by Ravi Alla on 1/11/13.
//  Copyright (c) 2013 Ravi Alla. All rights reserved.
//

#import "TableViewController.h"
#import "JSONFetcher.h"
#import "CustomCell.h"
#import "StoreDetailViewController.h"

@interface TableViewController ()

@property (nonatomic,strong) NSArray *arrayOfStoreDicts;

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrayOfStoreDicts = [JSONFetcher getJSONArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

/*- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSInteger numberOfRows = [self.arrayOfStoreDicts count];
    return numberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"store cell";
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomCell" bundle:nil] forCellReuseIdentifier:CellIdentifier];
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

    }
    NSString *address = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row] objectForKey:@"address"];
    cell.address.text = address;
    NSString *phone = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row] objectForKey:@"phone"];
    cell.phoneNumber.text=phone;
    NSString *logoURLString = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"storeLogoURL"];
    __block NSString *storeID = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row] objectForKey:@"storeID"];
    dispatch_queue_t downloadQueue = dispatch_queue_create("store logo download", NULL);
    dispatch_async(downloadQueue, ^{
        NSURL *logoURL = [NSURL URLWithString:logoURLString];
        NSData *logoData = [NSData dataWithContentsOfURL:logoURL];
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *currentStoreID = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row] objectForKey:@"storeID"];
            if ([currentStoreID isEqualToString:storeID]) cell.logo.image =[UIImage imageWithData:logoData];
        });
    });
    dispatch_release(downloadQueue);
    // Configure the cell...
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 180;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    StoreDetailViewController *viewController = [[StoreDetailViewController alloc] initWithNibName:@"StoreDetailViewController" bundle:nil];
    UINavigationController *navVC = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    [self presentViewController:navVC animated:YES completion:NULL];
    NSString *logoURLString = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"storeLogoURL"];
    NSURL *logoURL = [NSURL URLWithString:logoURLString];
    NSData *logoData = [NSData dataWithContentsOfURL:logoURL];
    UIImage *storeLogo = [UIImage imageWithData:logoData];
    viewController.storeLogo.image = storeLogo;
    
    NSString *storeName = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"name"];
    NSString *storeAddress = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"address"];
    NSString *storeCity = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"city"];
    NSString *storeState = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"state"];
    NSString *storeZip = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"zipcode"];
    NSString *storeID = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"storeID"];
    NSString *storePhone = [[self.arrayOfStoreDicts objectAtIndex:indexPath.row]objectForKey:@"phone"];
    
    viewController.storeName_ID.text = [NSString stringWithFormat:@"%@, Store ID-%@",storeName,storeID];
    viewController.storeAddressLine1.text=[NSString stringWithFormat:@"%@",storeAddress];
    viewController.storeAddressLine2.text=[NSString stringWithFormat:@"%@,%@-%@",storeCity,storeState,storeZip];
    viewController.storePhone.text = [NSString stringWithFormat:@"Phone#:%@",storePhone];
     [viewController release];
    [navVC release];
    
}

@end
