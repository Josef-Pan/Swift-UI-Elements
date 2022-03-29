import UIKit

extension UIViewController {
    
    @objc func backAction(sender: AnyObject) {
        self.presentingViewController?.dismiss(animated:true)
    }
  
    func createNavigationBars(height: Int, title: String) -> UINavigationBar{
        let navbar = UINavigationBar(frame: CGRect(x: 0, y: height, width: self.view.frame.width, height: height))
        navbar.backgroundColor = UIColor.black
        navbar.delegate = self as? UINavigationBarDelegate
        let navItem = UINavigationItem()
        navItem.title = title
        navItem.leftBarButtonItem = UIBarButtonItem(title: "< Back", style: .plain, target: self,
                                                    action: #selector(self.backAction(sender:)))
        navbar.items = [navItem]
        view.addSubview(navbar)
        navbar.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            navbar.topAnchor.constraint(equalTo: guide.topAnchor, constant: 0 ), // Use safeAreaLayoutGuide here
            navbar.heightAnchor.constraint(equalToConstant: statusBarHeight),
            navbar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navbar.widthAnchor.constraint(equalToConstant: view.frame.width),
        ])
        self.view?.frame = CGRect(x: 0, y: height, 
                                  width: self.view.frame.width, 
                                  height: (self.view.frame.height - height))
        return navbar
    }
    
}
