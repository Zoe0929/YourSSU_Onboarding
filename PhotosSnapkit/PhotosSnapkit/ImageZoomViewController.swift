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
        scrollView.delegate = self
        setView()
        makeConstraint()
        imageManager.requestImage(for: asset, targetSize: CGSize(width: asset.pixelWidth, height: asset.pixelHeight),
                                  contentMode: .aspectFit,
                                  options: nil,
                                  resultHandler: { image, _ in
            self.imageView.image = image
        })
    }
    
    func setView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubview(imageView)
        
    }
    
    func makeConstraint(){
        
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(0)
        }
        
        contentsView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalToSuperview()
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

