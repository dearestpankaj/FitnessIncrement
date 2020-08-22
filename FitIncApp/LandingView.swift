//
//  ContentView.swift
//  FitIncApp
//
//  Created by Pankaj Sachdeva on 20/08/20.
//  Copyright © 2020 Pankaj Sachdeva. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    @State private var isActive = false
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.18)
                    Text("Fitness Increment")
                        .font(.system(size: 42, weight: .medium, design: .default))
                        .foregroundColor(.white)
                    Spacer()
                    NavigationLink(destination: CreateView(), isActive: self.$isActive) {
                        Button(action: {
                            self.isActive = true
                        }){
                            HStack(spacing: 15) {
                                Spacer()
                                Image(systemName: "plus.circle")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                Text("Create a challenge")
                                    .font(.system(size: 24, weight: .semibold))
                                    .foregroundColor(.white)
                                Spacer()
                            }
                        } }
                        .padding(.horizontal, 15)
                        .buttonStyle(PrimaryButtonStyle())
                }.frame(maxWidth:
                    .infinity, maxHeight: .infinity)
                    .background(Image("pullRope")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .overlay(Color.black.opacity(0.4))
                        .frame(width: proxy.size.width)
                        .edgesIgnoringSafeArea(.all)
                )
                
            }
        }.accentColor(.primary)
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandingView()
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("iPhone 11 Pro Max")
            
            LandingView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
                .environment(\.colorScheme, .dark)
            
            LandingView()
                .previewDevice("iPhone 11 Pro")
                .previewDisplayName("iPhone 11 Pro")
                .environment(\.colorScheme, .dark)
        }
    }
}
