//
//  Cell.swift
//  Astronomy Picture of the Day (APOD)
//
//  Created by Zackary O'Connor on 9/15/18.
//  Copyright © 2018 Zackary O'Connor. All rights reserved.
//

import UIKit

class Cell: UICollectionViewCell {
    
    let photoOfTheDayTitle: UILabel = {
        let label = UILabel()
        label.text = "Photo of the Day"
        label.textColor = .white
        label.font = .systemFont(ofSize: 36, weight: .bold)
        return label
    }()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = UIColor(red:0.84, green:0.34, blue:0.27, alpha:1.00)
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    let explaination: UILabel = {
        let label = UILabel()
        label.text = "Explaination of photo..."
        label.textColor = .white
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    func setupView() {
//        backgroundColor = .clear
        
        [photoOfTheDayTitle, image, title, explaination].forEach { addSubview($0) }
        
        photoOfTheDayTitle.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        image.addAnchors(top: photoOfTheDayTitle.bottomAnchor, leading: leadingAnchor, bottom: title.topAnchor, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 24, right: 0), size: .init(width: frame.width, height: 250))
        
        title.addAnchors(top: image.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 16, right: 0))
        
        explaination.addAnchors(top: title.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
















