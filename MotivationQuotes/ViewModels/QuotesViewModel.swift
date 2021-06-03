//
//  QuotesViewModel.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 02/06/21.
//

import Foundation
class QuotesViewModel: ObservableObject {
    @Published var quotes: [QuotesModel] = [QuotesModel(quote: "This is a Sample Quote 1"),
                                            QuotesModel(quote: "This is a Sample Quote 2"),
                                            QuotesModel(quote: "This is a Sample Quote 3"),
                                            QuotesModel(quote: "This is a Sample Quote 4"),
                                            QuotesModel(quote: "This is a Sample Quote 5"),
                                            QuotesModel(quote: "This is a Sample Quote 6"),
                                            QuotesModel(quote: "This is a Sample Quote 7")
    ]
    @Published var quoteCount: Int = 0
}
