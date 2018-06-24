//
//  ImageViewCell.swift
//  CollectionView-Horizon-Sample
//
//  Created by kawaharadai on 2018/06/24.
//  Copyright © 2018年 kawaharadai. All rights reserved.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    // storyboardで用意しないとsetup時にセルサイズが確定していない
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoView: UIImageView!
    
    var image: UIImage? {
        didSet {
            self.photoView.image = image
        }
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    // init使うとscrollView.delegate = selfで落ちる
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setup()
    }

    func setup() {
        scrollView.delegate = self
        scrollView.maximumZoomScale = 2.5
        scrollView.minimumZoomScale = 1.0
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        // ダブルタップジェスチャーの生成
        let doubleTap = UITapGestureRecognizer(target: self,
                                               action: #selector(ImageViewCell.doubleTap(gesture:)))
        doubleTap.numberOfTapsRequired = 2
        photoView.isUserInteractionEnabled = true
        photoView.addGestureRecognizer(doubleTap)
    }
    
    @objc func doubleTap(gesture: UITapGestureRecognizer) -> Void {
        
        if (self.scrollView.zoomScale < 2.5) {
            // 拡大
            let newScale:CGFloat = self.scrollView.zoomScale * 2.5
            let zoomRect:CGRect = self.zoomRectForScale(scale: newScale,
                                                        center: gesture.location(in: gesture.view))
            self.scrollView.zoom(to: zoomRect, animated: true)
        } else {
            // 元に戻す
            self.scrollView.setZoomScale(1.0, animated: true)
        }
    }
    // ピンチ領域の計算
    func zoomRectForScale(scale:CGFloat, center: CGPoint) -> CGRect{
        var zoomRect: CGRect = CGRect()
        zoomRect.size.height = self.scrollView.frame.size.height / scale
        zoomRect.size.width = self.scrollView.frame.size.width / scale
        
        zoomRect.origin.x = center.x - zoomRect.size.width / 2.0
        zoomRect.origin.y = center.y - zoomRect.size.height / 2.0
        
        return zoomRect
    }
}

// MARK: - UIScrollViewDelegate
extension ImageViewCell: UIScrollViewDelegate {
    // ピンチインの許可
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.photoView
    }
}
