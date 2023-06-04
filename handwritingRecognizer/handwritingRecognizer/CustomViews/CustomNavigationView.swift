//
//  CustomNavigationView.swift
//  handwritingRecognizer
//
//  Created by yiming on 4/6/23.
//

import SwiftUI
import UIKit

class CustomNavigationController: UINavigationController {
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = .systemBlue
    appearance.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.white,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .bold)
    ]
    
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
    
    extendedLayoutIncludesOpaqueBars = true // Include opaque bars in the layout
  }
  
  func pushView<Content: View>(view: Content, animated: Bool) {
    let hostingController = UIHostingController(rootView: view)
    pushViewController(hostingController, animated: animated)
  }
}

struct CustomNavigationView<Content: View>: UIViewControllerRepresentable {
  @Binding var navigationController: CustomNavigationController?
  var content: () -> Content
  
  func makeUIViewController(context: Context) -> CustomNavigationController {
    let navigationController = CustomNavigationController(rootViewController: UIHostingController(rootView: content()))
    self.navigationController = navigationController
    
    return navigationController
  }
  
  func updateUIViewController(_ uiViewController: CustomNavigationController, context: Context) {
  }
}
