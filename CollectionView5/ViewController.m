//
//  ViewController.m
//  CollectionView5
//
//  Created by Quazi Ridwan Hasib on 28/01/2016.
//  Copyright © 2016 Quazi Ridwan Hasib. All rights reserved.
//

#import "ViewController.h"
#import "CustomHeader.h"
#import "CustomCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep",
                       @"Oct", @"Nov", @"Dec"];
    
    self.dataArray1 = @[ @"May", @"Jun", @"Jul", @"Aug", @"Sep",
                         @"Oct", @"Nov", @"Dec"];
    
    self.dataArray2 = @[@"Oct", @"Nov", @"Dec"];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 3;
}

-(NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section
{
    int a;
    if(section==0)
    {
        a=self.dataArray.count;
    }
    else if(section==1)
    {
        a=self.dataArray1.count;
    }
    else if(section==2)
    {
        a=self.dataArray2.count;
    }
    
    return a;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CustomHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myHeader" forIndexPath:indexPath];
    
    if (indexPath.section ==0) {
        header.myCustomHeader.text = [NSString stringWithFormat:@"Section 0"];
        
    }
    else if (indexPath.section ==1) {
        header.myCustomHeader.text = [NSString stringWithFormat:@"Section ss"];
        
    }
    else if (indexPath.section ==2) {
        header.myCustomHeader.text = [NSString stringWithFormat:@"Section dd"];
        
    }
    
    // header.myHeaderLabel.text = [NSString stringWithFormat:@"Section %ld", indexPath.section +1];
    
    return header;
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    CustomCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if(indexPath.section==0)
    {
        [[cell myLabel]setText:[self.dataArray objectAtIndex:indexPath.item]];
        cell.myImageView.image = [UIImage imageNamed:@"2.jpg"];
        
        //Add to cell programmatically
//        UILabel *lbl1 = [[UILabel alloc] init];
//        [lbl1 setFrame:CGRectMake(0,5,100,20)];
//        lbl1.backgroundColor=[UIColor clearColor];
//        lbl1.textColor=[UIColor blueColor];
//        lbl1.userInteractionEnabled=YES;
//        [cell addSubview:lbl1];
//        lbl1.text=  [self.dataArray objectAtIndex:indexPath.item];
        
        //Remove from cell programmatically
      //  [cell.myLabel removeFromSuperview];
        
    }
    else if(indexPath.section==1)
    {
        [[cell myLabel]setText:[self.dataArray1 objectAtIndex:indexPath.item]];
        cell.myImageView.image = [UIImage imageNamed:@"2.jpg"];
    }
    else if(indexPath.section==2)
    {
        [[cell myLabel]setText:[self.dataArray2 objectAtIndex:indexPath.item]];
        cell.myImageView.image = [UIImage imageNamed:@"4.jpg"];
    }
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[collectionView cellForItemAtIndexPath:indexPath];
    if (indexPath.section == 0) {
       
        NSString *str = cell.myLabel.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
        
    } else if(indexPath.section == 1){
        NSString *str = cell.myLabel.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
    }
    else if(indexPath.section == 2){
        NSString *str = cell.myLabel.text;
        NSLog(@"Text: %@ section no:%ld item no: %ld", str, indexPath.item, indexPath.section);
    }
}

//#pragma mark collection view cell paddings
//- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
//    return UIEdgeInsetsMake(0, 0, 0, 0); // top, left, bottom, right
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
//    
//    return 35.0;
//}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
