//
//  NearUsersTableViewCell.h
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearUsersTableViewCell : UITableViewCell
{
    UIButton *image1;
    UIButton *image2;
    UIButton *image3;
    UIButton *image4;
    
    NSMutableArray *dataCellArray;
}
@property(nonatomic,retain)IBOutlet  UIButton *image1;
@property(nonatomic,retain)IBOutlet  UIButton *image2;
@property(nonatomic,retain)IBOutlet  UIButton *image3;
@property(nonatomic,retain)IBOutlet  UIButton *image4;

@property(nonatomic,retain)NSMutableArray *dataCellArray;


@end
