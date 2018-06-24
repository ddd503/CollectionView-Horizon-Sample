//
//  ViewController.swift
//  CollectionView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/24.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var photoList: [UIImage] = []
    private let imageNameArray = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        // storyboard側でscrollDirectionをHorizonにする
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.isPagingEnabled = true
        self.collectionView.clipsToBounds = false
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.isDirectionalLockEnabled = true
        
        self.photoList = self.dataSource()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    /// 画像名からUIImageの配列を用意
    ///
    /// - Returns: UIImageの配列
    private func dataSource() -> [UIImage] {
        let imageArray: [UIImage] = self.imageNameArray.map {
            UIImage(named: $0) ?? UIImage(named: "noimage")!
        }
        return imageArray
    }
}

