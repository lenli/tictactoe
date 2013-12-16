//
//  LLSquareCollectionViewCell.m
//  TicTacToe
//
//  Created by Len on 12/15/13.
//  Copyright (c) 2013 LL inc. All rights reserved.
//

#import "LLSquareCollectionViewCell.h"
#define IMAGEVIEW_BORDER_LENGTH 0

@implementation LLSquareCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setup];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectInset(self.bounds, IMAGEVIEW_BORDER_LENGTH, IMAGEVIEW_BORDER_LENGTH)];
    self.imageView.backgroundColor = [UIColor yellowColor];
    [self addSubview:self.imageView];

}


#pragma mark - Helper Methods
-(void)updateSquareBackground:(NSString *)player
{
    if ([player isEqual: @"X"]) {
        self.imageView.image = [UIImage imageNamed:@"tictactoe-X.png"];
    } else if ([player isEqual: @"O"]) {
        self.imageView.image = [UIImage imageNamed:@"tictactoe-O.png"];
    } else {
        self.imageView.image = [UIImage imageNamed:@"tictactoe-blank.png"];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
