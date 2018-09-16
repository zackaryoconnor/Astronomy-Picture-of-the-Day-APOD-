//
//  Cell.swift
//  Astronomy Picture of the Day (APOD)
//
//  Created by Zackary O'Connor on 9/15/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
        backgroundColor = .blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
