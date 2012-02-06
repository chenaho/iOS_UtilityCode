//
//  DebugView.h
//  ViewAnimationTest
//
//  Created by Cheng-Ho Chen on 10/20/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DebugView : UIView
{

    
@public    

    UILabel *label_DebugInfo;
    UIButton *ShowViewBtn;
    
    UISlider *Slider_Stroke;

    UISlider *Slider_Color_Alphs;        
    
    UISlider *Slider_Color_R;    
    UISlider *Slider_Color_G;        
    UISlider *Slider_Color_B;            
    
    
    UISlider *Slider_WebbingCount;
 
    bool m_bFlag;
    
    
	CGFloat mSwipeStartX;    
	CGFloat mSwipeStartY;        

}


@property (nonatomic,retain) UILabel *label_DebugInfo;

@property (nonatomic,retain) UISlider *Slider_Color_Alphs;        

@property (nonatomic,retain) UISlider *Slider_Color_R;    
@property (nonatomic,retain) UISlider *Slider_Color_G;        
@property (nonatomic,retain) UISlider *Slider_Color_B;            


@property (nonatomic,retain) UISlider *Slider_WebbingCount;
@property   bool m_bFlag;
 

// 
@end
