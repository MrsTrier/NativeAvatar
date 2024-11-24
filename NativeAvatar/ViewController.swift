//
//  ViewController.swift
//  NativeAvatar
//
//  Created by Daria Cheremina on 22/11/2024.
//

import UIKit

private struct Const {
    static let ImageSizeForLargeState: CGFloat = 36
    static let ImageRightMargin: CGFloat = 16
    static let ImageBottomMarginForLargeState: CGFloat = 12
}

class NativeAvatarViewController: UIViewController, UIScrollViewDelegate {

    let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    lazy var navBar = self.navigationController?.navigationBar

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.size.width , height: UIScreen.main.bounds.size.height * 2)
        scrollView.automaticallyAdjustsScrollIndicatorInsets = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar"
        setupNavigationBarAppearance()
        setUpScrollView()
    }

    func setUpScrollView() {
        scrollView.delegate = self
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    private func setupNavigationBarAppearance() {
        guard let navBar else { return }

        navBar.addSubview(imageView)
        navBar.sendSubviewToBack(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.rightAnchor.constraint(equalTo: navBar.rightAnchor,
                                             constant: -Const.ImageRightMargin),
            imageView.bottomAnchor.constraint(equalTo: navBar.bottomAnchor,
                                              constant: -Const.ImageBottomMarginForLargeState),
            imageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
            ])

    }
}

