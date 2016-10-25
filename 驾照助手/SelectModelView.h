//
//  SelectModelView.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/23.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    testModel,
    lookingModel,
}SelectModel;
typedef void (^SelectTouch)(SelectModel model);
@interface SelectModelView : UIView
@property(nonatomic,assign)SelectModel model;
-(SelectModelView *)initWithFrame:(CGRect)frame addTouch:(SelectTouch)touch;
@end
