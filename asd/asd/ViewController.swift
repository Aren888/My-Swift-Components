//
//  ViewController.swift
//  asd
//
//  Created by Solicy Ios on 12.12.23.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create WKWebView
        let configuration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: configuration)
        webView.navigationDelegate = self
        view.addSubview(webView)

        // Load a URL
        if let url = URL(string: "https://www.apple.com") {
            let request = URLRequest(url: url)
            webView.load(request)
        }

        // Add a button to toggle between light and dark mode
        let modeButton = UIButton(type: .system)
        modeButton.setTitle("Toggle Mode", for: .normal)
        modeButton.addTarget(self, action: #selector(toggleMode), for: .touchUpInside)
        modeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modeButton)

        // Setup constraints for WKWebView
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            modeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            modeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            modeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            modeButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: modeButton.bottomAnchor, constant: 20),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -20),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20)
        ])

        // Setup constraints for the "Toggle Mode" button
      
    }

    @objc func toggleMode() {
        // Toggle between light and dark mode
        if #available(iOS 13.0, *) {
            let currentInterfaceStyle = traitCollection.userInterfaceStyle
            let newStyle: UIUserInterfaceStyle = (currentInterfaceStyle == .light) ? .dark : .light
            overrideUserInterfaceStyle = newStyle

            // Change WKWebView background color based on the selected mode
            if newStyle == .dark {
                webView.backgroundColor = .black
                webView.scrollView.backgroundColor = .black
            } else {
                webView.backgroundColor = .white
                webView.scrollView.backgroundColor = .white
            }
        }
    }

}

extension ViewController: WKNavigationDelegate {
    // Implement WKNavigationDelegate methods if needed
}
