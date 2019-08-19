//
//  DetailViewController.swift
//  Movies
//
//  Created by kristhian deoliveira on 7/3/19.
//  Copyright © 2019 kristhian deoliveira. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    var movie = [Result]()
    var mainView = ViewController()
    @IBOutlet weak var name: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
0        //setBackground()
        name.text = movie[mainView.selectedindex].title
    }
    func setBackground() -> Void {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.imageFromUrl(urlString: "https://image.tmdb.org/t/p/w500\(movie.first?.posterPath ?? "")")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
}
/*

 */
