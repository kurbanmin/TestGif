//
//  ViewController.swift
//  TestGif
//
//  Created by pro on 05.07.2020.
//  Copyright © 2020 pro. All rights reserved.
//

import UIKit

class GifSearchViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model: IGifSearchModel = GifSearchModel()
    var gifData: [GifData] = []
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
        model.delegate = self
        model.loadGif(query: "cats")
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "GifSearchCell", bundle: Bundle.main), forCellReuseIdentifier: "GifSearchCell")
    }
}

extension GifSearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            if text.isEmpty {
                model.loadGif(query: "cats")
            } else {
                model.loadGif(query: text)
            }
        }
    }
    
}
    
    extension GifSearchViewController: UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return gifData.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GifSearchCell",
                                                           for: indexPath) as? GifSearchCell
            else { return UITableViewCell()}
            
            cell.configure(gifData: gifData[indexPath.row])
            
            return cell
        }


    }

    extension GifSearchViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let gif = gifData[indexPath.row]
            let original = gif.images.original
            
            if let width = Double(original.width),
                let height = Double(original.height) {
                return CGFloat(height / width) * tableView.frame.size.width
            } else {
                return 100
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let imageData = gifData[indexPath.row].images.original

            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let fullGifVC = storyboard.instantiateViewController(withIdentifier: "FullGifViewController"
                ) as? GifDetailViewController
            {
                fullGifVC.configure(imageData: imageData)
                self.navigationController?.pushViewController(fullGifVC, animated: true)
            
            }
        }
    }
    
    extension GifSearchViewController: IGifSearchModelDelegate {
        func didLoad(gifs: [GifData]) {
            gifData = gifs
            tableView.reloadData()
        }
    }

