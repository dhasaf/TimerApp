//
//  ContentView.swift
//  Day5TimerApp
//
//  Created by Dhai Alassaf on 19/08/1445 AH.
//
import SwiftUI

struct ContentView: View {
    @State private var timeRemaining = 60 // For a 60 seconds timer
    @State private var timerRunning = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Text("\(timeRemaining) seconds")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .padding()
                .background(.gray)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal)
                .shadow(radius: 5)
            
            HStack(spacing: 30) { // Adds space between buttons
                Button(action: startTimer) {
                    Image(systemName: "play.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50) // Adjust size as needed
                        .foregroundColor(.blue)
                }
                .padding()
                .background(timerRunning ? Color.gray : Color.white) // Changes background color based on state
                .clipShape(Circle())
                .disabled(timerRunning)
                .shadow(radius: 5) // Adds a subtle shadow for depth

                Button(action: stopTimer) {
                    Image(systemName: "pause.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50) // Adjust size as needed
                        .foregroundColor(.blue)
                }
                .padding()
                .background(!timerRunning ? Color.gray : Color.white) // Changes background color based on state
                .clipShape(Circle())
                .disabled(!timerRunning)
                .shadow(radius: 5) // Adds a subtle shadow for depth

                Button(action: resetTimer) {
                    Image(systemName: "arrow.uturn.forward.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50) // Adjust size as needed
                        .foregroundColor(.blue)
                }
                .padding()
                .background(Color.white) // Default background color
                .clipShape(Circle())
                .shadow(radius: 5) // Adds a subtle shadow for depth
            }
            .padding() // Adds padding around the HStack
            .background(Color.secondary.opacity(0.1)) // Adds a semi-transparent background to the bar
            .cornerRadius(20) // Rounds the corners of the background
            .padding() // Adds more padding around the entire control bar to set it off from other UI elements

        }
        .onReceive(timer) { _ in
            if timerRunning && timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
    }
    func startTimer() {
        timerRunning = true
    }
    
    func stopTimer() {
        timerRunning = false
    }
    
    func resetTimer() {
        timeRemaining = 60 // Reset to original time
        timerRunning = false
    }
}
    
#Preview {
        ContentView()
        .preferredColorScheme(.dark)
    }

