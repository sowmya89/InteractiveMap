//
//  ViewController.m
//  InteractiveMap
//
//  Created by Ramya Patil on 10/28/15.
//  Copyright © 2015 Ramya Patil. All rights reserved.
//

#import "ViewController.h"
#import "MapObject.h"
#import "BuildingDetail.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize manager;

static const NSString* API_KEY = @"AIzaSyDCUOjt01MQGGwcHWz7AIdqVFSqvdyg29A";
static NSString* GOOGLE_API_URL = @"https://maps.googleapis.com/maps/api/distancematrix/json?origins=%f,%f&destinations=%f,%f&key=%@&mode=walking";
NSString *message;
float olatitude;
float olongitude;
float dlatitude;
float dlongitude;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.imageView setImage:[UIImage imageNamed:@"campusmap.png"]];
    
    [self.scrollView setMaximumZoomScale:100.0f];
    [self.scrollView setDelegate:self];
    [self.scrollView setClipsToBounds:YES];
    self.scrollView.contentSize=self.imageView.frame.size;
    self.scrollView.frame = self.imageView.frame;
    [self.scrollView addSubview:self.imageView];
    
    UIButton *kingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [kingBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [kingBtn setTag:0];
    kingBtn.frame = CGRectMake(32, 269, 65, 79);
    [self.imageView addSubview:kingBtn];
    self.imageView.userInteractionEnabled = YES;
    
    UIButton *engBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [engBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [engBtn setTag:1];
    engBtn.frame = CGRectMake(264, 123, 111, 93);
    [self.imageView addSubview:engBtn];
    self.imageView.userInteractionEnabled = YES;
    
    UIButton *bbcBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [bbcBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [bbcBtn setTag:2];
    bbcBtn.frame = CGRectMake(515, 173, 60, 53);
    [self.imageView addSubview:bbcBtn];
    self.imageView.userInteractionEnabled = YES;
    
    UIButton *yuhBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [yuhBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [yuhBtn setTag:3];
    yuhBtn.frame = CGRectMake(136, 457, 67, 68);
    [self.imageView addSubview:yuhBtn];
    self.imageView.userInteractionEnabled = YES;
    
    UIButton *suBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [suBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [suBtn setTag:4];
    suBtn.frame = CGRectMake(309, 218, 110, 40);
    [self.imageView addSubview:suBtn];
    self.imageView.userInteractionEnabled = YES;
    
    UIButton *spgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [spgBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//    [spgBtn setBackgroundColor: [UIColor redColor]];
    [spgBtn setTag:5];
    spgBtn.frame = CGRectMake(339, 508, 120, 90);
    [self.imageView addSubview:spgBtn];
    self.imageView.userInteractionEnabled = YES;
    
     
    self.manager = [[CLLocationManager alloc] init];
    self.manager.delegate = self;
    self.manager.desiredAccuracy = kCLLocationAccuracyBest;
     
    if([[[UIDevice currentDevice]systemVersion] floatValue] >= 8.0){
        [self.manager requestAlwaysAuthorization];
    }
    
    
   [self.manager startUpdatingLocation];
   
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
     NSLog(@"Error: %@", error);
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    olatitude = newLocation.coordinate.latitude;;
    olongitude = newLocation.coordinate.longitude;
    
     NSLog(@"Latitude: %f", olatitude);
     NSLog(@"Longitude: %f", olongitude);
    int imageWidth = self.imageView.bounds.size.width;
    int imageHeight = self.imageView.bounds.size.height;
     float x = imageWidth * (fabs(olongitude) -121.886478)/(121.876243 -121.886478);
     float y = imageHeight - (imageHeight * (fabs(olatitude)-37.331361)/(37.338800-37.331361));
    
    UIImageView *icon;
    icon = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, 20, 20)];
    UIImage *image;
    image=[UIImage imageNamed:@"red-dot.png"];
    [icon setImage:image];
    [self.imageView addSubview:icon];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)btnClick:(UIButton*)sender {
    
    [self performSegueWithIdentifier:@"buildingDetailIdentifier" sender:sender];
    //    [self getLocation];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSString *searchText = searchBar.text;
    
    if([searchText caseInsensitiveCompare:@"King Library"] == NSOrderedSame) {
        [self.scrollView zoomToRect:CGRectMake(69, 251, 0, 123) animated:YES];
    }
    else if([searchText caseInsensitiveCompare:@"Engineering Building"] == NSOrderedSame) {
        [self.scrollView zoomToRect:CGRectMake(318, 100, 0, 159) animated:YES];
    }
    else if([searchText caseInsensitiveCompare:@"Yoshihiro Uchida Hall"] == NSOrderedSame) {
        [self.scrollView zoomToRect:CGRectMake(169, 437, 0, 110) animated:YES];
    }
    else if([searchText caseInsensitiveCompare:@"Student Union"] == NSOrderedSame) {
        [self.scrollView zoomToRect:CGRectMake(318, 239, 96, 0) animated:YES];
    }
    else if([searchText caseInsensitiveCompare:@"South Parking Garage"] == NSOrderedSame) {
         [self.scrollView zoomToRect:CGRectMake(323, 569, 139, 0) animated:YES];
    }
    else if([searchText caseInsensitiveCompare:@"BBC"] == NSOrderedSame) {
        [self.scrollView zoomToRect:CGRectMake(518, 202, 65, 10) animated:YES];
    }
    else {
         UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error: Invalid Building Name"
                                                                        message:@"Kindly enter a valid building name."
                                                                 preferredStyle:UIAlertControllerStyleAlert];
         
         UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                               handler:^(UIAlertAction * action) {}];
         
         [alert addAction:defaultAction];
         [self presentViewController:alert animated:YES completion:nil];
    }
}

-(MapObject *) getResultFromLocation:(double)olatitude :(double) olongitude :(double) dlatitude :(double) dlongitude
{
    NSString *url = [NSString stringWithFormat:GOOGLE_API_URL,
                     olatitude,
                     olongitude,
                     dlatitude, dlongitude, API_KEY];
    
    NSURL *googleRequestURL=[NSURL URLWithString:url];
    MapObject *result = [[MapObject alloc] init];
    NSData* data = [NSData dataWithContentsOfURL: googleRequestURL];
    [self performSelectorOnMainThread:@selector(fetchedData:)
                           withObject:@[data,result]
                        waitUntilDone:YES];
    return result;
}

-(void)fetchedData:(NSArray *)array {
    //parse out the json data
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:[array objectAtIndex:0]
                          
                          options:kNilOptions
                          error:&error];
    
    NSMutableString * distance = json[@"rows"][0][@"elements"][0][@"distance"][@"text"];
    NSMutableString * duration = json[@"rows"][0][@"elements"][0][@"duration"][@"text"];
    
    MapObject *result = [array objectAtIndex:1];
    result.time = duration;
    result.distance = distance;
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"buildingDetailIdentifier"]) {
        
        // Get destination view
        BuildingDetail *vc = [segue destinationViewController];
        
        // Get button tag
        NSInteger tagIndex = [(UIButton *)sender tag];
        
        // Set the selected button in the new view
        //[vc setSelectedButton:tagIndex];
        if (tagIndex ==0)
        {
            NSString *address = @"Dr.+Martin+Luther+King,+Jr.+Library,+150+East+San+Fernando+Street,+San+Jose,+CA+95112";
            
            [vc setBuildValue:@"Dr. Martin Luther King, Jr. Library"];
            [vc setAddressValue:@"150 East San Fernando Street, San Jose, CA 95112"];
            [vc setImageName:@"King Library.jpg"];
            dlatitude = 37.3358071;
            dlongitude = -121.8865599;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];
            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];
            //     NSLog(@"MESSAGE: %@", message);
            
            //   [vc.imageBuild setImage:[UIImage imageNamed:@"King Library.jpg"]];
        }
        if (tagIndex ==1)
        {
            NSString *address = @"San+Jose+State+University+Charles+W.+Davidson+College+of+Engineering,+1+Washington+Square,+San+Jose,+CA+95112";
            [vc setBuildValue:@"San José State University Charles W. Davidson College of Engineering"];
            [vc setAddressValue:@"1 Washington Square, San Jose, CA 95112"];
            [vc setImageName:@"EnggBuilding.jpg"];
            dlatitude = 37.3365666;
            dlongitude = -121.881843;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];
            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];
        }
        if (tagIndex ==2)
        {
            NSString *address = @"Boccardo+Business+Complex,+San+Jose,+CA+95112";
            [vc setBuildValue:@"Boccardo Business Complex"];
            [vc setAddressValue:@"Boccardo Business Complex, San Jose, CA 95112"];
            [vc setImageName:@"BBC.jpg"];
            dlatitude = 37.3366;
            dlongitude = -121.8756652;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];
        }
        if (tagIndex ==3)
        {
            NSString *address = @"Yoshihiro+Uchida+Hall,+San+Jose,+CA+95112";
            [vc setBuildValue:@"Yoshihiro Uchida Hall"];
            [vc setAddressValue:@"Yoshihiro Uchida Hall, San Jose, CA 95112"];
            [vc setImageName:@"YUH.jpg"];
            dlatitude = 37.33377;
            dlongitude = -121.8855823;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];
        }
        if (tagIndex ==4)
        {
            NSString *address = @"Student+Union+Building,+San+Jose,+CA+95112";
            [vc setBuildValue:@"Student Union Building"];
            [vc setAddressValue:@"Student Union Building, San Jose, CA 95112"];
            [vc setImageName:@"StudentUnion.jpg"];
            dlatitude = 37.3367305;
            dlongitude = -121.8804744;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];        }
        if (tagIndex ==5)
        {
            NSString *address = @"San+Jose+State+University+South+Garage,+330+South+7th+Street,+San+Jose,+CA+95112";
            [vc setBuildValue:@"San Jose State University South Garage"];
            [vc setAddressValue:@"San Jose State University South Garage, 330 South 7th Street, San Jose, CA 95112"];
            [vc setImageName:@"south garage.jpg"];
            dlatitude = 37.3335099;
            dlongitude = -121.8807696;
            MapObject *res = [self getResultFromLocation:olatitude :olongitude :dlatitude :dlongitude];            message = [NSString stringWithFormat:@"Distance: %@, Time: %@",
                       res.distance,
                       res.time];
            [vc setDistAndTime:message];        }
    }
}

@end
