

import UIKit
import WebKit

class WebKitViewController: UIViewController {
    
    var link: String?
    
    private lazy var webView: WKWebView = {
        //        $0.frame = view.bounds
        $0.navigationDelegate = self
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(WKWebView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        view.backgroundColor = .white
        if let link = link {
            if let url = URL(string: link){
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
}
extension WebKitViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("is loaadin")
    }
}
