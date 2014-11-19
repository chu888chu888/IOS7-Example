//  Created by yeeku on 2013-3-16.
//  Copyright (c) 2013年 crazyit.org. All rights reserved.

#import <Foundation/Foundation.h>
#define NO_CHESS "╋"
#define BLACK_CHESS "●"
#define WHITE_CHESS "○"
// 定义棋盘的大小
#define BOARD_SIZE 15

// 定义一个二维数组来充当棋盘
static char * board[BOARD_SIZE][BOARD_SIZE];

void initBoard()
{
	// 把每个元素赋为"╋"，用于在控制台画出棋盘
	for (int i = 0 ; i < BOARD_SIZE ; i++)
	{
		for ( int j = 0 ; j < BOARD_SIZE ; j++)
		{
			board[i][j] = NO_CHESS;
		}
	}
}
// 在控制台输出棋盘的方法
void printBoard()
{
	// 打印每个数组元素
	for (int i = 0 ; i < BOARD_SIZE ; i++)
	{
		for ( int j = 0 ; j < BOARD_SIZE ; j++)
		{
			// 打印数组元素后不换行
			printf("%s " , board[i][j]);
		}
		// 每打印完一行数组元素后输出一个换行符
		printf("\n");
	}
}

int main(int argc , char * argv[]) 
{
	@autoreleasepool{
		
		initBoard();
		printBoard();

		while(YES)
		{
			
			int xPos;
			int yPos;
			printf("请输入您下棋的座标，应以x,y的格式：\n");
			// 获取用户输入的下棋坐标			
			scanf("%d,%d" , &xPos , &yPos);
			//把对应的数组元素赋为黑棋。
			board[xPos - 1][yPos - 1] = BLACK_CHESS;
			// 随机生成两个0～15的整数作为电脑的下棋坐标
			int pcX = arc4random() % BOARD_SIZE;
			int pcY = arc4random() % BOARD_SIZE;
			// 将电脑下棋的坐标赋为白棋
			board[pcX][pcY] = WHITE_CHESS;
										
			/*
			 上面代码还还涉及如下需要改进的地方
				1.用户输入的坐标的有效性，只能是数字，不能超出棋盘范围
				2.如果下的棋的点，不能重复下棋。
				3.每次下棋后，需要扫描谁赢了
			 */
			printBoard();
		}
	}
}
