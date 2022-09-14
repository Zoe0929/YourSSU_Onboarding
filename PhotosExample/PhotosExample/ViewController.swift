//
//  ViewController.swift
//  PhotosExample
//
//  Created by 지희의 MAC on 2022/09/14.
//

import UIKit
import Photos

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, PHPhotoLibraryChangeObserver {
    
    @IBOutlet var tableView: UITableView!
        var fetchResult: PHFetchResult<PHAsset>!
        //이미지 로드
        let imageManager: PHCachingImageManager = PHCachingImageManager()
        let cellIdentifier: String = "cell"

        //refresh
        @IBAction func touchUpRefreshButton(_ sender: UIBarButtonItem) {
            self.tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }

        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
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

        override func viewDidLoad() {
            super.viewDidLoad()
            //접근 허용 확인
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

            PHPhotoLibrary.shared().register(self)
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.fetchResult?.count ?? 0
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)

            let asset: PHAsset = fetchResult.object(at: indexPath.row)

            //실질적인 이미지 요청
            imageManager.requestImage(for: asset, targetSize: CGSize(width: 30, height: 30), contentMode: .aspectFill, options: nil, resultHandler: { image, _ in
                cell.imageView?.image = image
            })
            return cell
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let nextViewController: ImageZoomViewController = segue.destination as? ImageZoomViewController else {
                return
            }

            guard let cell: UITableViewCell = sender as? UITableViewCell else {
                return
            }
            guard let index: IndexPath = self.tableView.indexPath(for: cell) else {
                return
            }

            nextViewController.asset = self.fetchResult[index.row]
        }

    }
