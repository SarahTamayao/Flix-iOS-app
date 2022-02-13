//
//  SuperheroDetailsViewController.swift
//  Flix
//
//  Created by Charles Xu on 2/12/22.
//

import UIKit

class SuperheroDetailsViewController: UIViewController {
    
    @IBOutlet weak var backDropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterView.af.setImage(withURL: posterUrl!)
        
        let backDropPath = movie["backdrop_path"] as! String
        let backDropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + backDropPath)
        backDropView.af.setImage(withURL: backDropUrl!)
    }
    
  
//    @IBAction func tapTrailerView(_ sender: UITapGestureRecognizer) {
//
//        print("Tapped Trailer View")
//
//
//        // 1. Find the selected superhero movie
//        let ytBaseUrl = "https://www.youtube.com/watch?v="
//        let trailerPath = movie["key"] as! String
//        let posterUrl = URL(string: ytBaseUrl + trailerPath)
//        posterView.af.setImage(withURL: posterUrl!)
//
//        // 2. Pass selected superhero movie to SuperheroDetailsVC...
//        let trailerViewController = segue.destination as! TrailerViewController
//        trailerViewController.trailerWebView = trailerUrl // store selected movie into movie dictionary of details VC
//
//
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
