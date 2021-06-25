//
//  UIImageView+DownloadImage.swift
//  News
//
//  Created by Dunja Acimovic on 25.06.2021..
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let downloadTask = URLSession.shared.downloadTask(with: url) { [weak self] url, _, error in
            if error == nil,
               let url = url,
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    if let `self` = self {
                        self.image = image
                    }
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}
