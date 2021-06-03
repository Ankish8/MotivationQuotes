//
//  ContentView.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 01/06/21.
//

import SwiftUI
struct OnboardingScreen1: View {
    @State private var switchScreen: Bool = false
    var body: some View {
        ZStack {
            Image("onboardingScreen1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            Rectangle()
                .foregroundColor(Color(#colorLiteral(red: 0.03921568627, green: 0.4784313725, blue: 1, alpha: 0.5040751689)))
                
                
            Rectangle()
//                .frame(width: 316, height: 496, alignment: .center)
                .cornerRadius(26)
                .opacity(0.5)
                .padding(.horizontal, 30)
                .padding(.top, 136)
                .padding(.bottom, 180)
            VStack {
                Spacer()
                Spacer()
                Spacer()
                Image("OnboardingScreen1Logo")
                Spacer()
                Text("The secret of getting ahead is getting started")
                    .font(.system(size: 34))
                    .foregroundColor(.white)
                    .frame(width: 216, height: 200)
                    .multilineTextAlignment(.center)
                Spacer()
                Spacer()
                
                Image(systemName: "chevron.forward.circle")
                    .font(.system(size: 48, weight: .light))
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Spacer()
            }
                
            
            
        }
        .onTapGesture {
//            OnboardingScreen2()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreen1()
    }
}
