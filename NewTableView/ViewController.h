//
//  ViewController.h
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *gkyTableView;
    NSMutableArray *imageDataArray;
}
@end
