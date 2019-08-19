//
//  ViewController.swift
//  Movies
//
//  Created by kristhian deoliveira on 6/29/19.
//  Copyright © 2019 kristhian deoliveira. All rights reserved.
//

import UIKit

class Movieitem: UICollectionViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var ReleaseDate: UILabel!
    
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var Search: UITextField!
    var movie = [Result]()
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
    }
    func parse() -> Void {
        let formatedSearch = Search.text
        let urlString = "https://api.themoviedb.org/3/search/movie?api_key=2048a6f77bee4e54db1aa7fcd143cd7a&query=\(formatedSearch?.replacingOccurrences(of: " ", with: "+") ?? "Jack+Reacher")"
        guard let gitUrl = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let content = try decoder.decode(MoviesList.self, from: data)
                self.movie = content.results
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "Movieitem", for: indexPath) as! Movieitem
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.black.cgColor
            cell.title.text = self.movie[indexPath.row].title
            cell.Description.text = self.movie[indexPath.row].overview
            cell.thumbnail.imageFromUrl(urlString: "https://image.tmdb.org/t/p/w500\(self.movie[indexPath.row].posterPath ?? "")")
            cell.ReleaseDate.text = movie[indexPath.row].releaseDate
        return cell
    }
    var selectedindex = 0
    var selectedName = ""
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedindex = indexPath.row
        selectedName = movie[indexPath.row].title
    }
    @IBAction func Go(_ sender: Any) {
        parse()
        collection.reloadData()
    }
    override func touchesBegan(_ touches: Set<UITouch>,with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
