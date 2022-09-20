//
//  ImageZoomViewController.swift
//  PhotosSnapKit
//
//  Created by 지희의 MAC on 2022/09/20.
//

import UIKit
import Photos
import SnapKit

class ImageZoomViewController: UIViewController {
    var asset: PHAsset! //전 화면에서 받아올 이미지
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    let imageView = UIImageView();


    override func viewDidLoad() {
        super.viewDidLoad()
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                         contentMode: .aspectFill,
                                         options: nil,
                                         resultHandler: { image, _ in
                   self.imageView.image = image
               })
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ImageZoomViewController:UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
}
