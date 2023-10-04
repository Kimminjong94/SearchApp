//
//  WriteReviewView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/10/04.
//
import PhotosUI
import SwiftUI

struct WriteReviewView: View {
    @State var titleText: String
    @FocusState var isInputActive: Bool

    @State var selectedImage: [PhotosPickerItem] = []
    @State var data: Data?
    
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
                
            }) {
                Image("blankStar")
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
            VStack {
                
                HStack() {
                    if let data = data, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 150)
                            .cornerRadius(15)
                            
                    }
                    Spacer()
                }
               
                Spacer()
            
            
            TextField("너무 좋아요", text: $titleText)
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
    //                presentationMode.wrappedValue.dismiss()
                    
                    

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
