//
//  ViewController+UICollectionViewDataSource.swift
//  CollectionView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/24.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageViewCell.identifier, for: indexPath) as? ImageViewCell else {
            fatalError("cell is nil")
        }
        
        cell.image = self.photoList[indexPath.row]
        
        return cell
    }
    
    
}
