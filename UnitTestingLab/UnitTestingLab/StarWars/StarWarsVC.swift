//
//  StarWarsVC.swift
//  UnitTestingLab
//
//  Created by David Lin on 12/5/19.
//  Copyright © 2019 David Lin (Passion Proj). All rights reserved.
//

import UIKit

class StarWarsVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var movies = [Movies]() {
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
        movies = StarWarsData.getMovies()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let movie = segue.destination as? StarWarsDVC, let indexPath = tableView.indexPathForSelectedRow else {
            fatalError()
        }
        movie.starWarsMovies = movies[indexPath.row]
    }
}

extension StarWarsVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        let user = movies[indexPath.row]
        cell.textLabel?.text = user.title
        return cell
    }
}
