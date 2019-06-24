//
//  PhotoViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/24.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{

    @IBOutlet weak var photoCollectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var photoCollectionViewControl: UICollectionView!
    
    let fullScreenSize = UIScreen.main.bounds.size
    var photoArray: [String] = ["01", "02", "03"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 設置上下左右的間距
        photoCollectionLayout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        // 設置Cell的size，在func viewDidLoad()外面宣告 let fullScreenSize = UIScreen.main.bounds.size，來得到手機螢幕的大小
        photoCollectionLayout.itemSize = CGSize(width: (fullScreenSize.width-10)/2, height: 100)
        // 設置cell與cell的間距
        photoCollectionLayout.minimumLineSpacing = 5
        // vertical為上下捲動，horizontal為左右捲動
        photoCollectionLayout.scrollDirection = .vertical
        // 設置header的尺寸
        photoCollectionLayout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // 設定區塊 section 數量
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // 將圖片放入陣列中，有幾張圖片就顯示幾個 Item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! MyCustomCollectionViewCell
        cell.myCellImageView.image = UIImage(named: photoArray[indexPath.row])
        return cell
    }
}
