//  Created by Monte Hurd on 1/15/14.

#import <UIKit/UIKit.h>
#import "TabularScrollView.h"

@interface UINavigationController (TopActionSheet)

-(void)topActionSheetShowWithViews:(NSArray *)views orientation:(TabularScrollViewOrientation)orientation;

-(void)topActionSheetHide;

-(void)topActionSheetChangeOrientation:(TabularScrollViewOrientation)orientation;

@end
