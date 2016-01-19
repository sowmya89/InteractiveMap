//
//  BuildingDetail.h
//  InteractiveMap
//
//  Created by Library-SCS on 11/5/15.
//  Copyright © 2015 Library-SCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BuildingDetail : UIViewController
{
    NSString *buildValue;
    NSString *addressValue;
    NSString *distAndTime;
    NSString *imageName;
    
}

@property (nonatomic) NSString *buildValue;
@property (nonatomic) NSString *addressValue;
@property (nonatomic) NSString *distAndTime;
@property (nonatomic) NSString *imageName;

@property (weak, nonatomic) IBOutlet UILabel *buildingName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *distTime;
@property (weak, nonatomic) IBOutlet UIImageView *imageBuild;

@end