//
//  SecondScreen.swift
//  TestProject
//
//  Created by Babblu Bhaiya on 08/09/23.
//

import SwiftUI

struct SecondScreen: View {
    @State private var isSheetPresented = false
    @State var showAnimation: Bool = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
            VStack {
                HeaderView(showAnimation: $showAnimation)
                
                TextView()
                
                ScrollCardView(showAnimation: $showAnimation)
                
                DownloadButtonView(isSheetPresented: $isSheetPresented)
            }
            .navigationBarBackButtonHidden()
            .onAppear {
                withAnimation {
                    showAnimation = true
                }
            }
    }
}

struct HeaderView: View {
    @Binding var showAnimation: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        if showAnimation {
            HStack(alignment: .top) {
                Rectangle()
                    .frame(width: 110, height: 110)
                    .foregroundColor(Color(hue: 0.163, saturation: 1.0, brightness: 0.907))
                    .cornerRadius(10)
                    .padding(.trailing)
                
                Text("Candy \n Bust")
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                    .padding(.top)
                Spacer()
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .rotationEffect(Angle.degrees(0))
                        .foregroundColor(.black)
                    
                })
                .padding(.top)
            }
            .padding(.horizontal, 25)
            .padding(.top, 30)
            .padding(.bottom)
            .transition(.move(edge: .top))
        }
    }
}

struct TextView: View {
    var body: some View {
        Text("Hey How are you ? Hey How are you ? Hey How are you ? Hey How are you ? ?")
            .fontWeight(.semibold)
            .padding(.horizontal, 25)
            .padding(.bottom)
        
        Button(action: {
            
        }, label: {
            Text("READ MORE")
                .foregroundColor(.green)
        })
    }
}

struct ScrollCardView: View {
    @Binding var showAnimation: Bool
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(0..<20) { _ in
                    if showAnimation {
                        Rectangle()
                            .transition(.move(edge: .trailing))
                            .frame(width: 300, height: 400)
                            .foregroundColor(Color.gray.opacity(0.4))
                    }
                }
            }
        }
        .transition(.move(edge: .trailing))
    }
}

struct DownloadButtonView: View {
    @Binding var isSheetPresented: Bool
    
    var body: some View {
        Button(action: {
            isSheetPresented = true
        }, label: {
            Rectangle()
                .foregroundColor(Color(hue: 0.257, saturation: 0.815, brightness: 0.737))
                .frame(height: 80)
                .cornerRadius(40)
                .padding(.horizontal)
                .padding(.bottom)
                .overlay {
                    Text("DOWNLOAD \n 30 MB")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
        })
        .padding(.top, 30)
        .sheet(isPresented: $isSheetPresented) {
            SheetView()
                .presentationDetents([.medium])
        }
    }
}

struct SecondScreen_Previews: PreviewProvider {
    static var previews: some View {
        SecondScreen()
    }
}
