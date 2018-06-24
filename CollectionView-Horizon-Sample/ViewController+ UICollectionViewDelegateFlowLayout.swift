//
//  ViewController+ UICollectionViewDelegateFlowLayout.swift
//  CollectionView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/24.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    // アイテムの大きさを設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.width,
                      height: self.view.frame.height)
    }
}
