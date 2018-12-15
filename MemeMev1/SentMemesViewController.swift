//
//  SentMemesViewController.swift
//  MemeMev2
//
//  Created by Tiago Oliveira on 04/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation
import UIKit

class SentMemesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var memes = [Meme]()
    
    override func viewDidLoad() {
        guard let tableView = tableView else {
            return
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MemeTableViewCell", bundle: nil), forCellReuseIdentifier: "memeTableCell")
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        self.navigationItem.title = "Sent Memes"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SentMemesViewController.createMeme))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        tableView.reloadData()
    }
    
    @objc func createMeme() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "memeViewController") as! MemeViewController
        present(viewController, animated: true, completion: nil)
    }
}

extension SentMemesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "memeTableCell", for: indexPath) as! MemeTableViewCell
        cell.labelCell.text = ("\(memes[indexPath.row].topText) ... \(memes[indexPath.row].bottomText)")
        cell.imgViewCell.image = memes[indexPath.row].memeImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! MemeDetailsViewController
        viewController.image = memes[indexPath.row].memeImage
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
