//
//  Mapa.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "CSWebDetailsViewController.h";

#define METERS_PER_MILE 1609.344

//@class CSWebDetailsViewController;

@interface Mapa : UIViewController <MKMapViewDelegate>{
//	BOOL _doneInitialZoom;
	
	// the map view. 
	IBOutlet MKMapView *_mapas;
	
	// dictionary of route views indexed by annotation
	NSMutableDictionary *_ruta;	
	CLLocation *_currentLocation;
	
	// details view controller
	CSWebDetailsViewController* _detailsVC; 

}

@property(nonatomic,readwrite)CLLocationCoordinate2D coordinate;  

@property(nonatomic,retain)MKMapView *mapas;

@property(nonatomic,retain)NSMutableDictionary *ruta;


- (void)showWebViewForURL:(NSURL*) url;

- (void)_mapas:(MKMapView *)mapas annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

-(IBAction)ViewRuta:(id)sender;


@end
