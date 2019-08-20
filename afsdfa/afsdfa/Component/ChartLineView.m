//
//  ChartLineView.m
//  afsdfa
//
//  Created by guohq on 2019/8/7.
//  Copyright © 2019 guohq. All rights reserved.
//
#define CCCHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1]
#define FXHex(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "ChartLineView.h"
#import "ORLineChartView.h"

@interface ChartLineView()<ORLineChartViewDataSource, ORLineChartViewDelegate>

@property (nonatomic, strong) ORLineChartView *lineChartView;
@property (nonatomic, strong) NSArray         *sourceData;

@property (nonatomic, strong) NSArray         *VerticalArr;




@end

@implementation ChartLineView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        _sourceData = @[@(12), @(2),@(600),@(27.4),@(37),@(22),@(29.7),@(27.4),@(35.8),@(23.5),@(18),@(8),@(5),@(12),@(16.3)];
        _VerticalArr   = @[@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6",@"1",@"2",@"3",@"4",@"5",@"6"];
        
        _lineChartView                         = [[ORLineChartView alloc] initWithFrame:self.frame];
       
        _lineChartView.backgroundColor         = [UIColor blackColor];
        _lineChartView.config.style            = ORLineChartStyleSlider;
        _lineChartView.config.chartLineColor   = FXHex(0x0acfd1);
        _lineChartView.config.showShadowLine   = NO;
        _lineChartView.config.showVerticalBgline   = NO;
        _lineChartView.config.showHorizontalBgline = YES;
        _lineChartView.config.dottedBGLine     = NO;
        _lineChartView.config.gradientColors   = @[CCCHex(0X0acfd1),[UIColor clearColor]];
        _lineChartView.config.topInset         = 0.0f;
        
        _lineChartView.dataSource              = self;
        _lineChartView.delegate                = self;
        [self addSubview:_lineChartView];
  
        [_lineChartView reloadData];
        
        

        
    }
    return self;
}

#pragma mark - ORLineChartViewDataSource
- (NSInteger)numberOfHorizontalDataOfChartView:(ORLineChartView *)chartView {
    return _sourceData.count;
}

- (CGFloat)chartView:(ORLineChartView *)chartView valueForHorizontalAtIndex:(NSInteger)index {
    return [_sourceData[index] doubleValue];
}

- (NSInteger)numberOfVerticalLinesOfChartView:(ORLineChartView *)chartView {
    return 6;
}

- (NSAttributedString *)chartView:(ORLineChartView *)chartView attributedStringForIndicaterAtIndex:(NSInteger)index {
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"value: %g", [_sourceData[index] doubleValue]]];
    return string;
}

- (NSString *)chartView:(ORLineChartView *)chartView titleForHorizontalAtIndex:(NSInteger)index{
    return _VerticalArr[index];
}

- (NSDictionary<NSAttributedStringKey,id> *)labelAttrbutesForVerticalOfChartView:(ORLineChartView *)chartView {
    return @{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (NSDictionary<NSAttributedStringKey,id> *)labelAttrbutesForHorizontalOfChartView:(ORLineChartView *)chartView {
    return @{NSFontAttributeName : [UIFont systemFontOfSize:12], NSForegroundColorAttributeName : [UIColor whiteColor]};
}

#pragma mark - ORLineChartViewDelegate
- (void)chartView:(ORLineChartView *)chartView didSelectValueAtIndex:(NSInteger)index {
//    NSLog(@"did select index %ld and value  is %g", index, [_datas[index] doubleValue]);
}

- (void)chartView:(ORLineChartView *)chartView indicatorDidChangeValueAtIndex:(NSInteger)index {
//    NSLog(@"indicater did change index %ld and value  is %g", index, [_datas[index] doubleValue]);
}

#pragma mark - setter getter
- (void)setSourceS:(NSDictionary *)sourceS{
    _sourceS        = sourceS;
    _VerticalArr    = sourceS[@"vertical"];
    _sourceData     = sourceS[@"sourceData"];
    [_lineChartView reloadData];
    
}


@end
