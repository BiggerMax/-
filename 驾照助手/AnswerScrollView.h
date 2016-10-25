//
//  AnswerScrollView.h
//  驾照助手
//
//  Created by 袁杰 on 16/10/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerScrollView : UIView
{
    @public
     UIScrollView *_scrollView;
}
-(instancetype)initWithFrame:(CGRect)frame withDataArray:(NSArray *)array;
@property(nonatomic,assign,readonly)int currentPage;
@property(nonatomic,strong)NSMutableArray *hadAnswerArray;
@property(nonatomic,strong)NSArray *dataArray;
@end
