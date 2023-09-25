//
//  ResultView.swift
//  SearchApp
//
//  Created by 김민종 on 2023/09/20.
//

import SwiftUI


struct ResultView: View {
    
    @Environment(\.presentationMode) var presentationMode

    
    @StateObject private var vm = ContentViewViewModel()
    @FocusState var isInputActive: Bool
    @Binding var isActive: Bool

    @State var titleText: String

    var body: some View {
        ScrollView {
            VStack {
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
                .padding(5)
               
                Spacer()
                RoundedRectangle(cornerRadius: 20, style: .circular)
                                    .overlay(  LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                                    .frame(height: 3)
                                    .frame(maxWidth: .infinity)
                                    .cornerRadius(20)
                
                Image("Tabbar")
                    .resizable()
                    .scaledToFill()
                   
                
                Spacer().frame(height: 100)

                textBox()
                                    
              

            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
       
    }
    
    @ViewBuilder
    func textBox() -> some View {
        
        VStack(alignment: .leading) {
            Text("'\(titleText ?? "")'에 대한 검색결과가 없습니다.")
                .overlay(
                    Text("'\(titleText ?? "")'").foregroundColor(.red),
                    alignment: .topLeading
                )
                .font(.system(size: 16, weight: .bold))
                .padding()
                .lineLimit(1)
                .frame(alignment: .leading)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(" ·  단어의 철자가 정확한지 확인해 주세요.")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .lineLimit(1)

                

                Text(" ·  검색어의 단어 수를 줄이거나, 다른 검색어로 검색해 보세요.")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .lineLimit(1)

                

                Text(" ·  보다 일반적인 검색어로 다시 검색해보세요.")
                    .foregroundColor(.gray)
                    .font(.system(size: 13, weight: .regular))
                    .lineLimit(1)

            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
       
            
       
    }
}

//struct ResultView_Preview: PreviewProvider {
//    static var previews: some View {
//        ResultView(isShowing: $isShowing, titleText: "")
//    }
//}
