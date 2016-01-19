//
//  ViewController.h
//  InteractiveMap
//
//  Created by Ramya Patil on 10/28/15.
//  Copyright © 2015 Ramya Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <UIScrollViewDelegate, CLLocationManagerDelegate> {
    CLLocationManager *manager;
};


@property (strong,nonatomic) CLLocationManager *manager;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

