//
//  JokesVC.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class JokesVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var jokes = [AllJokes]() {
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadData()
    }
    
    func loadData() {
        jokes = AllJokes.getJokes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let joke = segue.destination as? JokesDVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        joke.allJoke = jokes[indexPath.row]
    }
}

extension JokesVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokesCell", for: indexPath)
        let user = jokes[indexPath.row]
        cell.textLabel?.text = user.setup
        return cell
    }
}
