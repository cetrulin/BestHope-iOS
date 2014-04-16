//
//  Ruta.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 11/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Ruta : UIViewController <MKMapViewDelegate>{

	// the map view. 
	IBOutlet MKMapView *_mapas;
	
	// dictionary of route views indexed by annotation
	NSMutableDictionary *_ruta;	
	CLLocation *_currentLocation;
	
}

@property(nonatomic,readwrite)CLLocationCoordinate2D coordinate;  

@property(nonatomic,retain)MKMapView *mapas;

@property(nonatomic,retain)NSMutableDictionary *ruta;


- (void)_mapas:(MKMapView *)mapas annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;

- (IBAction)ViewFijarRuta:(id)sender;


@end
