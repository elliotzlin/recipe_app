//
//  UIImageView_Additions.m
//  FridgeFood
//
//  Created by Elliot on 7/23/15.
//  Copyright (c) 2015 Elliot. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@implementation UIImageView (additions)

-(CGSize)imageScale {
    if (self.image == nil)
        return CGSizeMake(1, 1);
    
    CGFloat sx = self.frame.size.width / self.image.size.width;
    CGFloat sy = self.frame.size.height / self.image.size.height;
    CGFloat s = 1.0;
    switch (self.contentMode) {
        case UIViewContentModeScaleAspectFit:
            s = fminf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleAspectFill:
            s = fmaxf(sx, sy);
            return CGSizeMake(s, s);
            break;
            
        case UIViewContentModeScaleToFill:
            return CGSizeMake(sx, sy);
            
        default:
            return CGSizeMake(s, s);
    }
}

@end