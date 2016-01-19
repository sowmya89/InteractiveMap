//
//  BuildingDetail.m
//  InteractiveMap
//
//  Created by Library-SCS on 11/5/15.
//  Copyright © 2015 Library-SCS. All rights reserved.
//

#import "BuildingDetail.h"

@interface BuildingDetail ()


@end

@implementation BuildingDetail

@synthesize buildingName, address, distTime, imageBuild, buildValue, addressValue, distAndTime, imageName;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [buildingName setText:buildValue];
    [address setText:addressValue];
    [self.imageBuild setImage:[UIImage imageNamed:imageName]];
    [distTime setText:distAndTime];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end