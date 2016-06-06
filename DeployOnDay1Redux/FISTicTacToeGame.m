//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

-(instancetype)init
{
    self = [super init];
    if(self) {
        //declaring all of the rows individually to put them into the array.
        //Not sure about declaring as regular Arrays rather than nsmutables. But because compiled to an NSMUTABLE as the board, I think it should be fine.
        
        //use the reset board function because that is exactly what we want, a reset board.
        
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard
{
    NSArray *row1 = @[@"",@"",@""];
    NSArray *row2 = @[@"",@"",@""];
    NSArray *row3 = @[@"",@"",@""];
    
    
     self.board = [[NSMutableArray alloc] initWithArray:@[[row1 mutableCopy], [row2 mutableCopy], [row3 mutableCopy]]];
}


/*is called to determine what player has a piece at the given position. It should return a string representing which player (if any) has a piece at the given position. Valid return values are "X", "O", and "" (the empty string, for a space with no piece)*/

-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row {
    NSString *playerAtColumn = self.board[row][column];
    
    
    
    
//    for (NSUInteger i = 0; i < [self.board count]; i++) {
//        for (NSUInteger j = 0; j < [self.board count]; j++) {
//            
//        }

    return playerAtColumn;
}

-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    NSString *canPlay = self.board[row][column];
    if ([canPlay isEqualToString: @""])
    {
        return YES;
    }
    else {
        return NO;
    }
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if([self canPlayAtColumn:column row:row]){
        self.board[row][column] = @"X";
        
    }
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if ([self canPlayAtColumn:column row:row]) {
        self.board[row][column] = @"O";

    }
}

//Different Win Condition : _________
/*
 
 MAIN DIAGONAL Diagonal which is board[i][i]
 REVERSE DIAGONAL diagonal which is board[i++][j--](inverse values) ... [0][2]:[1][1]:[2][0]
 ROWS any rows are board[0][i] board[1][i] board [2][i]
 COLUMNS any columns are board [i][0]
 
 
 
 
 */
-(NSString *)winningPlayer
{
    
    //ROWS
    for (NSUInteger i = 0; i < [self.board count]; i++) {
        
        if (![self.board[i] containsObject:@""]) {
            
            if ([[self playerAtColumn:0 row:i] isEqualToString:
                 [self playerAtColumn:1 row:i]] &&
                [[self playerAtColumn:1 row:i] isEqualToString:
                 [self playerAtColumn:2 row:i]]) {
                    return [self playerAtColumn:0 row:i];
                }
            }
        }
    //COLUMNS
    for (NSUInteger i = 0; i < [self.board count]; i++) {
        for (NSUInteger j =0; j < [self.board count]; j++) {
            if(![self.board[j][i] isEqualToString: @""]){
            
                
                if ([[self playerAtColumn:i row:0] isEqualToString:
                    [self playerAtColumn:i row:1]] &&
                    [[self playerAtColumn:i row:1] isEqualToString:
                     [self playerAtColumn:i row:2]]){
                           return [self playerAtColumn:i row:0];
                }
            }
        }
    }
    
    //MAIN DIAGONAL
//    for (NSUInteger i = 0; i < [self.board count]; i++) {
        if (![[self playerAtColumn:1 row:1] isEqualToString:@""]) {
            if ([[self playerAtColumn:0 row:0] isEqualToString:
                [self playerAtColumn:1 row:1]] &&
                [[self playerAtColumn:1 row:1] isEqualToString:
                 [self playerAtColumn:2 row:2]]) {
                    return [self playerAtColumn:0 row:0];
            }
        }
    
//SECONDARY DIAGONAL
if (![[self playerAtColumn:1 row:1] isEqualToString:@""]) {
    if ([[self playerAtColumn:0 row:2] isEqualToString:
         [self playerAtColumn:1 row:1]] &&
        [[self playerAtColumn:1 row:1] isEqualToString:
         [self playerAtColumn:2 row:0]]) {
            return [self playerAtColumn:1 row:1];
        }
}
    return @"";
}

-(BOOL)isADraw
{
    for (NSUInteger i = 0; i < [self.board count]; i++) {
        if ([self.board[i] containsObject:@""]) {
            return NO;
        }
        else {
            if ([[self winningPlayer] isEqualToString:@""]) {
                return YES;
            }
        }
    }
    return NO;
}

@end
