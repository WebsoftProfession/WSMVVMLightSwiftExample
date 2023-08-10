//
//  EmployeesViewController.swift
//  WSMVVMLightSwiftExample
//
//  Created by WebsoftProfession on 10/08/23.
//

import UIKit
import MVVMLightSwift
import SwiftUI

class EmployeesViewController: BaseViewController<EmployeesViewModel> {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "EmployeeCell", bundle: nil), forCellReuseIdentifier: kEmployeeCell)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.employess.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kEmployeeCell) as! EmployeeCell
        cell.lblName.text = self.viewModel.employess[indexPath.row].name
        cell.lblEmail.text = self.viewModel.employess[indexPath.row].email
        return cell
    }
}

struct EmployeesContainerViewController: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> EmployeesViewController {
        let myViewController = EmployeesViewController.loadFromNib()
        return myViewController
    }
    
    func updateUIViewController(_ uiViewController: EmployeesViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType =  EmployeesViewController
    
   
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
