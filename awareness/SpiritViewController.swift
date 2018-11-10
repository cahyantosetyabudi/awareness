//
//  SpiritViewController.swift
//  awareness
//
//  Created by Cahyanto Setya Budi on 11/7/18.
//  Copyright © 2018 Cahyanto Setya Budi. All rights reserved.
//

import UIKit

class SpiritViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterImageView: UIImageView!
    @IBOutlet weak var redDotView: UIView!
    
    var width = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterView.layer.masksToBounds = false
        filterView.layer.cornerRadius = filterView.frame.width/2
        filterView.layer.borderWidth = 1
        filterView.layer.borderColor = UIColor.clear.cgColor
        filterView.clipsToBounds = true
        
        redDotView.layer.masksToBounds = false
        redDotView.layer.cornerRadius = redDotView.frame.width/2
        redDotView.clipsToBounds = true
    }

}

extension SpiritViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return width
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = Bundle.main.loadNibNamed("SpiritHeaderTableViewCell", owner: self, options: nil)?.first as! SpiritHeaderTableViewCell
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
}

extension SpiritViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SpiritTableViewCell
        cell.contentView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        cell.selectionStyle = .none
        
        width = cell.frame.width
        
        return cell
    }
}
