//
//  BookDetailViewController.swift
//  NYTBestseller
//
//  Created by Andres Peguero on 1/9/18.
//  Copyright © 2018 Andres. All rights reserved.
//

import UIKit

class BookDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var amazonLinkLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    let presenter = BookDetailPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configureNavigationBar()
    }
    
    //Sets the labels and other UI elements
    private func setupUI() {
        if let book = presenter.book {
            titleLabel.text = book.title
            amazonLinkLabel.text = book.amazonLink
            authorLabel.text = book.author
            descriptionLabel.text = book.bookDescription
            coverImageView.kf.setImage(with: book.coverLink, placeholder: nil, options: nil,
                                       progressBlock: nil, completionHandler: { (image, error, _, _) in
                                        if image == nil {
                                            self.coverImageView.image = #imageLiteral(resourceName: "no_photo_avail")
                                        }
            })
        }
    }
    
    //Configures the navigation bar attributes 
    private func configureNavigationBar() {
        if let book = presenter.book {
            title = book.title
        }
    }

}
