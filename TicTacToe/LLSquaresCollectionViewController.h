//
//  LLSquaresCollectionViewController.h
//  TicTacToe
//
//  Created by Len on 12/15/13.
//  Copyright (c) 2013 LL inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLSquaresCollectionViewController : UICollectionViewController <UIAlertViewDelegate>
@property (strong, nonatomic) NSMutableArray *squares;
@property (strong, nonatomic) NSString *playerTurn;
@property (nonatomic) BOOL gameOver;
- (IBAction)newGameButtonPressed:(UIButton *)sender;

@end
