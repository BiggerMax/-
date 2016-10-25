//
//  SheetView.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SheetViewDelegate
-(void)SheetViewClick:(int)index;
@end
@interface SheetView : UIView{
    @public
    UIView *_backView;
}
@property(nonatomic,weak)id<SheetViewDelegate>delegate;
- (instancetype)initWithFrame:(CGRect)frame withSuperView:(UIView *)superView andQuestionCount:(int)count;
@end
