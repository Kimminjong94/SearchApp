//
//  ContentView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/09/20.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ContentViewViewModel()
    @FocusState var isInputActive: Bool
    @State var isActive: Bool = false
    @State var toReviewView: Bool = false
    @State var stack = NavigationPath()
    @State private var isShowingResult = false


    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    topStackView()
                    Spacer().frame(height: 120)
                    
                    searchBlock()
                    NavigationLink(destination: ResultView(isActive: $isActive, titleText: "\(vm.nameInputText)"), isActive: $isActive) {
                    }
                    
                   
                    NavigationLink(destination: ReviewView(user: UserReview(id: 0, profileImage: "", userName: "", date: "", title: "", image1: "", image2: ""), isActive: $toReviewView, titleText: "\(vm.nameInputText)"), isActive: $toReviewView) {
                        
                    }

                    
                    
                    
                    Spacer()
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    func topStackView() -> some View {
        HStack {
            Image("menuIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
            Spacer()
        }
        .padding(5)
        .frame(maxWidth: .infinity)
    }
    
    @ViewBuilder
    func searchBlock() -> some View {
        VStack(spacing: 50) {
            
            HStack(spacing: 0) {
                Image("logoImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                
                
                
                TextField("검색어를 입력해주세요.", text: $vm.nameInputText)
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
                                if vm.nameInputText == "파랑새 정원" {
                                    self.toReviewView = true
                                   
                                    print("To Review View")

                                } else {
                                    self.isActive = true
                                    print("To Result View")


                                }
                                

                                print("Tapped")
                            }
                            
                        }
                    }
                    

                
                    .onChange(of: vm.nameInputText) { value in
                        vm.nameInputText = String(vm.nameInputText.prefix(24))
                    }
                    
                
                Button(action: {
//                    self.isActive = true
                }) {
                    Image("mikeImage")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 40)
                    
                    
                }
            }
            .padding()
            .frame(height: 55)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color.purple, lineWidth: 1.5)
            )
            
            Image("stackView")
                .resizable()
                .scaledToFit()
                .padding(10)
            
        }
        
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
