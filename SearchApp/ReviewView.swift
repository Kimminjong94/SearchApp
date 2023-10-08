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
        UserReview(id: 0, profileImage: "profileImage", userName: "그린이", date: "4.1.토 / 2번째 방문", title: "항상 또 오고 싶은 곳이에요~", image1: "greenImage1", image2: "greenImage2", data: nil),
        UserReview(id: 1, profileImage: "profileImage", userName: "apxkzpdl", date: "4.6.목 / 1번째 방문", title: "너무 편안하게 잘 쉬다가 갑니다~\n사진보다 넓고 너무 예뻐요!!!\n사장님 너무 친절해서 좋아용~", image1: "", image2: "", data: nil),
        UserReview(id: 2, profileImage: "profileImage", userName: "낭만도르", date: "4.24.월 / 1번째 방문", title: "만들어주신 식사 너무 맛있었어요! 엄마 밥 같아요!", image1: "reviewImage1", image2: "reviewImage2", data: nil),
        UserReview(id: 3, profileImage: "profileImage", userName: "솔라시도레미", date: "4.27.목 / 1번째 방문", title: "바다뷰 넘 좋아요~", image1: "solaImage", image2: "", data: nil),
        UserReview(id: 4, profileImage: "profileImage", userName: "샛별", date: "5.1.월 / 3번째 방문", title: "뷰도 좋고 아기자기하게 숙소가 넘 이뻐용~\n넘 만족해서 또또또간집입니다!", image1: "", image2: "", data: nil),
        UserReview(id: 5, profileImage: "profileImage", userName: "정수스", date: "5.5.금 / 1번째 방문", title: "사진만으로 보고 너무 가보고 싶었던 곳인데, 막상 가서 보니 더\n예쁘더라고요! 근데 사진을 못 남긴.. ㅠㅠ 눈에 가득 담아 갑니다~\n멋진 풍경 감사해요~~", image1: "", image2: "", data: nil),
        UserReview(id: 6, profileImage: "profileImage", userName: "훈또로롱", date: "5.25.목 / 1번째 방문", title: "다음에 또 오고 싶어요. 세심함이 느껴지는 따뜻한 곳이었습니다~", image1: "hoonImage1", image2: "hoonImage2", data: nil),
        UserReview(id: 7, profileImage: "profileImage", userName: "루루미미미", date: "6.1.목 / 1번째 방문", title: "부모님 모시고 강아지까지 정말 만족하고 잘 지내다 왔어요!:D\n오래된 건물이긴 하지만 있을거 다 있고 편안하게 잘 놀다갑니다!\n깨끗하게 청소와 정리도 되어있고, 어지간한건 전부 다 구비되어\n있어서 내 집같은 편안함…? 인테리어랑 조명도 아기자기 너무 예뻐요.", image1: "happyImage1", image2: "happyImage2", data: nil),
        UserReview(id: 8, profileImage: "profileImage", userName: "김라이", date: "6.13.화 / 1번째 방문", title: "너무 행복했던 여행이었어요! 우연히 방문하게 됐는데, 또 올게요!", image1: "laiImage", image2: "", data: nil),
        UserReview(id: 9, profileImage: "profileImage", userName: "뿌뿌뿌", date: "6.28.수 / 1번째 방문", title: "한적해서 찾아왔는데 너무 심심하긴 했어요..", image1: "", image2: "", data: nil),
        UserReview(id: 10, profileImage: "profileImage", userName: "배츄리몬", date: "7.1.토 / 1번째 방문", title: "바다가 보이는 곳이라 너무 예쁜 것 같아요! 사진보다 훨씬 넓고 엄청\n예쁩니다.. 보통 사진이 더 예쁜 곳이 많은데.. 여긴 완전 실물파 ♥\n시설소 깔끔하고 분위기도 너무 좋아요.. 최고최고!\n매년 여름 또 오고 싶은 곳입니다! 행복한 시간 보내고 갑니다!\n(사장님 너무 예쁘고 친절하세요.. 최고최고)", image1: "", image2: "", data: nil),
        UserReview(id: 11, profileImage: "profileImage", userName: "100만 볼트", date: " 7.2.일 / 2번째 방문", title: "작년에 이어 올해도 재방했어요! 사장님 넘 이뻐요!", image1: "boltImage", image2: "", data: nil),
        UserReview(id: 12, profileImage: "profileImage", userName: "김남산", date: "7.12.수 / 1번째 방문", title: "손님이 많이 없어서 외로울까 걱정했는데 사장 언니만으로 충분!", image1: "namsanImage1", image2: "namsanImage2", data: nil),
        UserReview(id: 13, profileImage: "profileImage", userName: "나무인생", date: "7.27.목 / 1번째 방문", title: "한적한 분위기 너무 좋아요! 또 오고 싶어요!", image1: "", image2: "", data: nil)

        
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
    
    @Binding var toGreenView: Bool

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
                
//                NavigationLink(destination: WriteReviewView(titleText: "", data: $data), isActive: $toWriteReviewView) {
//
//                }
                
               

            }

        }
        .navigationBarBackButtonHidden(true)
        .onDisappear() {
//            print("\(UserData.shared.userReview)")
            print("toMapView = \(toMapView)")
            print("toWriteReviewView = \(toWriteReviewView)")

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
            toWriteReviewView = false
           
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
                toMapView = false

            }) {
                
                Image("writeButton")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 30)

                
            }
        }
        .padding(.horizontal)

        
    }
}

struct UserReviewCollectionView: View {
    let user: UserReview
    @State var buttonTapped: Bool = false
    @State var disLikeButtonTapped: Bool = false
    @State var toGreenView: Bool = false
    
    var body: some View {
        
            VStack {
                Spacer()
                
                HStack {
                    Image(user.profileImage)
                        .resizable()
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
  
                    Text(user.userName)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text(user.date)
                        .font((.system(size: 12)))
                        .foregroundColor(.gray)
                        .fontWeight(.regular)
                    
                    Spacer()
                }
                .padding(.horizontal, 23)
                
                HStack {
                    Text(user.title)
                        .font((.system(size: 13)))

                    Spacer()
                }
                .padding(.horizontal, 25)
                Spacer()
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
                            print("여기서 보내야됨 ")
                            self.toGreenView = true
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
                            .frame(width: 40, height: 40)
                    }
                    
                    Button(action: {
                        self.disLikeButtonTapped.toggle()

//                        presentationMode.wrappedValue.dismiss()

                    }) {
                        Image(self.disLikeButtonTapped == true ? "enabledDisLike" : "disAbledDisLike")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)

                    }

                    
                    Spacer()
                    
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 5)

                RoundedRectangle(cornerRadius: 20, style: .circular)
                    .stroke(Color("myGray"))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(20)
                    .padding(.horizontal)
                

                
             
            }
        
        NavigationLink(destination: GreenView(), isActive: $toGreenView) {
            
        }
           
        }
        
    
}
