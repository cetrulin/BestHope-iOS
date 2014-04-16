//
//  Ruta.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "Ruta.h"
#import "FijarRuta.h"
#import "CSRouteView.h"
#import "CSMapRouteLayerView.h"
#import "CSRouteAnnotation.h"

#define METERS_PER_MILE 1609.344

@implementation Ruta

@synthesize coordinate;
@synthesize mapas = _mapas;
@synthesize ruta = _ruta;

-(IBAction)ViewFijarRuta:(id)sender{
	FijarRuta *varFijarRuta = [[FijarRuta alloc] initWithNibName:@"FijarRuta" bundle:nil];
	[[self navigationController] pushViewController:varFijarRuta animated:YES];
	[FijarRuta release];
}


- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 42.33677;
    zoomLocation.longitude = -71.126046;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 1*METERS_PER_MILE, 1*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapas regionThatFits:viewRegion];                
    // 4
    [_mapas setRegion:adjustedRegion animated:YES];
	
}

- (void)_mapas:(MKMapView *)mapas annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	NSLog (@"I've been taped. Show some details.");
}

+ (void) initialize { 
	if ([self class] == [Ruta class]) { 
		// Once-only initializion 
	} 
	// Initialization for this class and any subclasses 
} 

- (MKAnnotationView *)mapView:(MKMapView *)mapas viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKAnnotationView* annotationView = nil;
	
	if([annotation isKindOfClass:[CSRouteAnnotation class]]){
		CSRouteAnnotation* routeAnnotation = (CSRouteAnnotation*) annotation;		
		annotationView = [_ruta objectForKey:routeAnnotation.routeID];
		
		if(nil == annotationView){
			CSRouteView* routeView = [[[CSRouteView alloc] initWithFrame:CGRectMake(0, 0, _mapas.frame.size.width, _mapas.frame.size.height)] autorelease];
			routeView.annotation = routeAnnotation;
			routeView.mapView = _mapas;
			[_ruta setObject:routeView forKey:routeAnnotation.routeID];			
			annotationView = routeView;
		}
		
	}return annotationView;
}

- (void)mapView:(MKMapView *)mapas regionWillChangeAnimated:(BOOL)animated
{
	// turn off the view of the route as the map is chaning regions. This prevents
	// the line from being displayed at an incorrect positoin on the map during the
	// transition. 
	for(NSObject* key in [_ruta allKeys]){
		CSRouteView* routeView = [_ruta objectForKey:key];
		routeView.hidden = YES;
	}	
}
- (void)mapView:(MKMapView *)mapas regionDidChangeAnimated:(BOOL)animated
{
	// re-enable and re-poosition the route display. 
	for(NSObject* key in [_ruta allKeys])
	{
		CSRouteView* routeView = [_ruta objectForKey:key];
		routeView.hidden = NO;
		[routeView regionChanged];
	}
	
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    [super viewDidLoad];
	
	// dictionary to keep track of route views that get generated. 
	_ruta = [[NSMutableDictionary alloc] init];
	
	// load the points from our local resource
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"route" ofType:@"csv"];
	NSString  *fileContents = [NSString stringWithContentsOfFile:filePath];
	NSArray *pointStrings = [fileContents componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];	
	NSMutableArray* points = [[NSMutableArray alloc] initWithCapacity:pointStrings.count];
	
	for(int idx = 0; idx < pointStrings.count; idx++){
		
		// break the string down even further to latitude and longitude fields. 
		NSString* currentPointString = [pointStrings objectAtIndex:idx];
		NSArray* latLonArr = [currentPointString componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
		
		CLLocationDegrees latitude  = [[latLonArr objectAtIndex:0] doubleValue];
		CLLocationDegrees longitude = [[latLonArr objectAtIndex:1] doubleValue];
		
		_currentLocation = [[[CLLocation alloc] initWithLatitude:latitude longitude:longitude] autorelease];
		
		[points addObject:_currentLocation];
	}
	
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Fijar Ruta" style:UIBarButtonItemStylePlain target:self action:@selector(ViewFijarRuta:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
	
	//
	// Create our map view and add it as as subview. 
	//
	_mapas = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[self.view addSubview:_mapas];
	[_mapas setDelegate:self];
	
	CSRouteAnnotation* routeAnnotation = [[[CSRouteAnnotation alloc] initWithPoints:points] autorelease];
	[_mapas addAnnotation:routeAnnotation];
		
	[anotherButton release];
	[routeAnnotation release];	
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
	[_mapas release];
	[_ruta release];
}


@end

