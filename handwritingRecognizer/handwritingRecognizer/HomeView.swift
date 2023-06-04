//
//  HomeView.swift
//  handwritingRecognizer
//
//  Created by yiming on 3/6/23.
//

import SwiftUI

struct HomeView: View {
  @State private var capturedImage: UIImage?
  @State private var isCameraPresented: Bool = false
  @State private var isImageViewPushed: Bool = false
  
  var body: some View {
      ZStack(alignment: .top) {
        Color.blue
          .ignoresSafeArea()
        
        NavigationView {
          VStack(spacing: 0) {
            if let capturedImage = capturedImage {
              NavigationLink(
                destination: ImageView(image: capturedImage),
                isActive: $isImageViewPushed,
                label: {
                  EmptyView()
                })
            }
            
            Group {
              Button(action: openCamera) {
                HStack {
                  Image(systemName: "camera")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 16)
                  Spacer()
                  Text("拍照识别")
                  Spacer()
                  Image(systemName: "chevron.right")
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 16)
                .background(Color.blue)
                .cornerRadius(8)
              }
              
              Button(action: openPhotoLibrary) {
                HStack {
                  Image(systemName: "photo")
                    .font(.system(size: 20, weight: .bold))
                    .padding(.leading, 16)
                  Spacer()
                  Text("相册识别")
                  Spacer()
                  Image(systemName: "chevron.right")
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 16)
                .background(Color.blue)
                .cornerRadius(8)
              }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 16)
            .padding(.top, 24)
            
            Spacer()
            
          }
          .navigationBarTitle("手写识别")
        
        }
      }
      .sheet(isPresented: $isCameraPresented, onDismiss: {
        if capturedImage != nil {
          isImageViewPushed = true
        }
      }) {
        CameraView(image: $capturedImage)
      }
  }
  
  func openCamera() {
    capturedImage = nil
    isCameraPresented = true
  }
  
  func openPhotoLibrary() {
    print("// implement open photo library logic")
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}

struct NavigationBarConfigurator: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard let navigationBar = uiViewController.navigationController?.navigationBar else { return }
        navigationBar.barTintColor = .systemBlue // Change the background color
        navigationBar.shadowImage = UIImage()
    }
}
