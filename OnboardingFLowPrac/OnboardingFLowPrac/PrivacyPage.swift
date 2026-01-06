//
//  PrivacyPage.swift
//  OnboardingFLowPrac
//
//  Created by Meezotech Mac on 01/12/2025.
//

import SwiftUI

struct PrivacyPage: View {
    var body: some View {
        VStack(alignment: .center){
            Text("Your data, your control.")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top, 100)
                .padding(.bottom, 50)
            HStack(spacing: 16){
                FeatureCard(iconName: "lock.shield.fill", description: "Secure Data")
                FeatureCard(iconName: "brain.head.profile", description: "Smart Ai")
                
            }
            .padding(.horizontal)
            HStack{
                FeatureCard(iconName: "icloud.and.arrow.up.fill", description: "Cloud Sync")
                    .padding()
            }
            Spacer()
            .padding(.top, 10)
            Button(action: {
                print("Get started")
            }){
                Text("Get started")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(12)
                    .padding(.horizontal, 12)
            }
            .padding(.top, 20)
            Spacer()
        }
        }
    }

#Preview {
    PrivacyPage()
        .frame(maxHeight: .infinity)
        .background(Gradient(colors: gradientColors))
        .foregroundStyle(.white)
}
