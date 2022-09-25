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
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 3.0
        return scrollView
    }()
    
    let contentsView = UIView()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var asset: PHAsset! //전 화면에서 받아올 이미지
    let imageManager: PHCachingImageManager = PHCachingImageManager()

        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubview(imageView)
        
        scrollView.delegate = self
        
        constraint()
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                        contentMode: .aspectFit,
                                         options: nil,
                                         resultHandler: { image, _ in
                   self.imageView.image = image
               })
    }
    
    
    func constraint(){
        
        scrollView.snp.makeConstraints { (make) in
                   make.edges.equalTo(0)
               }
        
        contentsView.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
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

