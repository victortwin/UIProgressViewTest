//
//  ViewController.swift
//  UIProgressView
//
//  Created by Victor Tormyshev on 08.03.2024.
//

import UIKit

final class ViewController: UIViewController {

    private var myProgressView = UIProgressView()
    private var myButton = UIButton()
    private var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createProgrressView(myProgressView)
        createButton(myButton)
        createTimer()
    }
    
    private func createTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil, repeats: true)
    }
    
    @objc private func updateProgressView() {
        if myProgressView.progress != 1.0 {
            myProgressView.progress += 0.001
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7) {
                self.myButton.alpha = 1
                self.myButton.setTitle("Start", for: .normal)
                self.myTimer.invalidate()
            }
        }
    }
    
    private func createProgrressView(_ progressView: UIProgressView) {
        
        progressView.progressViewStyle = .bar
        progressView.frame = CGRect(x: view.center.x,
                                    y: view.center.y,
                                    width: 150, height: 50)
        progressView.setProgress(0.0, animated: false)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .gray
        progressView.center = view.center
        view.addSubview(progressView)
    }
    
    private func createButton(_ button: UIButton) {
        button.frame = CGRect(x: view.bounds.size.width / 4,
                              y: view.center.y + 100,
                              width: 150, height: 50)
        button.backgroundColor = .red
        button.alpha = 0.2
        button.setTitle("Loading...", for: .normal)
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
    }


}

