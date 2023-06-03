//
//  HomeView.swift
//  handwritingRecognizer
//
//  Created by yiming on 3/6/23.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack(alignment: .top) {
      Color.white
        .ignoresSafeArea()
      
      VStack(spacing: 0) {
        HStack {
          Spacer()
          Text("手写识别")
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold))
          Spacer()
        }
        .padding(.vertical, 16)
        .background(Color.blue)
        
        HStack {
          Image(systemName: "camera")
            .font(.system(size: 20, weight: .bold))
            .padding(.leading, 16)
          Spacer()
          Text("拍照")
          Spacer()
          Image(systemName: "chevron.right")
            .padding(.trailing, 16)
        }
        .foregroundColor(.white)
        .padding(.vertical, 16)
        .background(Color.blue)
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .padding(.top, 24)
        
        HStack {
          Image(systemName: "photo")
            .font(.system(size: 20, weight: .bold))
            .padding(.leading, 16)
          Spacer()
          Text("从相册选择")
          Spacer()
          Image(systemName: "chevron.right")
            .padding(.trailing, 16)
        }
        .foregroundColor(.white)
        .padding(.vertical, 16)
        .background(Color.blue)
        .cornerRadius(8)
        .padding(.horizontal, 16)
        .padding(.top, 24)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
