//
//  CategoryView.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 05/06/21.
//

import SwiftUI

struct CategoryView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 48.0) {
                    HStack(spacing: 32.0) {
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Sad")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Funny")
                        }
                        
                    }
                    HStack(spacing: 32.0) {
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Life")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        
                    }
                    HStack(spacing: 32.0) {
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        VStack {
                            RoundedRectangle(cornerRadius: 22)
                                .frame(width: 83, height: 83, alignment: .center)
                            Text("Happy")
                        }
                        
                    }
                }
                .padding(.top, 48)
                
                
                    
            }
            .navigationTitle("Categories")
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
            .preferredColorScheme(.dark)
    }
}
