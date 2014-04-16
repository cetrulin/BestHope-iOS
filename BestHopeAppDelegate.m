//
//  BestHopeAppDelegate.m
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 06/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import "BestHopeAppDelegate.h"

@implementation BestHopeAppDelegate

@synthesize window, navigationController;

- (void)applicationDidFinishLaunching:(UIApplication *) application{    
	[window addSubview:navigationController.view];
	// Override point for customization after application launch.    
    [window makeKeyAndVisible];
}

- (void)dealloc {
	[navigationController release];
    [window release];
    [super dealloc];
}

@end
