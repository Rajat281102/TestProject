//
//  ContentView.swift
//  TestProject
//
//  Created by Babblu Bhaiya on 08/09/23.
//

import SwiftUI

struct FirstScreen: View {
    @State private var showSecondScreen: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("PLAY")
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                    .padding(.top)
                ScrollView {
                    ForEach(0..<20, id: \.self) { _ in
                        CardView(showSecondScreen: $showSecondScreen)
                            .padding(.vertical)
                    }
                }
                
                NavigationLink(destination: SecondScreen(), isActive: $showSecondScreen) {
                    EmptyView()
                }
            }
        }
    }
}

struct CardView: View {
    @Binding var showSecondScreen: Bool
    
    var body: some View {
        Button(action: {
            showSecondScreen = true
        }, label: {
            ZStack() {
                Color.orange
                VStack {
                    HStack {
                        Rectangle()
                            .foregroundColor(Color(hue: 0.163, saturation: 0.96, brightness: 0.969))
                            .frame(width: 100, height: 100)
                            .cornerRadius(15)
                            .padding(.top, 30)
                            .padding(.horizontal)
                        Spacer()
                    }
                    Spacer()
                    Button(action: {
                        showSecondScreen = true
                    }, label: {
                       Rectangle()
                            .foregroundColor(Color(hue: 0.294, saturation: 0.79, brightness: 0.749))
                            .frame(height: 60)
                            .cornerRadius(30)
                            .padding(.horizontal)
                            .padding(.bottom)
                    })
                }
            }
            .frame(height: 500)
            .cornerRadius(35)
        })
        .padding(.horizontal, 30)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
