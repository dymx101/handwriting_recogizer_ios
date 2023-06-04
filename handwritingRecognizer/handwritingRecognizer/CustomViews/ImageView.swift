//
//  ImageView.swift
//  handwritingRecognizer
//
//  Created by yiming on 4/6/23.
//

import SwiftUI

struct ImageView: View {
    var image: UIImage

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
