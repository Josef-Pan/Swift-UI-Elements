import UIKit

extension UIViewController {
     @objc func doRefresh(_ sender: Any){
        self.tableView.reloadData()
        (sender as! UIRefreshControl).endRefreshing()
        print("Tableview reloadData done")
    }
    
    /// Create a tableview as subview of the original view, with same size of self.view.
    /// Datasource and delegate will be set automatically
    /// Autolayout do adapt to different screen orientations
    /// - Parameter None
    /// - Returns: the tableview created
    func createTableView() -> UITableView{
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(InvoiceCell.self, forCellReuseIdentifier: "invoiceCell")
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl!.addTarget(self, action: #selector(doRefresh), for: .valueChanged)
        tableView.refreshControl!.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        tableView.refreshControl!.attributedTitle = NSAttributedString(string: "Fetching invoices...")
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor ).isActive = true
        return tableView
    }
}
