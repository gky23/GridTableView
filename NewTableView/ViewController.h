//
//  ViewController.h
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
//    UITableView *gkyTableView;
    NSMutableArray *imageDataArray;
    NSMutableArray * cellArray;
    
    UIButton * switchButton;
    
    BOOL  isGrid;
    
    UIViewController *currentViewController;
    
  IBOutlet  UIView *contentView;
    
    BOOL transiting;

}

@property(nonatomic,retain)IBOutlet     UIView *contentView;

@property(nonatomic,retain)IBOutlet   UIButton * switchButton;

-(IBAction)switchTableVIew:(id)sender;
@end
