//
//  FISComputerPlayer.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISComputerPlayer.h"

@interface FISComputerPlayer()

//@property (nonatomic, strong) NSMutableArray *lastPosition;

@end

@implementation FISComputerPlayer

+(BOOL)isEnabled
{
    return YES;
}

-(FISTicTacToePosition)nextPlay
//minmax minimax alg.
{
    NSUInteger randomRow;
    NSUInteger randomCol;
    do {
        randomRow = arc4random_uniform(3);
        randomCol = arc4random_uniform(3);
    }
        while (![self.game canPlayAtColumn:randomCol row:randomRow]);
    
    return FISTicTacToePositionMake(randomCol, randomRow);
    
    
    
    
//    NSArray *hardCodedAvailableLocations = @[@[self.game.board[0][0]], @[self.game.board[1][0]], @[self.game.board[2][0]], @[self.game.board[0][1]], @[self.game.board[1][1]], @[self.game.board[2][1]], @[self.game.board[0][2]], @[self.game.board[1][2]], @[self.game.board[2][2]]];
//    for (NSUInteger i = 0; i < self.game.board.count; i++) {
//        for (NSUInteger j = 0; j < self.game.board.count; j++) {
//            if ([self.game canPlayAtColumn:j row:i]) {
//                NSUInteger row = i;
//                NSUInteger col = j;
//                
//                return FISTicTacToePositionMake(col, row);
//
//            }
//            else { j = 0;
//                   i = 0;
//        }
//    }
//}

    
    
}
    
@end
/*    NSUInteger i = 0;
 NSUInteger j = 0;
 while ( i < 3 && j < 3) {
 if ([self.game canPlayAtColumn:j row:i]) {
 NSUInteger row = i;
 NSUInteger col = j;
 
 return FISTicTacToePositionMake(row, col);
 
 }
 else { j++;
 i++;
 */

