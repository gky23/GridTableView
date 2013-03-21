//
//  NearUsersTableViewCell.m
//  NewTableView
//
//  Created by mario on 13-3-15.
//  Copyright (c) 2013年 mario. All rights reserved.
//

#import "NearUsersTableViewCell.h"

@interface NearUsersTableViewCell ()

@end

@implementation NearUsersTableViewCell
//@synthesize image1,image2,image3;
//@synthesize dataCellArray;

@synthesize headImage;
@synthesize titleLabel;
@synthesize ageLabel;
@synthesize distanceLabel;
@synthesize onlineStatus;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}




@end
