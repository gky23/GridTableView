//
//  NearUsersGridTableViewController.m
//  NewTableView
//
//  Created by mario on 13-3-20.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "NearUserListStyleTableView.h"
#import "NearUsersGridStyleTableView.h"
#import "NearUsersTableViewCell.h"
#import "NearUsersTopView.h"


#define GridCount 3
#define TableViewGridStyle 2001
#define TableViewListStyle 2002

@interface NearUsersGridStyleTableView ()

@end

@implementation NearUsersGridStyleTableView
@synthesize cellArray;
- (id)init
{
    self = [super init];
    if (self) {
        dataArray =[NSMutableArray new];
        self.cellArray =[NSMutableArray new];
    }
    return self;
}

- (void)dealloc
{
    [dataArray release];
    [self.cellArray release];
    [super dealloc];
}


- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.frame=CGRectMake(0, 44, 320, 460-44) ;
   
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
    //    return 80;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.cellArray count]+2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"NearUsersCellIdentifier";
    
    //    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell"owner:self options:nil];
    
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(!cell){
        cell =[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
        
        
        //       cell= [[[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell" owner:self options:nil] lastObject];
    }
    
    //    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    
    switch (indexPath.row) {
        case 0:
        {
            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTopView"owner:self options:nil];
            UIView * backupSearchView = [[nibView objectAtIndex:0] retain];
            
            [cell.contentView addSubview:backupSearchView];
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
            int newIndexRow =indexPath.row-2;
            NSArray *readyArray =[self.cellArray objectAtIndex:newIndexRow];
            
            for (int i=0; i<[readyArray count]; i++) {
                UIButton * button =[[UIButton alloc] init];
                button.frame=CGRectMake(5+5*i+100*i, 5, 100, 100);
                
                NSURL * url =[NSURL URLWithString:@"http://www.sucai.com/pic/201262/2012621122561.jpg"];
                NSData* data = [NSData dataWithContentsOfURL:url];
                [button setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
                button.accessibilityValue=@"id1";
                [cell.contentView addSubview:button ];
                
                UIView *topView =[[UIView alloc] initWithFrame:CGRectMake(5+5*i+100*i, 85, 100, 20)];
                topView.backgroundColor=[UIColor blackColor];
                topView.alpha=0.5;
                
                UITextField *textField =[[UITextField alloc] initWithFrame:CGRectMake(55, 0, 80, 20)];
                
                textField.font=[UIFont systemFontOfSize:13];
                textField.text=@"1800米";
                textField.textColor=[UIColor whiteColor];
                [topView addSubview:textField];
                [textField release];
                
                [cell.contentView addSubview:topView];
                [topView release];
                [button release];
            }
        }
            break;
    }
    
    
    
    return cell;
    
}





@end
