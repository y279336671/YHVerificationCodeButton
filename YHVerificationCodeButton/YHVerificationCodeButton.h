//
//  YHVerificationCodeButton.h
//  YHVerificationCodeButton
//
//  Created by 杨贺 on 15-3-31.
//  Copyright (c) 2015年 goodo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YHVerificationCodeButtonDelegate<NSObject>
@required
-(void)fetchCode;
@end

@interface YHVerificationCodeButton : UIView
@property(nonatomic,assign)int timeout;
@property(nonatomic,strong)UIColor *normalColor;
@property(nonatomic,strong)UIColor *pressedColor;
@end
