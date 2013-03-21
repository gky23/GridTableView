//
//  NearUserListStyleViewController.m
//  NewTableView
//
//  Created by mario on 13-3-21.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "NearUserListStyleTableView.h"
#import "NearUsersTableViewCell.h"

@interface NearUserListStyleTableView ()

@end

@implementation NearUserListStyleTableView
@synthesize cellArray;

- (id)init
{
    self = [super init];
    if (self) {
        self.cellArray =[NSMutableArray array];

    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.frame=CGRectMake(0, 44, 320, 460-44);
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 100;
    }
    if (indexPath.row==1) {
        return 40;
    }
    return 105;
 
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cellArray count]+2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"NearUsersListStyleCellIdentifier";
    
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell =[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        
        
        //       cell= [[[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell" owner:self options:nil] lastObject];
    }

    switch (indexPath.row) {
        case 0:
        {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTopView"owner:self options:nil];
            UIView * topView = [[nibView objectAtIndex:0] retain];
            [cell.contentView addSubview:topView];
        }
            break;
            
        case 1:
        {
            cell.textLabel.text=@"对附近的人说点什么吧";
            cell.textLabel.font=[UIFont systemFontOfSize:13];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
            break;
            
        default:
        {
//            cell.textLabel.text=@"others";
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell"owner:self options:nil];
            NearUsersTableViewCell * NearUsersTableViewCell = [[nibView objectAtIndex:0] retain];
            cell =NearUsersTableViewCell;
        }
            break;
    }
    
    return cell;
    
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
