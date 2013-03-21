//
//  ViewController.m
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "ViewController.h"
#import "NearUsersTableViewCell.h"
#import "NearUsersTopView.h"
#import "NearUsersGridStyleTableView.h"
#import "NearUserListStyleTableView.h"



#define   GridCount 3
#define TableViewGridStyle 2001
#define TableViewListStyle 2002

@implementation ViewController
@synthesize switchButton,contentView;

- (id)init
{
    self = [super init];
    if (self) {
     
        

    }
    return self;
}


-(void)initData{
    isGrid =YES;

    imageDataArray =[NSMutableArray arrayWithCapacity:11];
    cellArray =[NSMutableArray array];
    
    
    [imageDataArray addObject:@"http://t3.baidu.com/it/u=143905235,3926919405&fm=23&gp=0.jpg"];
    [imageDataArray addObject:@"http://t2.baidu.com/it/u=1911623958,276989452&fm=23&gp=0.jpg"];
    [imageDataArray addObject:@"http://t3.baidu.com/it/u=693636636,1194117260&fm=23&gp=0.jpg"];
    [imageDataArray addObject:@"http://t3.baidu.com/it/u=1123444132,2711369266&fm=23&gp=0.jpg"];
    [imageDataArray addObject:@"http://t2.baidu.com/it/u=490433274,4016618579&fm=23&gp=0.jpg"];
    [imageDataArray addObject:@"http://img4.qzone.cc/one/Q/62/111350.jpg"];
    [imageDataArray addObject:@"http://img4.qzone.cc/one/Q/62/561285.jpg"];
    [imageDataArray addObject:@"http://t10.baidu.com/it/u=75512433,4266632180&fm=59"];
    [imageDataArray addObject:@"http://t10.baidu.com/it/u=4230965145,4102532603&fm=59"];
    [imageDataArray addObject:@"http://t10.baidu.com/it/u=865484007,281730044&fm=59"];
    [imageDataArray addObject:@"http://www.sucai.com/pic/201262/2012621122561.jpg"];
    [imageDataArray addObject:@"http://www.sucai.com/pic/201291/2012911621481.jpg"];

    
   }

-(void)handleData{
    int dataCount =[imageDataArray count];
    
    if (dataCount>GridCount) {
        
        int cellTotal =dataCount/GridCount;
        
        int mo =dataCount%GridCount;
        
        NSLog(@"cellArray count :%d",[cellArray count]);
        NSLog(@"求模 %d",mo);
        
        if (mo>0) {        //不能被整除
            //如果不能被整除，则会多出一组数据，需要多循环一次添加到数组里
            for (int i=0; i<cellTotal+1; i++) {
                
                if (i==cellTotal) {//未被整除剩余的部分单独处理
                    NSMutableArray *tempArray =[[NSMutableArray alloc] init];
                    for (int y=0; y<mo; y++) {
                        [tempArray addObject:[imageDataArray objectAtIndex:y]];
                    }
                    [cellArray addObject:[tempArray retain]];
                    [tempArray release];
                }
                else{
                    NSMutableArray *tempArray =[[NSMutableArray alloc] init];
                    [tempArray addObject:[imageDataArray objectAtIndex:0]];
                    [tempArray addObject:[imageDataArray objectAtIndex:1]];
                    [tempArray addObject:[imageDataArray objectAtIndex:2]];
//                    [tempArray addObject:[imageDataArray objectAtIndex:3]];
                    
                    [cellArray addObject:[tempArray retain]];
                    [tempArray release];

                    for (int y=0; y<GridCount; y++) {
                        [imageDataArray removeObjectAtIndex:0];
                    }



                }
               
            }
            
        }
        else{
            //能被整除
            for (int i=0; i<cellTotal; i++) {
                NSMutableArray *tempArray =[[NSMutableArray alloc] init];
                [tempArray addObject:[imageDataArray objectAtIndex:0]];
                [tempArray addObject:[imageDataArray objectAtIndex:1]];
                [tempArray addObject:[imageDataArray objectAtIndex:2]];
//                [tempArray addObject:[imageDataArray objectAtIndex:3]];
                
                [cellArray addObject:[tempArray retain]];
                [tempArray release];
                
                for (int y=0; y<GridCount; y++) {
                    [imageDataArray removeObjectAtIndex:0];
                }
                               
            }
            
        }
        
    }
    
//    for (int a=0;a<[cellArray count]; a++) {
//        NSLog(@"array %d ,content: %@",a,[[cellArray objectAtIndex:a] description]);
//    }

}




