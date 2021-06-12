//
//  NewsTableViewCell.swift
//  News
//
//  Created by Dunja Acimovic on 31.05.2021..
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.borderColor = UIColor.lightGray.cgColor
        cellImageView.layer.borderWidth = 1.0 / UIScreen.main.scale
    }
    
    func configure(with item: NewsViewItemInterface) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        
//        if let url = viewModel.imageURL {
//
//        }
//        if let url = item.imageURL {
//            cellImageView.image = UIImage(
//        }
    }
    
//    func configure(with item: HomeViewItemInterface) {
//        cellTextLabel.text = item.title
//
//        if let url = item.imageURL {
//            cellImageView.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "image-placeholder"))
//        } else {
//            cellImageView.image = #imageLiteral(resourceName: "image-placeholder")
//        }
//    }
}
