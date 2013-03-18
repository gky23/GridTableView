//
//  ViewController.m
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "ViewController.h"
#import "NearUsersTableViewCell.h"




#define   GridCount 3

@implementation ViewController

- (id)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


-(void)initData{
    imageDataArray =[[NSMutableArray alloc] init];
    
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
//    [imageDataArray addObject:@"http://www.sucai.com/pic/201291/2012911621481.jpg"];

     cellArray =[NSMutableArray array];
    
    [self handleData];
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

                    
//                    NSString *type =@"";
//                    if ([type hasPrefix:@"推送"]) {
//                        
//                    }
//                    else if( [type isEqualToString:@"消息"]){
//                    
//                    }

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
    
    for (int a=0;a<[cellArray count]; a++) {
        NSLog(@"array %d ,content: %@",a,[[cellArray objectAtIndex:a] description]);
    }

}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    
    gkyTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    gkyTableView.delegate=self;
    gkyTableView.dataSource=self;
    [self.view addSubview:gkyTableView];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 105;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [cellArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    int row = indexPath.row;
    static NSString *identifier = @"NearUsersCellIdentifier";
    
//    NearUsersTableViewCell *cell = (NearUsersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
//    if (cell == nil) {
//        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell"
//                                                     owner:nil options:nil];
//        for (id oneObject in nib) {
//            if ([oneObject isKindOfClass:[NearUsersTableViewCell class]]) {
//                cell = (NearUsersTableViewCell *)oneObject;
//                break;
//            }
//        }
//    }
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell==nil){
        cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier] autorelease];
    }
    
  
    NSArray *readyArray =[cellArray objectAtIndex:indexPath.row];
    
    for (int i=0; i<[readyArray count]; i++) {
        UIButton * button =[[UIButton alloc] init];
        button.frame=CGRectMake(5+5*i+100*i, 5, 100, 100);
        
        NSURL * url =[[NSURL alloc] initWithString:@"http://www.sucai.com/pic/201262/2012621122561.jpg"];
        NSData* data = [[NSData alloc] initWithContentsOfURL:url];
        [button setBackgroundImage:[UIImage imageWithData:data] forState:UIControlStateNormal];
//        [button setBackgroundImage:[UIImage imageNamed:@"2.jpg"] forState:UIControlStateNormal];
        [cell.contentView addSubview:button ];
        [data release];
        [url release];
        [button release];
    }
    
    return cell;

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)dealloc
{
    [imageDataArray release];
    [gkyTableView release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
