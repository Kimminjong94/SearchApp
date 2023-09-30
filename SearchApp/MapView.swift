//
//  MapView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/09/30.
//

import SwiftUI

struct MapView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var titleText: String
    @FocusState var isInputActive: Bool

    
    var body: some View {
        ScrollView {
            VStack {
                topView()
                
                mapImage()
                
                infoView()
            }
            .navigationBarBackButtonHidden(true)
            
                
            
        }
    }
    
    @ViewBuilder
    func topView() -> some View {
        HStack {
            Image("backButton")
                .resizable()
                .scaledToFit()
                .frame(width: 20, height: 20)
            
            TextField("", text: $titleText)
                .font(.system(size: 19))
                .foregroundColor(.black)
                .labelsHidden()
                .padding(.horizontal, 8)
                .cornerRadius(20)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("완료") {
                            isInputActive = false
                            
    
                            print("Tapped")
                        }
                    }
                }
            Button(action: {
//                isActive = false
                presentationMode.wrappedValue.dismiss()

            }) {
                
                Image("mikeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                
                
            }
            
            Button(action: {
            }) {
                Image("logoXbutton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                
                
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func mapImage() -> some View {
        Image("mapViewImage")
            .resizable()
            .scaledToFill()
    }
    
    @ViewBuilder
    func infoView() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center, spacing: 5) {
//                    LinearGradient(gradient: Gradient(colors: [.blue, .purple]),
//                                   startPoint: .leading,
//                                   endPoint: .trailing)
//                        .mask(Text("파랑새 정원"))
//                        .fontWeight(.bold)
                    
                   
                    Image("blueGardenText")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 30)

                    
                    Text("게스트 하우스")
                        .fontWeight(.regular)
                        .foregroundColor(.gray)
                        .font(.system(size: 10))
                    
                }
                
                Text("강원 강현면 물치리 동해로 45번길")
                    .fontWeight(.regular)
                    .font(.system(size: 12))

                    
                Text("방문자 리뷰 78")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                
                Text("☏ 010-0724-5633")
                    .font(.system(size: 12))
                
                HStack {
                    Button(action: {
                        
                    }) {
                        Image("startButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 30)

                    }
                    
                    Button(action: {
                        
                    }) {
                        Image("arrivedButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 30)

                    }
                }
            }
            
            Image("mapViewPhoto")
                .resizable()
                .scaledToFit()
                .padding()
        }
        .padding()
    }
    
}
