//
//  JokesDVC.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class JokesDVC: UIViewController {
    var allJoke: AllJokes!
    @IBOutlet weak var jokesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokesLabel.text = allJoke.punchline
    }
    

}
