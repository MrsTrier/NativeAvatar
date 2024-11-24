//
//  NativeAvatarViewController.swift
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

    private let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill")?.withTintColor(.systemGray2, renderingMode: .alwaysOriginal))
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

  override func viewDidLayoutSubviews() {
        setupNavigationBarAppearance()
  }


    private func setupNavigationBarAppearance() {
      guard let navigationBar = navigationController?.navigationBar,
                let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }

          navigationBar.subviews.forEach { subview in
              if subview.isKind(of: UINavigationBarLargeTitleView.self) {
                  if imageView.superview == nil {
                      imageView.translatesAutoresizingMaskIntoConstraints = false
                      subview.addSubview(imageView)

                      NSLayoutConstraint.activate([
                          imageView.bottomAnchor.constraint(equalTo: subview.bottomAnchor, constant: -15),
                          imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -view.directionalLayoutMargins.trailing),
                          imageView.widthAnchor.constraint(equalToConstant: 36),
                          imageView.heightAnchor.constraint(equalToConstant: 36)
                      ])
                  }
              }
          }
    }
}

