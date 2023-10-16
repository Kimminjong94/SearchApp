//
//  WriteReviewView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/10/04.
//
import PhotosUI
import SwiftUI

struct WriteReviewView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let addReview = UserData()

    @State var titleText: String
    @FocusState var isInputActive: Bool

    @State var selectedImage: [PhotosPickerItem] = []
    @Binding var data: Data?
    @State private var buttonTapped: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                topView()
                addReviewView()
            }
        }
    }
    
    @ViewBuilder
    func topView() -> some View {
        VStack(alignment: .leading) {
            HStack {
                Text("파랑새 정원")
                    .fontWeight(.bold)
                Spacer()
            }
            
            HStack {
                Text("2023.08.16 (수)")
                    .foregroundColor(.gray)
                    .font(.system(size: 10))
                Spacer()
            }
          
        }
        .padding(.horizontal)
        Spacer().frame(height: 10)
        
        VStack {
            Text("해당 장소에 대한 평점을 남겨주세요")
                .foregroundColor(.gray)
                .font(.system(size: 12))
            
            Button(action: {
                self.buttonTapped.toggle()

            }) {
                Image(self.buttonTapped == true ? "starImage" : "blankStar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)

            }
        }
        Image("detailLine")
            .resizable()
            .scaledToFit()
    
    }
    
    @ViewBuilder
    func addReviewView() -> some View {
        VStack {
            
            
            PhotosPicker(
                selection: $selectedImage,
                maxSelectionCount: 1,
                matching: .images) {
                  
                        Image("addPhotoButton")
                            .resizable()
                            .scaledToFit()
                            .padding()
                }
                .onChange(of: selectedImage) { newValue in
                    guard let item = selectedImage.first else {
                        return
                    }
                    
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                        case .success(let data):
                            if let data = data {
                                self.data = data
                            } else {
                                print("Data is nil")
                            }
                            
                        case .failure(let failure):
                            fatalError("\(failure)")
                        }
                    }
                
            }
            VStack(alignment: .leading) {
                
                HStack() {
                    if let data = data, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .cornerRadius(20)
                            
                    }
                    Spacer()
                }
               
                Spacer()
            
            
            TextField("리뷰를 작성해 주세요.", text: $titleText)
                .font(.system(size: 19))
                .foregroundColor(.black)
                .labelsHidden()
                .frame(height: 150, alignment: .top)
                .padding(.top, 10)
                .padding(.leading, 10)
                .cornerRadius(20)
                .background(RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(Color.gray, lineWidth: 1)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("완료") {
                            isInputActive = false
                            
    
                            print("Tapped")
                        }
                    }
                })
                .padding(.horizontal)

                }
            
            HStack {
                Spacer()
                Button(action: {
    //                isDismiss = false
                    
                    UserData.shared.userReview.append(UserReview(id: 14, profileImage: "profileImage", userName: "서도경", date: "10.13 금 / 1번째 방문", title: "빛나는 바다. 많이 보고 싶었어요.", image1: "", image2: "", data: self.data))
          
                    presentationMode.wrappedValue.dismiss()


                }) {
                    
                    Image("registerButton")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 40)
                    
                    
                }
                .padding(.horizontal)
            }
        }
        
    }
}

//struct WriteReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteReviewView()
//    }
//}
