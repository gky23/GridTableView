//
//  ViewController.m
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "ViewController.h"
#import "NearUsersTableViewCell.h"

@interface ViewController ()

@end

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
    [imageDataArray addObject:@"http://www.sucai.com/pic/201291/2012911621481.jpg"];

     cellArray =[NSMutableArray array];
    int dataCount =[imageDataArray count];
    
    if (dataCount>4) {
        
        int cellTotal =dataCount/4;
               
        if (dataCount%4>0) {        //不能被整除

            
        }
        else{
        //能被整除
            for (int i=0; i<cellTotal; i++) {
                NSMutableArray *tempArray =[NSMutableArray array];
                [tempArray addObject:[imageDataArray objectAtIndex:0]];
                [tempArray addObject:[imageDataArray objectAtIndex:1]];
                [tempArray addObject:[imageDataArray objectAtIndex:2]];
                [tempArray addObject:[imageDataArray objectAtIndex:3]];
                
                [cellArray addObject:tempArray];
                
                [tempArray removeAllObjects];
                
                for (int y=0; y<4; y++) {
                      [imageDataArray removeObjectAtIndex:0];
                }
              


            }

            
        }
        
    }
    
    NSLog(@"cellArray count :%d",[cellArray count]);
    
    NSLog(@"求模 %d",dataCount %4);
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    
    gkyTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 460) style:UITableViewStylePlain];
    gkyTableView.delegate=self;
    gkyTableView.dataSource=self;
    [self.view addSubview:gkyTableView];
    
//    [self handleData];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75+4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    int row = indexPath.row;
    static NSString *identifier = @"NearUsersCellIdentifier";
    
    NearUsersTableViewCell *cell = (NearUsersTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"NearUsersTableViewCell"
                                                     owner:nil options:nil];
        for (id oneObject in nib) {
            if ([oneObject isKindOfClass:[NearUsersTableViewCell class]]) {
                cell = (NearUsersTableViewCell *)oneObject;
                break;
            }
        }
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
