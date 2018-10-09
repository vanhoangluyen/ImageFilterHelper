//
//  CollectionViewController.swift
//  ImageFilterHelper
//
//  Created by apple on 10/9/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit


class CollectionViewController: UICollectionViewController {

    var imageFilterSet: [ImageFilter]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        guard let photo = UIImage(named: "hotgirl") else { return }
        DSImageFilterHelper.shared.createFilteredImages(filters: Filter.allValues, image: DSImageFilterHelper.shared.resizeImage(image: photo, resizedSize: CGSize(width: 60, height: 60)) ) { (imgSet) in
            self.imageFilterSet = imgSet
            // COLLECTION VIEW RELOAD
            self.collectionView.reloadData()
        }
    }


    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageFilterSet?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.photoImage.image = imageFilterSet![indexPath.row].image
        print(imageFilterSet![indexPath.row].filter.name)
        return cell
    }
}
