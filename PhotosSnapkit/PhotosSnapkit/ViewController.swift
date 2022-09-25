//
//  ViewController.swift
//  PhotosSnapKit
//
//  Created by 지희의 MAC on 2022/09/20.
//

import UIKit
import SnapKit
import Photos

class ViewController: UIViewController {
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        
        return tableView
    }()
    
    //private let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(touchUpRefreshButton))
    
    var fetchResult: PHFetchResult<PHAsset>!
    
    //이미지 로드
    let imageManager: PHCachingImageManager = PHCachingImageManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        makeConstraint()
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.identifier)
        allowAcess()
        PHPhotoLibrary.shared().register(self)
        
    }
    
    func setView(){
        self.navigationItem.title = "사진 목록"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(touchUpRefreshButton))
        tableView.delegate = self
        tableView.dataSource = self

        
        view.addSubview(tableView)
    }
    
    func makeConstraint(){
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    
    func allowAcess(){
        let photoAurhorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAurhorizationStatus {
        case .notDetermined:
            print("아직 응답하지 않음")
            PHPhotoLibrary.requestAuthorization({ (status) in
                switch status {
                case .authorized:
                    print("사용자가 허용함")
                    self.requestCollection()
                    OperationQueue.main.addOperation {
                        self.tableView.reloadData()
                    }
                case .denied:
                    print("사용자가 불허함")
                default: break
                }
            })
        case .restricted:
            print("접근 제한")
        case .denied:
            print("접근 불허")
        case .authorized:
            print("접근 허가됨")
            self.requestCollection()
            OperationQueue.main.addOperation {
                self.tableView.reloadData()
            }
        case .limited:
            print("-")
        @unknown default:
            print("-")
        }
        
    }
    
    
    @objc func touchUpRefreshButton() {
        print("refresh")
        self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
    }
    
}



extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //셀 높이 지정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    //편집 모드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let asset: PHAsset = self.fetchResult[indexPath.row]
            PHPhotoLibrary.shared().performChanges(
                {PHAssetChangeRequest.deleteAssets([asset] as NSArray)
                }, completionHandler: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fetchResult?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier) as? PhotoTableViewCell else { return .init() }
        
        let asset: PHAsset = fetchResult.object(at: indexPath.row)
        let options: PHImageRequestOptions = PHImageRequestOptions()
        options.resizeMode = .exact
        
        //실질적인 이미지 요청
        imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: options, resultHandler: { image, _ in
            cell.myImageView.image = image
        })
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //테이블뷰의 이벤트처리 함수
        
        let nextViewcontroller = ImageZoomViewController()
        //        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.identifier) as? PhotoTableViewCell else { return }
        let index: IndexPath = indexPath
        nextViewcontroller.asset = self.fetchResult[index.row]
        print (self.fetchResult[index.row])
        self.navigationController?.pushViewController(nextViewcontroller, animated: true)
    }
    
    
    
}

extension ViewController: PHPhotoLibraryChangeObserver{
    //라이브러리의 변화 감지
    func photoLibraryDidChange(_ changeInstance: PHChange) {
        guard let changes = changeInstance.changeDetails(for: fetchResult)
        else { return }
        fetchResult = changes.fetchResultAfterChanges
        OperationQueue.main.addOperation {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    //카메라로 찍으면 저장
    func requestCollection() {
        let cameraRoll: PHFetchResult<PHAssetCollection> = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .smartAlbumUserLibrary, options: nil)
        guard let cameraRollCollection = cameraRoll.firstObject else {
            return
        }
        
        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        self.fetchResult = PHAsset.fetchAssets(in: cameraRollCollection, options: fetchOptions)
    }
    
    
}