- (void)viewDidLoad
{
    [super viewDidLoad];
       
    [self initData];


    NearUserListStyleTableView *list =[[NearUserListStyleTableView alloc] init];
//    list.dataArray = [imageDataArray retain];
    [list.cellArray addObjectsFromArray:imageDataArray];
    
    NearUsersGridStyleTableView* grid =[[NearUsersGridStyleTableView alloc] init];
    [self handleData];
    [grid.cellArray addObjectsFromArray:cellArray];
    [grid.tableView reloadData];
    
    [self addChildViewController:grid];
    [self addChildViewController:list];
    
//    currentViewController =[UIViewController new];
  
    [contentView addSubview:grid.view];
    currentViewController =[self.childViewControllers objectAtIndex:0];

//    [grid release];
//    [list release];
	// Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)switchTableVIew:(id)sender{
    
  
    
    UIViewController *oldViewController= currentViewController;
    NearUserListStyleTableView *listStyle =[self.childViewControllers objectAtIndex:1];
    NearUsersGridStyleTableView *gridStyle =[self.childViewControllers objectAtIndex:0];

//    if (isGrid) {
        if (transiting) {
            return;
        }
        transiting = YES;
    
    if (isGrid) {
        [self transitionFromViewController:currentViewController toViewController:listStyle duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
        } completion:^(BOOL finished) {
            currentViewController =listStyle;
            transiting = NO;
            isGrid=NO;
        }];

    }
    else{
        [self transitionFromViewController:currentViewController toViewController:gridStyle duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            
        } completion:^(BOOL finished) {
            currentViewController =gridStyle;
            transiting = NO;
            isGrid=YES;
        }];

    }
      
//    }
    
//    else{
//        if (transiting) {
//            return;
//        }
//        transiting = YES;
//        [self transitionFromViewController:currentViewController toViewController:gridStyle duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
//            
//        } completion:^(BOOL finished) {
//            currentViewController =gridStyle;
//            transiting = NO;
//            isGrid=YES;
//        }];
//
//    }
//    
 
    
//    if (isGrid) {
//        
//        [self transitionFromViewController:currentViewController toViewController:listStyle duration:4 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
//            
//        }  completion:^(BOOL finished) {
//            transiting = NO;
//
//            if (finished) {
//                
//                currentViewController=listStyle;
////                isGrid =NO;
//
//            }else{
//                currentViewController=oldViewController;
//
//            }
//        }];
//        
//    }
//    else{
//        
//        UIViewController *oldViewController= currentViewController;
//        [self transitionFromViewController:currentViewController toViewController:gridStyle duration:2 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
//            
//        }  completion:^(BOOL finished) {
//            transiting = NO;
//
//            if (finished) {
//
//                currentViewController=gridStyle;
////                isGrid=YES;
//            }else{
//                currentViewController=oldViewController;
//            }
//        }];
//
//        
//    }
    
//    isGrid=!isGrid;
    
    
    
    
    
    
}

//-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row==0) {
//        return 100;
//    }
//    if (indexPath.row==1) {
//        return 40;
//    }
//    return 105;
////    return 80;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return [cellArray count]+2;
//}
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    static NSString *identifier = @"NearUsersCellIdentifier";
//    
////    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell"owner:self options:nil];
//    
//    
//    NearUsersTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
//    if(!cell){
//        cell =[[[NearUsersTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
//        
//        
////       cell= [[[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell" owner:self options:nil] lastObject];
//    }
//    
////    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
//    
//    
//    switch (indexPath.row) {
//        case 0:
//        {
//            NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"NearUsersTopView"owner:self options:nil];
//            UIView * backupSearchView = [[nibView objectAtIndex:0] retain];
//            
//            [cell.contentView addSubview:backupSearchView];
//        }
//            break;
//            
//            case 1:
//        {
//            cell.textLabel.text=@"对附近的人说点什么吧";
//            cell.textLabel.font=[UIFont systemFontOfSize:13];
//            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
//        }
//            break;
//            
//        default:
//        {
//            int newIndexRow =indexPath.row-2;
//            NSArray *readyArray =[cellArray objectAtIndex:newIndexRow];
//            
//            for (int i=0; i<[readyArray count]; i++) {
//                UIButton * button =[[UIButton alloc] init];
//                button.frame=CGRectMake(5+5*i+100*i, 5, 100, 100);
//                
//                NSURL * url =[NSURL URLWithString:@"http://www.sucai.com/pic/201262/2012621122561.jpg"];
//                NSData* data = [NSData dataWithContentsOfURL:url];
//                [button setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
//                button.accessibilityValue=@"id1";
//                [cell.contentView addSubview:button ];
//                
//                UIView *topView =[[UIView alloc] initWithFrame:CGRectMake(5+5*i+100*i, 85, 100, 20)];
//                topView.backgroundColor=[UIColor blackColor];
//                topView.alpha=0.5;
//                
//                UITextField *textField =[[UITextField alloc] initWithFrame:CGRectMake(55, 0, 80, 20)];
//                
//                textField.font=[UIFont systemFontOfSize:13];
//                textField.text=@"1800米";
//                textField.textColor=[UIColor whiteColor];
//                [topView addSubview:textField];
//                [textField release];
//                
//                [cell.contentView addSubview:topView];
//                [topView release];                
//                [button release];
//            }
//        }
//            break;
//    }
//  
//   
//    
//    return cell;
//
//}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [imageDataArray release];
//    [gkyTableView release];
    [super dealloc];
}



@end
