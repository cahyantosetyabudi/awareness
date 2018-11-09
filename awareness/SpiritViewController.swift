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
    
    var width = CGFloat()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

extension SpiritViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return width
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
