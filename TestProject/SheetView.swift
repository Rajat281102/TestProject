//
//  SheetView.swift
//  TestProject
//
//  Created by Babblu Bhaiya on 09/09/23.
//

import SwiftUI

struct SheetView: View {
    @State private var currentSheetIndex = 0
    @State private var showTransition = false
    
    var nextButtonColor: Color {
            if currentSheetIndex == 2 {
                return Color.black
            } else {
                return Color(hue: 0.257, saturation: 0.815, brightness: 0.737)
            }
        }

        var nextButtonText: String {
            if currentSheetIndex == 2 {
                return "CONFIRM"
            } else {
                return "NEXT"
            }
        }
    
    var body: some View {
        VStack {
            if currentSheetIndex == 0 {
                FirstSheetView(showTransition: $showTransition)
            } else if currentSheetIndex == 1 {
                SecondSheetView(showTransition: $showTransition)
            } else if currentSheetIndex == 2 {
                ThirdSheetView()
            }
            
            Button(action: {
                if currentSheetIndex < 2 {
                    currentSheetIndex += 1
                }
                showTransition = true
            }, label: {
                Text(nextButtonText)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(width: 300, height: 60)
            })
            .background(nextButtonColor)
            .cornerRadius(30)
            .padding(.top, 50)
        }
        .onAppear {
            withAnimation {
                showTransition = true
            }
        }
    }
}

struct FirstSheetView: View {
    @Binding var showTransition: Bool
    
    var body: some View {
            Rectangle()
                .frame(width: 180, height: 40)
                .transition(.move(edge: .top))
                .foregroundColor(Color.gray.opacity(0.3))
                .cornerRadius(10)
                .padding(.top, 50)
            
            HStack(spacing: 70.0) {
                    if showTransition {
                        CircleView()
                            .transition(.move(edge: .trailing))
                            .animation(.easeInOut(duration: 1.0))
                        CircleView()
                            .transition(.move(edge: .trailing))
                            .animation(.easeInOut(duration: 1.0))
                    }
            }
            .padding(.top, 10)
            
            HStack(spacing: 25.0) {
                if showTransition {
                    BigReactangleView()
                        .animation(.easeInOut(duration: 1.0))
                        .transition(.move(edge: .trailing))
                    BigReactangleView()
                        .animation(.easeInOut(duration: 1.0))
                        .transition(.move(edge: .trailing))
                }
            }
            .padding(.top, 10)
            
            HStack(spacing: 50.0) {
                if showTransition {
                    SmallReactangleView()
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 1.0))
                    SmallReactangleView()
                        .transition(.move(edge: .trailing))
                        .animation(.easeInOut(duration: 1.0))
                }
            }
            .padding(.top, 5)
    }
}

struct CircleView: View {
    var body: some View {
        Circle()
            .frame(width: 90)
            .foregroundColor(Color.gray.opacity(0.3))
    }
}

struct BigReactangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 120, height: 25)
            .foregroundColor(Color.gray.opacity(0.3))
            .cornerRadius(5)
    }
}

struct SmallReactangleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 90, height: 20)
            .foregroundColor(Color.gray.opacity(0.3))
            .cornerRadius(5)
    }
}

struct SecondSheetView: View {
    @Binding var showTransition: Bool
    
    var body: some View {
        if showTransition {
            SecondSheetRectangleView()
                .frame(width: 200, height: 40)
                .padding(.top)
            
            SecondSheetRectangleView()
                .frame(width: 140, height: 25)
                .padding(.top, 30)
        }
        HStack(spacing: 30) {
            if showTransition {
                SecondSheetCircleView()
                    .foregroundColor(.green)
                SecondSheetCircleView()
                    .foregroundColor(Color.gray.opacity(0.3))
                SecondSheetCircleView()
                    .foregroundColor(Color.gray.opacity(0.3))
            }
        }
        .padding(.top, 15)
        if showTransition {
            WalletBalanceView()
                .padding(.top, 20)
        }
    }
}

struct SecondSheetRectangleView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.gray.opacity(0.3))
            .cornerRadius(6)
    }
}

struct SecondSheetCircleView: View {
    var body: some View {
        Circle()
            .frame(width: 70)
            .overlay {
                Text("5")
                    .foregroundColor(.white)
            }
    }
}

struct WalletBalanceView: View {
    var body: some View {
        HStack {
            Text("Wallet Balance:")
                .fontWeight(.light)
            SecondSheetRectangleView()
                .frame(width: 70, height: 25)
            Spacer()
            SecondSheetRectangleView()
                .frame(width: 50, height: 28)
            SecondSheetRectangleView()
                .frame(width: 20, height: 21)
        }
        .padding(.horizontal, 30)
    }
}

struct ThirdSheetView: View {
    var body: some View {
        VStack {
            Text("Ready To Play?")
                .font(.system(size: 15))
                .fontWeight(.semibold)
                .padding(.top)
            
            Text("OSWALD")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .padding(.top, 2)
            HStack {
                SecondSheetRectangleView()
                    .frame(width: 90, height: 30)
                
                SecondSheetRectangleView()
                    .frame(width: 50, height: 30)
            }
            .padding(.top, 2)
            
            HStack(spacing: 20) {
                Rectangle()
                    .frame(width: 70, height: 50)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .cornerRadius(25)
                
                Rectangle()
                    .frame(width: 70, height: 50)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .cornerRadius(25)
                
                Rectangle()
                    .frame(width: 70, height: 50)
                    .foregroundColor(Color.gray.opacity(0.3))
                    .cornerRadius(25)
            }
            .padding(.top, 8)
            
            WalletBalanceView()
                .padding(.top, 38)
        }
    }
}

struct SheetView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
