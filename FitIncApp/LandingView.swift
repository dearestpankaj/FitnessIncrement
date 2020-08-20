//
//  ContentView.swift
//  FitIncApp
//
//  Created by Pankaj Sachdeva on 20/08/20.
//  Copyright © 2020 Pankaj Sachdeva. All rights reserved.
//

import SwiftUI

struct LandingView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: proxy.size.height * 0.2)
                Text("Fitness Increment")
                    .font(.system(size: 42, weight: .medium, design: .default))
                    .foregroundColor(.white)
                Spacer()
            }.frame(maxWidth:
                .infinity, maxHeight: .infinity)
                .background(Image("pull_rope")
                    .resizable()
                    .aspectRatio(contentMode: .fill))
                .edgesIgnoringSafeArea(.all)
        }
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
