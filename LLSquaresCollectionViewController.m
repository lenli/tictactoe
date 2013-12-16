//
//  LLSquaresCollectionViewController.m
//  TicTacToe
//
//  Created by Len on 12/15/13.
//  Copyright (c) 2013 LL inc. All rights reserved.
//

#import "LLSquaresCollectionViewController.h"
#import "LLSquareCollectionViewCell.h"

@interface LLSquaresCollectionViewController ()

@end

@implementation LLSquaresCollectionViewController
-(NSMutableArray *)squares
{
    if (!_squares) _squares = [[NSMutableArray alloc] init];
    return _squares;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupBoard];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    LLSquareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *player = self.squares[indexPath.row];
    [cell updateSquareBackground:player];
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.squares[indexPath.row] isEqual:@""]) {
        [self.squares replaceObjectAtIndex:indexPath.row withObject:self.playerTurn];
        [self checkGameStatus];
        [self togglePlayerTurn];
        [self.collectionView reloadData];
    }
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
    } else if (kind == UICollectionElementKindSectionFooter) {
        return [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
    } else return reusableView;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.squares count]; // 9
}

#pragma mark - Helper Methods
-(void)togglePlayerTurn
{
    if ([self.playerTurn isEqual: @"X"]) {
        self.playerTurn = @"O";
    } else {
        self.playerTurn = @"X";
    }
}
-(BOOL)isGameOver
{
    NSArray *winCombinations = [[NSArray alloc] initWithObjects:    @[@1,@2,@3], @[@4,@5,@6], @[@7,@8,@9],
                                                                    @[@1,@4,@7], @[@2,@5,@8], @[@3,@6,@9],
                                                                    @[@1,@5,@9], @[@3,@5,@7], nil];
    for (NSArray *winCombination in winCombinations) {
        BOOL isWinner = TRUE;
        for (NSNumber *winIndex in winCombination) {
            NSInteger winIndexInteger = [winIndex integerValue]-1;
            if (self.squares[winIndexInteger] != self.playerTurn) {
                isWinner = FALSE;
            }
        }
        if (isWinner == TRUE) return TRUE;
    }
    return FALSE;
}
-(void)checkGameStatus
{
    if (self.isGameOver) {
        NSString *messageText = [[NSString alloc] initWithFormat:@"Player %@ won.", self.playerTurn];
        UIAlertView *gameOver = [[UIAlertView alloc] initWithTitle:@"Game Over" message:messageText delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"New Game", nil];
        [gameOver setAlertViewStyle:UIAlertViewStyleDefault];
        [gameOver show];
    } 
}
-(void)setupBoard
{
    self.playerTurn = @"X";
    NSArray *initialBoard = [[NSArray alloc] initWithObjects:@"", @"", @"", @"", @"", @"", @"", @"", @"", nil];
    self.squares = [initialBoard mutableCopy];
    [self.collectionView reloadData];
}

#pragma mark - UIAlertViewDelegate
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self setupBoard];
    }
}
- (IBAction)newGameButtonPressed:(UIButton *)sender {
    [self setupBoard];
}
@end
