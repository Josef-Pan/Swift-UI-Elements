import UIKit

extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    func removeSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
    
    func subviews<T>(ofType _: T.Type) -> [T] {
        var views = [T]()
        for subview in subviews {
            if let view = subview as? T {
                views.append(view)
            } else if !subview.subviews.isEmpty {
                views.append(contentsOf: subview.subviews(ofType: T.self))
            }
        }
        return views
    }
  
}
