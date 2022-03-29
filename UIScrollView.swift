import UIKit

extension UIViewController {
    func createUIScrollView(parent view: UIView,
                         top: NSLayoutYAxisAnchor,
                         bottom: NSLayoutYAxisAnchor,
                         leading:NSLayoutXAxisAnchor,
                         trailing: NSLayoutXAxisAnchor,
                         backgroundColor:UIColor = UIColor.systemBackground) ->UIScrollView{
        let sv = UIScrollView()
        sv.backgroundColor = backgroundColor
        sv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sv)
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo:  top),
            sv.bottomAnchor.constraint(equalTo: bottom),
            sv.leadingAnchor.constraint(equalTo: leading),
            sv.trailingAnchor.constraint(equalTo: trailing),
        ])
        return sv
    }
}
