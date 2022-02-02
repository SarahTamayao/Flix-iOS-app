//
//  MovieViewController.swift
//  Flix
//
//  Created by Charles Xu on 2/1/22.
//

import UIKit
import AlamofireImage

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    // variables here exist for the lifetime of that screen
    var movies = [[String:Any]]()  // creation of an array of dictionaries

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self // call to run both tableView functions
        tableView.delegate = self   // call to run both tableView functions
        
        print("Hi!")
        
        // Do any additional setup after loading the view.
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                    // cast this results as an array of dictionaries
                    self.movies = dataDictionary["results"] as! [[String:Any]]
                 
                    self.tableView.reloadData() // call all tableView functions again for n times
                 
                    print(dataDictionary)  // print the JSON

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data

             }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count // call this n times to create n numbered rows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell // cells take a lot of memory, so give me recycled cells off the screen
        
        let movie = movies[indexPath.row] // access 1 to n movies
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        
        cell.titleLabel.text = title
        // cell.textLabel!.text = "row: \(indexPath.row)"  // print out x rows with output row: #
        // Why the !/?^: called Swift Optionals
        cell.synopsisLabel.text = synopsis
        
        // embed posters inside the cell
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        
        cell.posterView.af.setImage(withURL: posterUrl!)
        
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
