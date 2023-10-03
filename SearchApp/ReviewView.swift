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

   
}

struct ReviewView: View {
    
    let userReview: [UserReview] = [
        UserReview(id: 0, profileImage: "profileImage", userName: "나무 인생", date: "7.11", title: "한적한 분위기 너무 좋아요! 또 오고 싶어요!", image1: "", image2: ""),
        UserReview(id: 1, profileImage: "profileImage", userName: "asdf", date: "7.13", title: "손님이 많이 없어서 외로울까 걱정했는데 사장 언니만으로 충분!", image1: "reviewImage1", image2: "reviewImage2"),
    UserReview(id: 2, profileImage: "profileImage", userName: "asdf", date: "7.12", title: "safd", image1: "", image2: ""),
        UserReview(id: 3, profileImage: "profileImage", userName: "afdsfsd", date: "7.14", title: "dfas", image1: "reviewImage2", image2: "")
    ]
    
    let user: UserReview
    
    @Environment(\.presentationMode) var presentationMode

    @StateObject private var vm = ContentViewViewModel()
    @FocusState var isInputActive: Bool
    @Binding var isActive: Bool
    @Binding var toMapView: Bool
    @Binding var falseProperty: Bool

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
                        ForEach(userReview) { item in
                            UserReviewCollectionView(user: item)
                            
                        }
                    }
                }
                NavigationLink(destination: MapView( titleText: "\(user.title)", toMapDetailView: $falseProperty ), isActive: $toMapView) {
                }
            }

        }
        .navigationBarBackButtonHidden(true)
        .onAppear() {
            print("\(toMapView)")

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
                isActive = false
                presentationMode.wrappedValue.dismiss()

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
                    
                    if user.image1 == "" && user.image2 == "" {
                        
                    } else if user.image2 == "" {
                        Image(user.image1)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(12)
                            .frame(maxWidth: .infinity)

                    } else {
                        Image(user.image1)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .frame(maxHeight: .infinity)
                        
                        Image(user.image2)
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .frame(maxHeight: .infinity)
                    }
                }
                .padding(.horizontal, 20)
               
                
                
                HStack(spacing: 10) {
                    Button(action: {
                        self.buttonTapped.toggle()
//                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(self.buttonTapped == true ? "likeButton" : "likeButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                    }
                    
                    Button(action: {
                        self.disLikeButtonTapped.toggle()

//                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(self.disLikeButtonTapped == true ? "disLikeTapped" : "disLikeButton")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)

                    }
                    
                    Spacer()
                    
                }
                .padding()
                
                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .stroke(Color.gray)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
            }
        }
    
}

//
//struct Review_Previews: PreviewProvider {
//    static var previews: some View {
//        @State var isActive = true
//
//        ReviewView(user: <#UserReview#>, isActive: $isActive, titleText: "파랑새 정원")
//    }
//}
