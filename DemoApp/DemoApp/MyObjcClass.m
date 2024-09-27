//
//  MyObjcClass.m
//  DemoApp
//
//  Created by Shridevi Sawant on 27/09/24.
//

#import <Foundation/Foundation.h>
#import "MyObjcClass.h"

#import "DemoApp-Swift.h"

@implementation MyObjcClass



- (NSString *)greeting:(NSString *)name {
     
    MySwiftClass *obj = [[MySwiftClass alloc] init];
    NSString *msg = [obj sayHelloWithName: name];
    
    return [NSString stringWithFormat:@" %@!", msg];
}

@end
