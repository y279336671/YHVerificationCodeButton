//
//  YHVerificationCodeButton.m
//  YHVerificationCodeButton
//
//  Created by 杨贺 on 15-3-31.
//  Copyright (c) 2015年 goodo. All rights reserved.
//

#import "YHVerificationCodeButton.h"

@interface YHVerificationCodeButton()
@property (strong,nonatomic) UILabel  *text;
@property (strong,nonatomic) UIButton *button;
@end

@implementation YHVerificationCodeButton

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _normalColor=[UIColor colorWithRed:0.126 green:0.609 blue:1.000 alpha:1.000];
        _pressedColor=[UIColor colorWithWhite:0.667 alpha:1.000];
        
         _button=[UIButton buttonWithType:UIButtonTypeCustom];
        [_button setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_button setBackgroundColor:_normalColor];
        [_button addTarget:self action:@selector(fetchCode:) forControlEvents:UIControlEventTouchUpInside];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_button.titleLabel setTextAlignment:NSTextAlignmentCenter];
        [self addSubview:_button];
    }
    return self;
}

-(void)setNormalColor:(UIColor *)newNormalColor
{
    if (_normalColor!=newNormalColor) {
        _normalColor=newNormalColor;
        [_button setBackgroundColor:newNormalColor];
    }
}

-(void)fetchCode:(id)sender
{
    [self updateTime];
}

-(void)updateTime
{
    __block int timeout=_timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timerGDC = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timerGDC,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timerGDC, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timerGDC);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                //绿色
                _button.userInteractionEnabled=YES;
                _button.backgroundColor=_normalColor;
                _button.titleLabel.text=@"获取验证码";
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                _button.userInteractionEnabled=NO;
                _button.titleLabel.text=[NSString stringWithFormat:@"%ds后获取",timeout];
                _button.backgroundColor=_pressedColor;
                
            });
            timeout--;
        }  
    });  
    dispatch_resume(_timerGDC);
}
@end
