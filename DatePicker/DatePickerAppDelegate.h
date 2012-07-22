//
//  DatePickerAppDelegate.h
//  DatePicker
//
//  Created by NYU User on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;

@interface DatePickerAppDelegate: UIResponder <UIApplicationDelegate> {
	View *view;
	UIWindow *_window;
}


@property (strong, nonatomic) UIWindow *window;
@end
