//
//  MapDetailView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/10/03.
//

import SwiftUI

struct MapDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var title: String
    @FocusState var isInputActive: Bool
    @Binding var isDismiss: Bool

    
    var body: some View {
        ScrollView {
            VStack {
                topView()
                infoView()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func topView() -> some View {
        VStack {
            HStack {
                Image("mapArrow")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)

                VStack {
                                    Image("mapDetailNow")
                                        .resizable()
                                        .scaledToFit()
                                    Image("mapDetailBlue")
                                        .resizable()
                                        .scaledToFit()
                    
//                    TextField("", text: $title)
//                        .font(.system(size: 19))
//                        .foregroundColor(.black)
//                        .labelsHidden()
//                        .padding(.horizontal, 8)
//                        .cornerRadius(20)
//                        .focused($isInputActive)
//                        .toolbar {
//                            ToolbarItemGroup(placement: .keyboard) {
//                                Spacer()
//                                Button("완료") {
//                                    isInputActive = false
//
//
//                                    print("Tapped")
//                                }
//                            }
//                        }
                    
            
                }
                
                Button(action: {
                    isDismiss = false
                    presentationMode.wrappedValue.dismiss()

                }) {
                    
                    Image("logoXbutton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 40)
                    
                    
                }
               

                
            }
            .padding(.horizontal)
            
            
            
            Image("mapDetailTopTabbar")
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            Image("mapDetailImage")
                .resizable()
                .scaledToFit()
            
        }
    }
    
    
    @ViewBuilder
    func infoView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center, spacing: 5) {
                   
                    Image("blueGardenText")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 30)

                    
                    Text("게스트 하우스")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                    
                }
                
                Text("강원 강현면 물치리 동해로 45번길 8")
                    .fontWeight(.regular)
                    .font(.system(size: 12))

                    
                Text("방문자 리뷰 78")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                
                Text("☏ 010-0933-9005")
                    .font(.system(size: 12))
                
            }
            
            HStack {
                Image("mapViewPhoto")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
}
