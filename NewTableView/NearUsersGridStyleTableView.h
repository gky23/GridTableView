//
//  NearUsersGridTableViewController.h
//  NewTableView
//
//  Created by mario on 13-3-20.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearUsersGridStyleTableView : UITableViewController
{
    NSMutableArray  *dataArray;
    NSMutableArray  *cellArray;
}
@property (nonatomic,retain)NSMutableArray*cellArray;
@end
