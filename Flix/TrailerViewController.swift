//
//  TrailerViewController.swift
//  Flix
//
//  Created by Charles Xu on 2/12/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    // reference this solution:
    //https://stackoverflow.com/questions/32733431/wkwebview-not-in-xcode
    let webview = WKWebView()
    
    @IBOutlet weak var trailerWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Loading Trailer Web View")
    }

}
