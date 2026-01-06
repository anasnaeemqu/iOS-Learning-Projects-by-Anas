//
//  WelcomePage.swift
//  OnboardingFLowPrac
//
//  Created by Meezotech Mac on 25/11/2025.
//

import SwiftUI

struct WelcomePage: View {
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundStyle(.tint)
                Image(systemName: "figure.2.and.child.holdinghands")
                    .font(.system(size: 60))
                    .foregroundStyle(Color.white)
            }
            
            Text("Welcome to my app")
                .font(.title)
                .fontWeight(.semibold)
                //.padding()
               // .border(.black, width: 1.5)
            
            Text("This App is just for practice and learning purposes")
                .font(.title2)
                .multilineTextAlignment(.center)
               // .border(.black, width: 1.5)

        }
       // .padding()
        //.border(.orange, width: 1.5)
        .padding()
       // .border(.black, width: 1.5)
    }
}

#Preview {
    WelcomePage()
}
