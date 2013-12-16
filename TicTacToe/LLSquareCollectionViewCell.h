//
//  LLSquareCollectionViewCell.h
//  TicTacToe
//
//  Created by Len on 12/15/13.
//  Copyright (c) 2013 LL inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLSquareCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) NSString *playerName;
-(void)updateSquareBackground:(NSString *)player;

@end
