//
//  StarWarsDVC.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class StarWarsDVC: UIViewController {
    var starWarsMovies: Movies!
    @IBOutlet weak var starWarsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        starWarsLabel.text = starWarsMovies.opening_crawl
    }
    
}

