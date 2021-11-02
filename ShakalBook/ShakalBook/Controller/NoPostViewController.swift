//
//  NoPostViewController.swift
//  ShakalBook
//
//  Created by Osama Vaince on 8/4/21.
//

import UIKit

class NoPostViewController: UIViewController {

   
    @IBOutlet weak var noPostLabel: UILabel!
    
    @IBAction func dismissScreen(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
