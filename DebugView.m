//
//  DebugView.m
//  ViewAnimationTest
//
//  Created by Cheng-Ho Chen on 10/20/11.
//  Copyright 2011 NUS. All rights reserved.
//

#import "DebugView.h"

@implementation DebugView

@synthesize label_DebugInfo;
@synthesize Slider_WebbingCount;


@synthesize Slider_Color_Alphs;        

@synthesize Slider_Color_R;    
@synthesize Slider_Color_G;        
@synthesize Slider_Color_B;            
@synthesize m_bFlag;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        int i =1;
        
        int nLeft = self.frame.origin.x;
        int nTop  = self.frame.origin.y;        
        
        int nWidth = self.frame.size.width;
        int nHeight= self.frame.size.height;
        
        int nPadding = 30;

        ShowViewBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        ShowViewBtn.frame = CGRectMake(nLeft, nTop*i, nWidth/2, 25);
        [ShowViewBtn setTitle:@"Swithc On/Off" forState:UIControlStateNormal];
        
        [ShowViewBtn addTarget:self action:@selector(ShowViewButtonPressed)forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:ShowViewBtn];        
        
        
        i+=1;
        label_DebugInfo = [[UILabel alloc]init ];
        label_DebugInfo.frame  = CGRectMake(nLeft, nTop+nPadding*i, nWidth, 25);
        label_DebugInfo.text = @"info";
        label_DebugInfo.textAlignment = UITextAlignmentLeft;
        [self addSubview:label_DebugInfo];                
        
        
        i+=1;        
        Slider_Stroke = [[ UISlider alloc]init ];
        Slider_Stroke.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_Stroke.minimumValue=1;
        Slider_Stroke.maximumValue=20;        
        Slider_Stroke.continuous = YES;
        Slider_Stroke.value=1; 
        
        [Slider_Stroke addTarget:self action:@selector(Slider_StrokeAction) forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_Stroke];             

        
//        Slider_Color_R;    
//        Slider_Color_G;        
//        Slider_Color_B;            
//        
//        Slider_WebbingCount;
//        

        i+=1;                
        Slider_WebbingCount = [[ UISlider alloc]init ];
        Slider_WebbingCount.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_WebbingCount.minimumValue=0;
        Slider_WebbingCount.maximumValue=20;        
        Slider_WebbingCount.continuous = YES;
        Slider_WebbingCount.value=1; 
        [Slider_WebbingCount addTarget:self action:@selector(Slider_WebbingCount_Action) forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_WebbingCount];     
        
        
        
        
        i+=1;                
        Slider_Color_Alphs = [[ UISlider alloc]init ];
        Slider_Color_Alphs.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_Color_Alphs.minimumValue=0;
        Slider_Color_Alphs.maximumValue=1;        
        Slider_Color_Alphs.continuous = YES;
        Slider_Color_Alphs.value=0.5; 
        [Slider_Color_Alphs addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_Color_Alphs];     
        
        

        i+=1;                
        Slider_Color_R = [[ UISlider alloc]init ];
        Slider_Color_R.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_Color_R.minimumValue=0;
        Slider_Color_R.maximumValue=1;        
        Slider_Color_R.continuous = YES;
        Slider_Color_R.value=0.5; 
        [Slider_Color_R addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_Color_R];     
        

        i+=1;                
        Slider_Color_G = [[ UISlider alloc]init ];
        Slider_Color_G.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_Color_G.minimumValue=0;
        Slider_Color_G.maximumValue=1;        
        Slider_Color_G.continuous = YES;
        Slider_Color_G.value=0.5; 
        [Slider_Color_G addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_Color_G];     
        

        i+=1;                
        Slider_Color_B = [[ UISlider alloc]init ];
        Slider_Color_B.frame = CGRectMake(nLeft, nTop+nPadding*i, nWidth/2, 25);
        Slider_Color_B.minimumValue=0;
        Slider_Color_B.maximumValue=1;        
        Slider_Color_B.continuous = YES;
        Slider_Color_B.value=0.5; 
        [Slider_Color_B addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
        [self addSubview:Slider_Color_B];     
        
        
        
        
        
        m_bFlag = false;
        
        
        
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //[super drawRect:rect];
    
    // Drawing code
    CGRect bounds = [self bounds];
    //    [[UIColor lightGrayColor] set];
    [[[UIColor alloc] initWithRed:102.0 / 255 green:192.0 / 255 blue:192.0 / 255 alpha:1.0] set];    
    UIRectFill (bounds);
        
}








- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesBegan");
    
    
	if ([touches count] != 1)
		return;
	
	mSwipeStartX = [[touches anyObject] locationInView:self].x;
	mSwipeStartY = [[touches anyObject] locationInView:self].y;    
    
 
    
}




- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    // offsetX
	CGFloat swipeDistanceX = [[touches anyObject] locationInView:self].x - mSwipeStartX;    

	CGFloat swipeDistanceY = [[touches anyObject] locationInView:self].y - mSwipeStartY;    
    
     
    //CGFloat x = [[touches anyObject] locationInView:self].x;
    //self.frame.origin.x= x;
 	CGSize contentSize = self.frame.size;


	self.frame = CGRectMake( self.frame.origin.x +swipeDistanceX, self.frame.origin.y+swipeDistanceY, contentSize.width, contentSize.height);    
}





// Button Event

-(void)ShowViewButtonPressed
{
    NSLog(@"ShowViewButtonPressed");
    
    m_bFlag=!m_bFlag;
    
}



-(void)Slider_StrokeAction
{
    label_DebugInfo.text = [NSString stringWithFormat:@"%.0f",    Slider_Stroke.value];
//    Slider_Stroke.value;    

}


-(void)Slider_WebbingCount_Action
{
    label_DebugInfo.text = [NSString stringWithFormat:@"%.0f",    Slider_Stroke.value];
    //    Slider_Stroke.value;    
    
}









@end
