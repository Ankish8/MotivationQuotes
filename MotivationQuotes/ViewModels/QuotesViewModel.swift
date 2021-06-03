//
//  QuotesViewModel.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 02/06/21.
//

import Foundation
class QuotesViewModel: ObservableObject {
    @Published var quotes = [QuotesModel]()
    init() {
        // get the path to the json file whin the app bundle
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathString {
            
            // Create a url object
            let url = URL(fileURLWithPath: path)
            
            do {
                // Create a data objecy with the data at the url
                let data = try Data(contentsOf: url)
                
                // Parse the data
                let decoder = JSONDecoder()
                do {
                    let quoteData = try decoder.decode([QuotesModel].self, from: data)
                    for r in quoteData {
                        r.id = UUID()
                    }
                    self.quotes = quoteData
                }
                catch {
                    print(error)
                }
                
                
                
            } catch {
                print(error)
            }
        }
    }
}
