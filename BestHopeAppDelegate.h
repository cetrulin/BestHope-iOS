//
//  BestHopeAppDelegate.h
//  BestHope
//
//  Created by Andrés León Suárez Cetrulo on 06/04/11.
//  Copyright 2011 uc3m. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BestHopeAppDelegate : NSObject <UIApplicationDelegate, UINavigationControllerDelegate  > {
    UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

