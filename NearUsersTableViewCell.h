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
    UIImageView *headImage;
    UILabel *titleLabel;
    UILabel *ageLabel;
    UILabel *distanceLabel;
    UILabel *onlineStatus;
    UILabel *bottomLabel;
    
    NSMutableArray *dataCellArray;
}
@property(nonatomic,retain)IBOutlet  UIImageView *headImage;
@property(nonatomic,retain)IBOutlet  UILabel *titleLabel;
@property(nonatomic,retain)IBOutlet  UILabel *ageLabel;
@property(nonatomic,retain)IBOutlet  UILabel *distanceLabel;
@property(nonatomic,retain)IBOutlet  UILabel *onlineStatus;
@property(nonatomic,retain)IBOutlet  UILabel *bottomLabel;


@property(nonatomic,retain)NSMutableArray *dataCellArray;


@end
