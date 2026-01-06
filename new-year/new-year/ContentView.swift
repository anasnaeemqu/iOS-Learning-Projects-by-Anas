//
//  ContentView.swift
//  new-year
//
//  Created by Meezotech Mac on 31/12/2025.
//
import SwiftUI

struct ContentView: View {
    @State private var countdown = 10
    @State private var isTimerRunning = false
    @State private var showBoom = false
    @State private var timer: Timer?
    @State private var showRestart = false

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            // All main content (centered)
            if showBoom {
                VStack(spacing: 20) {
                    Text("💥 BOOM 💥")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.red)
                        .scaleEffect(showBoom ? 1.3 : 1.0)
                        .animation(.easeInOut(duration: 0.6).repeatForever(autoreverses: true), value: showBoom)
                    
                    Text("🎉 Happy New Year 2026 🎉")
                        .font(.title)
                        .foregroundColor(.yellow)
                        .transition(.scale)
                    
                    Text("by Engineer M Anas")
//                    Text("By Unit C to Everyone")
                        .font(.headline)
                        .foregroundColor(.white)
                        .opacity(0.8)
                }
            } else {
                VStack(spacing: 20) {
                    if isTimerRunning {
                        Text("⏳ \(countdown)")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    } else {
                        Button(action: startTimer) {
                            Text("Start Countdown")
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(12)
                        }
                    }
                }
            }

            // Restart button overlayed on top-left corner only
            if showRestart {
                VStack {
                    HStack {
                        Button(action: restartTimer) {
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .resizable()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.green)
                                .shadow(radius: 6)
                                .padding()
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .transition(.opacity)
                .animation(.easeIn(duration: 0.8), value: showRestart)
            }
        }
    }

    // MARK: - Timer Logic
    func startTimer() {
        countdown = 10
        isTimerRunning = true
        showBoom = false
        showRestart = false

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { t in
            if countdown > 1 {
                countdown -= 1
            } else {
                t.invalidate()
                isTimerRunning = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.spring()) {
                        showBoom = true
                    }
                    // 👇 Show restart after 5 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        withAnimation {
                            showRestart = true
                        }
                    }
                }
            }
        }
    }

    func restartTimer() {
        timer?.invalidate()
        withAnimation {
            showBoom = false
            showRestart = false
            isTimerRunning = false
            countdown = 10
        }
    }
}

#Preview {
    ContentView()
}
