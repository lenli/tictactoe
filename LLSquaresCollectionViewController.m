//
//  LLSquaresCollectionViewController.m
//  TicTacToe
//
//  Created by Len on 12/15/13.
//  Copyright (c) 2013 LL inc. All rights reserved.
//

#import "LLSquaresCollectionViewController.h"

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
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSArray *test = [[NSArray alloc] initWithObjects:@"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", @"X", nil];
    self.squares = [test mutableCopy];
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
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSString *player = self.squares[indexPath.row];
    
    cell.backgroundColor = [UIColor redColor];
//    cell.imageView.image = [UIImage imageNamed:@"tictactoe-X.png"];
    
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.squares count]; // 9
}

#pragma mark - Helper Methods
-(UIImage *)getSquareBackground:(NSString *)player
{
    if ([player isEqual: @"X"]) {
        return [UIImage imageNamed:@"tictactoe-X.png"];
    } else if ([player isEqual: @"O"]) {
        return [UIImage imageNamed:@"tictactoe-O.png"];
    } else {
        return [UIImage imageNamed:@"tictactoe-blank.png"];
    }
    NSLog(@"getSquareBackground");
    
}

@end
