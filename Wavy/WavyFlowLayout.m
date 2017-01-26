//
//  WavyFlowLayout.m
//  Wavy
//
//  Created by Alex Bearinger on 2017-01-26.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "WavyFlowLayout.h"

@implementation WavyFlowLayout


-(void)prepareLayout{
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.itemSize = CGSizeMake(20 , 20);
    self.minimumInteritemSpacing = CGFLOAT_MAX;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    [self Fibonacci];
    NSArray<UICollectionViewLayoutAttributes *> *superAttrbts = [super layoutAttributesForElementsInRect:rect];
    NSMutableArray<UICollectionViewLayoutAttributes *>*newAttrbts = [NSMutableArray new];
    int i = 0;
    for (UICollectionViewLayoutAttributes *superAttr in superAttrbts){
        UICollectionViewLayoutAttributes *attr = [superAttr copy];
        [newAttrbts addObject:attr];
        int fib = [self.fibArray[i] intValue]*.5;
   //     CGFloat newY = arc4random_uniform(rect.size.height-1);
       
        float y = fib*(sin(i*5)) + self.collectionView.frame.size.height/2;
        float x = fib*(cos(i*5)) + self.collectionView.frame.size.width/2;
        attr.center = CGPointMake(x, y);
        ++i;
    }
    return newAttrbts;
}

-(void)Fibonacci
{
    int range = 100;
    self.fibArray = [[NSMutableArray alloc]init];
    for (int k =0; k< range; k++)
    {
        if(k<2)
        {
            [self.fibArray  addObject:[NSString stringWithFormat:@"%d",k]];
            continue;
        }
        else
        {
            int fib = [[self.fibArray  objectAtIndex:k-2] intValue] + [[self.fibArray  objectAtIndex:k-1] intValue];
            [self.fibArray  addObject:[NSString stringWithFormat:@"%d",fib]];
        }
        
    }
    
    
    
}



@end
