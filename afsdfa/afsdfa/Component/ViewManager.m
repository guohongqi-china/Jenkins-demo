//
//  ViewManager.m
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//

#import "ViewManager.h"
#import "BubbleView.h"
#import "ChartLineView.h"

@interface ViewManager()
@property (nonatomic, strong)    BubbleView           *bubbleView;
@property (nonatomic, strong)    ChartLineView        *chartLinView;

@property (nonatomic, strong)    NSArray  *lineDataSource;





@end


@implementation ViewManager

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super init]) {
        _parentView = [[UIView alloc] initWithFrame:frame];
        _parentView.backgroundColor = [UIColor blackColor];

    }
    return self;
}

- (void)createViewMaxCells:(NSInteger)count sourceData:(NSArray *)sources{
    BubbleView *view     = [[BubbleView alloc]initWithFrame:CGRectMake(0, 0, _parentView.frame.size.width, _parentView.frame.size.height) MaxLimit:5  Items:sources];
    view.backgroundColor = [UIColor clearColor];
    _bubbleView          = view;
}

- (void)createLineView:(NSArray *)dataSource{
    
    _chartLinView                 = [[ChartLineView alloc]initWithFrame:CGRectMake(0, 0, _parentView.frame.size.width, _parentView.frame.size.height)];
    _chartLinView.backgroundColor = [UIColor clearColor];
    
    _lineDataSource                = dataSource;
    _chartLinView.sourceS          = dataSource.firstObject;
}

- (void)reloadLineDataAtIndex:(NSInteger)index{
    _chartLinView.sourceS          = _lineDataSource[index];
}

- (void)loadView:(SUBVIEW_TYPE)viewType{
    if (viewType == SUBVIEW_AIR) {
        if ([self.parentView.subviews containsObject:_bubbleView]) {
            _bubbleView.hidden = NO;
        }else{
            [_parentView addSubview:_bubbleView];
        }
        _chartLinView.hidden = YES;
    }else{
        if ([self.parentView.subviews containsObject:_chartLinView]) {
            _chartLinView.hidden = NO;
        }else{
            [_parentView addSubview:_chartLinView];
        }
        _bubbleView.hidden = YES;
    }
    
    
}



@end
