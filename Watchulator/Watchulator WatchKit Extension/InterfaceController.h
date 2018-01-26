//
//  InterfaceController.h
//  Watchulator WatchKit Extension
//
//  Created by Jake Moore on 12/18/17.
//  Copyright © 2017 Jake Moore. All rights reserved.
//

#import <WatchKit/WatchKit.h>
#import <Foundation/Foundation.h>

@interface InterfaceController : WKInterfaceController

@property (strong, nonatomic) IBOutlet WKInterfaceLabel *mathOutput;
@end
