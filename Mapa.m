//
//  Mapa.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "Mapa.h"
#import "Ruta.h"
#import "CSMapAnnotation.h"
#import "CSImageAnnotationView.h"
#import "CSRouteView.h"
#import "CSMapRouteLayerView.h"
#import "CSRouteAnnotation.h"
#import "CSWebDetailsViewController.h"

@implementation Mapa

@synthesize coordinate;
@synthesize mapas = _mapas;
@synthesize ruta = _ruta;

-(IBAction)ViewRuta:(id)sender{
	Ruta *varRuta = [[Ruta alloc] initWithNibName:@"Ruta" bundle:nil];
	[[self navigationController] pushViewController:varRuta animated:YES];
	[Ruta release];
}

- (void)viewWillAppear:(BOOL)animated {
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.332207327375315;
    zoomLocation.longitude = -3.7645044922828674;
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.095*METERS_PER_MILE, 0.095*METERS_PER_MILE);
    // 3
    MKCoordinateRegion adjustedRegion = [_mapas regionThatFits:viewRegion];                
    // 4
    [_mapas setRegion:adjustedRegion animated:YES];
	[_mapas setMapType:MKMapTypeHybrid]; 
}

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

- (void)_mapas:(MKMapView *)mapas annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
	NSLog (@"I've been taped. Show some details.");
}

+ (void) initialize { 
	if ([self class] == [Mapa class]) { 
		// Once-only initializion 
	} 
	// Initialization for this class and any subclasses 
} 

- (MKAnnotationView *)mapView:(MKMapView *)mapas viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKAnnotationView* annotationView = nil;
	
	if([annotation isKindOfClass:[CSMapAnnotation class]]){
		// determine the type of annotation, and produce the correct type of annotation view for it.
		CSMapAnnotation* csAnnotation = (CSMapAnnotation*)annotation;
		if(csAnnotation.annotationType == CSMapAnnotationTypeStart || csAnnotation.annotationType == CSMapAnnotationTypeEnd){
			NSString* identifier = @"Pin";
			MKPinAnnotationView* pin = (MKPinAnnotationView*)[self.mapas dequeueReusableAnnotationViewWithIdentifier:identifier];
			
			if(nil == pin){
				pin = [[[MKPinAnnotationView alloc] initWithAnnotation:csAnnotation reuseIdentifier:identifier] autorelease];
			
			}[pin setPinColor:(csAnnotation.annotationType == CSMapAnnotationTypeEnd) ? MKPinAnnotationColorRed : MKPinAnnotationColorGreen];
			
			annotationView = pin;
		
		}else if(csAnnotation.annotationType == CSMapAnnotationTypeImage){
			NSString* identifier = @"Image";
			CSImageAnnotationView* imageAnnotationView = (CSImageAnnotationView*)[self.mapas dequeueReusableAnnotationViewWithIdentifier:identifier];
			
			if(nil == imageAnnotationView){
				imageAnnotationView = [[[CSImageAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];	
				imageAnnotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
			
			}annotationView = imageAnnotationView;
		}
		
		[annotationView setEnabled:YES];
		[annotationView setCanShowCallout:YES];
	}
	
	else if([annotation isKindOfClass:[CSRouteAnnotation class]]){
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

- (void)mapView:(MKMapView *)mapas annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
	NSLog(@"calloutAccessoryControlTapped");	
	CSImageAnnotationView* imageAnnotationView = (CSImageAnnotationView*) view;
	CSMapAnnotation* annotation = (CSMapAnnotation*)[imageAnnotationView annotation];
	
	if(annotation.url != nil){
//		if(nil == _detailsVC)	
//			_detailsVC = [[CSWebDetailsViewController alloc] initWithNibName:@"CSWebDetailsViewController" bundle:nil];
//		
//		_detailsVC.url = annotation.url;
//		[self.view addSubview:_detailsVC.view];
	}
}

-(void) showWebViewForURL:(NSURL*) url
{
//	CSWebDetailsViewController* webViewController = [[CSWebDetailsViewController alloc] initWithNibName:@"CSWebDetailsViewController" bundle:nil];
//	[webViewController setUrl:url];
//	
//	[self presentModalViewController:webViewController animated:YES];
//	//[webViewController autorelease];
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
	
	UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Ver Ruta" style:UIBarButtonItemStylePlain target:self action:@selector(ViewRuta:)];          
	self.navigationItem.rightBarButtonItem = anotherButton;
		
	coordinate.latitude = 40.332483757372315;
    coordinate.longitude = -3.7673043922828655;
	CLLocationCoordinate2D newCoord = {coordinate.latitude, coordinate.longitude};
	
	coordinate.latitude = 40.332483757372315;
    coordinate.longitude = -3.7653043922828655;
	CLLocationCoordinate2D newCoord2 = {coordinate.latitude, coordinate.longitude};
	
	coordinate.latitude = 40.331633757372315;
    coordinate.longitude = -3.7673043922828655;
	CLLocationCoordinate2D newCoord3 = {coordinate.latitude, coordinate.longitude};
	
	
	//mapas.showsUserLocation=TRUE;	
    coordinate.latitude = 40.332207327375315;
    coordinate.longitude = -3.7645044922828674;
	CLLocationCoordinate2D userL = {coordinate.latitude, coordinate.longitude};

	//
	// Create our map view and add it as as subview. 
	//
	_mapas = [[MKMapView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	[self.view addSubview:_mapas];
	[_mapas setDelegate:self];
	
	CSRouteAnnotation* routeAnnotation = [[[CSRouteAnnotation alloc] initWithPoints:points] autorelease];
	[_mapas addAnnotation:routeAnnotation];

	
	// CREATE THE ANNOTATIONS AND ADD THEM TO THE MAP
	
	// create the image annotation
	CSMapAnnotation* annotation0 = [[[CSMapAnnotation alloc] initWithCoordinate:newCoord
											   annotationType:CSMapAnnotationTypeImage
														title:@"Incendio"] autorelease];
	[annotation0 setUserData:@"fire_icon.png"];
	//[annotation0 setUrl:[NSURL URLWithString:@""]];	
	[_mapas addAnnotation:annotation0];		
	
	// create the image annotation
	CSMapAnnotation* annotation1 = [[[CSMapAnnotation alloc] initWithCoordinate:newCoord3
											   annotationType:CSMapAnnotationTypeImage
														title:@"Accidente"] autorelease];
	[annotation1 setUserData:@"accident.png"];
	//	[annotation1 setUrl:[NSURL URLWithString:@""]];	
	[_mapas addAnnotation:annotation1];
	
	// create the image annotation
	CSMapAnnotation* annotation2 = [[[CSMapAnnotation alloc] initWithCoordinate:newCoord2
											   annotationType:CSMapAnnotationTypeImage
														title:@"Salud"] autorelease];
	[annotation2 setUserData:@"hearth.png"];
	//	[annotation2 setUrl:[NSURL URLWithString:@""]];	
	[_mapas addAnnotation:annotation2];
	
	// create the image annotation
	CSMapAnnotation* annotation3 = [[[CSMapAnnotation alloc] initWithCoordinate:userL
											   annotationType:CSMapAnnotationTypeStart
														title:@"Usted está aquí"] autorelease];
	//	[annotation3 setUrl:[NSURL URLWithString:@""]];	
	[_mapas addAnnotation:annotation3];
		
	[anotherButton release];

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
