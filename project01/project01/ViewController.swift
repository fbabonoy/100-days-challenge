//
//  ViewController.swift
//  project01
//
//  Created by fernando babonoyaba on 6/22/22.
//

import UIKit

class ViewController: UIViewController {

    var pictures: [String] = []
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.id)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "this"
        setUpPictures()
        setUpViews()
    }

    func setUpViews() {
        view.addSubview(table)
        let layout = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: layout.topAnchor),
            table.bottomAnchor.constraint(equalTo: layout.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: layout.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: layout.trailingAnchor),
        ])
    }
    func setUpPictures() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
        print(pictures)
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.id, for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    
}
