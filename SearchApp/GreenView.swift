//
//  GreenView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/10/06.
//

import SwiftUI

struct GreenView: View {
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 1
    var body: some View {
        VStack {
            Image("hoonImage2")
                .resizable()
                .scaledToFill()
                .scaleEffect(currentAmount + lastAmount)
                .gesture(
                    MagnificationGesture()
                        .onChanged { value in
                            currentAmount = value - 1
                        }
                        .onEnded { value in
                            lastAmount += currentAmount
                            currentAmount = 0
                        }
                )
        }
    }
}

struct GreenView_Previews: PreviewProvider {
    static var previews: some View {
        GreenView()
    }
}
