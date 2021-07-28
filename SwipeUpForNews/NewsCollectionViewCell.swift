//
//  NewsCollectionViewCell.swift
//  SwipeUpForNews
//
//  Created by Deepthi on 24/06/21.
//

import UIKit

class NewsCollectionViewCell: UICollectionViewCell {
    
    var newsLabel:UILabel?
    static let identifier  = "NewsCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        newsLabel = UILabel()
        newsLabel?.numberOfLines = 0
        newsLabel?.frame = CGRect(x: self.frame.size.width/2, y: self.frame.size.height/2, width: self.frame.size.width, height: 50)
        contentView.addSubview(newsLabel!)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureNewsLable() {
        newsLabel?.text = "This is the News"
    }
    
        
}
