//
//  NewsTableViewCell.swift
//  News
//
//  Created by Dunja Acimovic on 31.05.2021..
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    //MARK: - Lifecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    func configure(with item: NewsTableViewCellItem) {
        titleLabel.text = item.title
        descriptionLabel.text = item.description
        configureImageView(with: item.imageData, source: item.source)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        descriptionLabel.text = nil
        cellImageView.image = nil
    }
}

// MARK: - Extensions -

private extension NewsTableViewCell {
    
    private func setupView() {
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        descriptionLabel.numberOfLines = 3
        descriptionLabel.font = .systemFont(ofSize: 15, weight: .light)
        cellImageView.layer.cornerRadius = 6
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.borderColor = UIColor.lightGray.cgColor
        cellImageView.layer.borderWidth = 1.0 / UIScreen.main.scale
        cellImageView.backgroundColor = .secondarySystemBackground
        cellImageView.clipsToBounds = true
        cellImageView.contentMode = .scaleAspectFill
    }
    
    private func configureImageView(with imageData: Data?, source: Source) {
        if let data = imageData {
            self.cellImageView.image = UIImage(data: data)
        } else if let image = UIImage(named: source.name) {
            self.cellImageView.image = image
        }
    }
}
