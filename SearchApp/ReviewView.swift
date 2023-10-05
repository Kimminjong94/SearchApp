//
//  ReviewView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/09/25.
//

import SwiftUI

struct UserReview: Identifiable {
    let id: Int
    let profileImage: String
    let userName: String
    let date: String
    let title: String
    let image1: String
    let image2: String
    let data: Data?
}

class UserData {
    
    static let shared = UserData()

    var userReview: [UserReview] = [
        UserReview(id: 0, profileImage: "profileImage", userName: "그린이", date: "4.1 토 / 2번재 방문", title: "항상 또 오고 싶은 곳이에요~", image1: "", image2: "", data: nil),
        UserReview(id: 1, profileImage: "profileImage", userName: "asdf", date: "7.13", title: "손님이 많이 없어서 외로울까 걱정했는데 사장 언니만으로 충분!", image1: "reviewImage1", image2: "reviewImage2", data: nil),
        UserReview(id: 2, profileImage: "profileImage", userName: "asdf", date: "7.12", title: "safd", image1: "", image2: "", data: nil),
        UserReview(id: 3, profileImage: "profileImage", userName: "afdsfsd", date: "7.14", title: "dfas", image1: "reviewImage2", image2: "", data: nil)
    ]
}

struct ReviewView: View {

    
    let user: UserReview
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject private var vm = ContentViewViewModel()
    @FocusState var isInputActive: Bool
    @Binding var isActive: Bool
    @Binding var toMapView: Bool
    @Binding var falseProperty: Bool
    @Binding var toWriteReviewView: Bool
    @Binding var data: Data?

    @State var titleText: String

    var body: some View {
        ScrollView {
            VStack {
                topView()
                topTabbar()
                reviewMenu()
               
                Spacer()
                
                ScrollView {
                    VStack {
                        ForEach(UserData.shared.userReview.reversed()) { item in
                            UserReviewCollectionView(user: item)
                            
                        }
                    }
                }
                NavigationLink(destination: MapView( titleText: "\(user.title)", toMapDetailView: $falseProperty, isDismiss: $falseProperty ), isActive: $toMapView) {
                }
                
                NavigationLink(destination: WriteReviewView(titleText: "", data: $data), isActive: $toWriteReviewView) {
                    
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .onDisappear() {
            print("\(UserData.shared.userReview)")
//            userReview.userReview.append(UserReview(id: 4, profileImage: "profileImage", userName: "asdfd", date: "7월 12일", title: "ㅁㄴㅇㄹ", image1: "", image2: "", data: self.data))
        }
    }
    
    
    @ViewBuilder
    func topView() -> some View {
        HStack {
            Image("logoImage")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
            
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
                isActive = false
                presentationMode.wrappedValue.dismiss()

            }) {
                
                Image("xbutton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                
                
            }
            
            Button(action: {
            }) {
                Image("mikeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 40)
                
                
            }
        }
        .padding(.horizontal, 20)
    }
    
    @ViewBuilder
    func topTabbar() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .circular)
                            .overlay(  LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(height: 3)
                            .frame(maxWidth: .infinity)
                            .cornerRadius(20)
        
        Image("Tabbar")
            .resizable()
            .scaledToFill()
//        Image("reviewImage")
//            .resizable()
//            .scaledToFit()
        
        Button(action: {
            toMapView = true
           
        }) {
            Image("reviewImage")
                .resizable()
                .scaledToFit()
        }
        }
    
    @ViewBuilder
    func reviewMenu() -> some View {
        HStack {
            Text("방문자 리뷰")
                .fontWeight(.bold)
            Text("78")
            
            Spacer()
            
            Button(action: {
                toWriteReviewView = true

            }) {
                
                Image("writeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 30)

                
            }
        }
        .padding()

        
    }
}

struct UserReviewCollectionView: View {
    let user: UserReview
    @State var buttonTapped: Bool = false
    @State var disLikeButtonTapped: Bool = false
    
    var body: some View {
        
            VStack {
                HStack {
                    Image(user.profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
  
                    Text(user.userName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text(user.date)
                        .font(.subheadline)
                        .fontWeight(.regular)
                    
                    Spacer()
                }
                
                .padding(.horizontal, 20)
                
                
                HStack {
                    Text(user.title)
                    Spacer()
                }
                .padding(.horizontal, 20)
                
                HStack(spacing: 0) {
           
                    if user.data != nil {
                        
                        if let data = user.data, let uiImage = UIImage(data: data) {
                            Button(action: {
                                print("BUtton 1")

                            }) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .cornerRadius(12)
                                    .frame(height: 250)
                            }
                        }
                        
                        
                    }
                    
                    if user.image1 == "" && user.image2 == "" {
                        
                    } else if user.image2 == "" {
                        Button(action: {
                            print("BUtton 2")

                        }) {
                            Image(user.image1)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(12)
                                .frame(maxWidth: .infinity)

                        }
                        
                        
                    } else {
                        Button(action: {
                            print("BUtton 3")

                        }) {
                            Image(user.image1)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .frame(maxHeight: .infinity)
                        }
                        
                        Button(action: {
                            print("BUtton 5")
                        }) {
                            Image(user.image2)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(12)
                                .frame(maxHeight: .infinity)
                        }
            
                        
                        
                    }
                }
                .onAppear() {
                    
                }
                .padding(.horizontal, 20)
               
                HStack(spacing: 5) {
                    Button(action: {
                        self.buttonTapped.toggle()
//                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(self.buttonTapped == true ? "enabledLike" : "disabledLike")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)
                    }
                    
                    Button(action: {
                        self.disLikeButtonTapped.toggle()

//                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(self.disLikeButtonTapped == true ? "enabledDisLike" : "disAbledDisLike")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 17, height: 17)

                    }
                    
                    Spacer()
                    
                }
                .padding()
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .stroke(Color("myGray"))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                    .padding(.horizontal)
                

                
             
            }
           
        }
        
    
}
