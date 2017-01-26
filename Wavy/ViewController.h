//
//  ViewController.h
//  Wavy
//
//  Created by Alex Bearinger on 2017-01-26.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WavyFlowLayout.h"

@interface ViewController : UIViewController <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

