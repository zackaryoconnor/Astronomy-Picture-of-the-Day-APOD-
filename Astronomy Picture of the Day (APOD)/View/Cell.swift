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
        return imageView
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.numberOfLines = 2
        return label
    }()
    
    let explaination: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        getImageData()
    }
    
    func setupView() {
        [photoOfTheDayTitle, image, title, explaination].forEach { addSubview($0) }
        
        photoOfTheDayTitle.addAnchors(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 0))
        
        image.addAnchors(top: photoOfTheDayTitle.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 32, left: 0, bottom: 0, right: 0), size: .init(width: frame.width, height: 250))
        
        title.addAnchors(top: image.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 24, left: 0, bottom: 0, right: 0))
        
        explaination.addAnchors(top: title.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 8, left: 0, bottom: 0, right: 0))
    }
    
    func getImageData() {
        let jsonUrl = "https://api.nasa.gov/planetary/apod?api_key=DYJTDk2EjukoKtBmDYVrPKNcqwlYtFnLnHZILBjQ"
        guard let url = URL(string: jsonUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("There was an error: ", error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let json = try JSONDecoder().decode(APOD.self, from: data)
                print(json)
                DispatchQueue.main.async {
                    if let imageUrl = URL(string: json.url) {
                        if let imageData = try? Data(contentsOf: imageUrl) {
                            self.image.image = UIImage(data: imageData)
                        }
                    }
                    self.title.text = json.title
                    self.explaination.text = json.explanation
                }
            } catch let jsonError {
                print("Error parsing json: ", jsonError)
            }
        }.resume()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
















