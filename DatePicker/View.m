//
//  View.m
//  DatePicker
//
//  Created by NYU User on 11/17/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "View.h"

@implementation View

- (void) valueChanged
{
	//textView.text = @"Anita says: %@", [dateFormatter stringFromDate: datePicker.date];
    
    NSString *s = [dateFormatter stringFromDate: datePicker.date];
	//textView.text =(@"Anita says %@.", s);
    
    textView.text=[NSString stringWithFormat:@"Anita says the date is: %@", s];
    
    NSDate *date = datePicker.date;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEEE MMMM d, YYYY"];
    NSString *dateString = [dateFormat stringFromDate:date];  
    
    
    
    [button setTitle: dateString forState: UIControlStateNormal];
    
}

- (id) initWithFrame: (CGRect) frame
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle: NSDateFormatterFullStyle];
		[dateFormatter setTimeStyle: NSDateFormatterFullStyle];

		//Let the date picker assume its natural size.
		datePicker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		datePicker.datePickerMode = UIDatePickerModeDate; //vs. UIDatePickerModeTime

		//Center the picker in the DatePickerView.
		CGRect b = self.bounds;

		datePicker.frame = CGRectMake(
			b.origin.x,
			b.origin.y,
			datePicker.bounds.size.width,
			datePicker.bounds.size.height
		);

		[datePicker addTarget: self
			action: @selector(valueChanged)
			forControlEvents: UIControlEventValueChanged
		];

		[self addSubview: datePicker];

		//TextView occupies all of the View below the picker.

		CGRect f = CGRectMake(
			b.origin.x,
			b.origin.y + datePicker.bounds.size.height/2+100,
			b.size.width,
			b.size.height - datePicker.bounds.size.height/2
		);

		textView = [[UITextView alloc] initWithFrame: f];
		textView.editable = NO;
		textView.font = [UIFont systemFontOfSize: 22];
        
        
        
        //button
        button = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        
		//Center the button in the view.
		//CGRect b = self.bounds;
		//CGSize s = CGSizeMake(200, 40);	//size of button
        
		button.frame = CGRectMake(b.origin.x,b.origin.y+100 + datePicker.bounds.size.height,300,100);
                                  
                                  
        
		[button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
		[button setTitle: textView.text forState: UIControlStateNormal];
        
		        
		        
        
		[self valueChanged];
		[self addSubview: textView];
        [self addSubview: button];

	}
	return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
	// Drawing code
}
*/


@end
