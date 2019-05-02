//
//  webViewController.swift
//  newsy
//
//  Created by Sidharth  Miglani on 01/04/19.
//  Copyright © 2019 Sidharth  Miglani. All rights reserved.
//

import UIKit

class webViewController: UIViewController {
    var recv:String?
    @IBOutlet var disp: UIWebView!
   
    override func viewDidLoad() {
        var url = URL(string:recv!)
        super.viewDidLoad()
        let request=URLRequest(url: url!)
        disp.loadRequest(request)
        
           //disp.loadRequest()

        // Do any additional setup after loading the view.
    }

}
