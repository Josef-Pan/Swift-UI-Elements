import UIKit

extension UIViewController {
    func createUIScrollView(){
        let sv = UIScrollView()
        sv.backgroundColor =  UIColor.systemBackground
        self.view.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo:  guide.topAnchor), // Top anchor should follow safeAreaLayoutGuide
            sv.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            sv.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        return sv
    }
}
