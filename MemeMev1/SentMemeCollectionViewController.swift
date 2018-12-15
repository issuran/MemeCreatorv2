//
//  SentMemeCollectionViewController.swift
//  MemeMev2
//
//  Created by Tiago Oliveira on 14/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import UIKit

private let reuseIdentifier = "memeCollectionCell"

class SentMemeCollectionViewController: UICollectionViewController {
    
    var memes = [Meme]()
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space: CGFloat = 3.0
        let width = (view.frame.size.width - (2 * space)) / 3.0
        let height = (view.frame.size.height - (2 * space)) / 3.0
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: width, height: height)
        
        self.navigationItem.title = "Sent Memes"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(SentMemesViewController.createMeme))
    }
    
    @objc func createMeme() {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "memeViewController") as! MemeViewController
        present(viewController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        memes = appDelegate.memes
        
        collectionView.reloadData()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MemeCollectionViewCell
    
        // Configure the cell
        cell.collectionImgView.image = memes[indexPath.row].memeImage
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController") as! MemeDetailsViewController
        viewController.image = memes[indexPath.row].memeImage
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
