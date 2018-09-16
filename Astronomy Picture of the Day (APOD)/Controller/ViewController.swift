//
//  ViewController.swift
//  Astronomy Picture of the Day (APOD)
//
//  Created by Zackary O'Connor on 9/15/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

private let reuseId = "reuseId"

class ViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
     
        collectionView?.backgroundColor = .red
        collectionView?.register(Cell.self, forCellWithReuseIdentifier: reuseId)
    }
}

extension ViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseId, for: indexPath) as? Cell {
            return cell
        }
        return UICollectionViewCell()
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 32, height: 500)
    }
}
















