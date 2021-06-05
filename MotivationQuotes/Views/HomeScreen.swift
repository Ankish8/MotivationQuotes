//
//  HomeScreen.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 02/06/21.
//

import SwiftUI

// MARK: HomeScreen View
struct HomeScreen: View {
    @EnvironmentObject var quotesVM: QuotesViewModel
    @State var offset: CGSize = .zero
    @State var isSheet = false
    @State var isHeart = false

    var body: some View {
        ZStack {
            backgroundView()
                .frame(minWidth: 0)
            VStack {
                HStack {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "chevron.left")
                            .font(.title)
                    })
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "gearshape")
                            .font(.title)
                    })
                }
                
                Spacer()
                QuotesView()
                    .offset(offset)
                    .gesture(DragGesture()
                                .onChanged { value in
                                    withAnimation {
                                        offset = value.translation
                                    }
                                }
                    )
                
                Spacer()
                HStack {
                    Image(systemName: isHeart ? "heart" : "heart.fill")
                        .font(.system(size: 28))
                        .scaleEffect(isHeart ? 1 : 1.2)
                        .foregroundColor( isHeart ? Color.white : Color.red)
                        .onTapGesture {
                            isHeart.toggle()
                        }
                        .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0))
//                        .animation(.interpolatingSpring(stiffness: 350, damping: 5, initialVelocity: 10))

                        
                    Spacer()
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 28))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                        
                    
                    Button(action: {
                        isSheet.toggle()
                    }, label: {
                        HStack {
                            Image(systemName: "square.grid.2x2")
                            Text("Happy")
                                
                        }
                    })
                    .padding()
                    .background(Color(#colorLiteral(red: 1, green: 0.1764705882, blue: 0.3333333333, alpha: 1)))
                    .cornerRadius(12)
                
                    
}
            }
            .frame(minWidth: 0)
            .padding()
            .accentColor(.white)
        }
        .sheet(isPresented: $isSheet, content: {
            CategoryView()
        })
    }
}

// MARK: Background View
struct backgroundView: View {
    var body: some View {
        ZStack {
//            Color.black
//                .ignoresSafeArea()
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.5333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7137254902, green: 0.1254901961, blue: 0.8784313725, alpha: 1))]), startPoint: UnitPoint(x: 1.4, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                .frame(width: 555, height: 595)
                .rotationEffect(.degrees(-27))
                .offset(x: 200, y: -108)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.5333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7137254902, green: 0.1254901961, blue: 0.8784313725, alpha: 1))]), startPoint: UnitPoint(x: 1.4, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                .frame(width: 555, height: 595)
                .rotationEffect(.degrees(-20))
                .offset(x: 200, y: -108)
                .opacity(0.58)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.5333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7137254902, green: 0.1254901961, blue: 0.8784313725, alpha: 1))]), startPoint: UnitPoint(x: 1.4, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                .frame(width: 555, height: 595)
                .rotationEffect(.degrees(-14))
                .offset(x: 200, y: -108)
                .opacity(0.48)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.5333333333, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7137254902, green: 0.1254901961, blue: 0.8784313725, alpha: 1))]), startPoint: UnitPoint(x: 1.4, y: 0), endPoint: UnitPoint(x: 0, y: 1)))
                .frame(width: 555, height: 595)
                .rotationEffect(.degrees(-8))
                .offset(x: 200, y: -108)
                .opacity(0.38)


        }
    }
    
}



// MARK: Preview
struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
            .preferredColorScheme(.dark)
            .environmentObject(QuotesViewModel())
    }
}


