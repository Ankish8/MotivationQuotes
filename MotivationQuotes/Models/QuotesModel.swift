//
//  QuotesModel.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 02/06/21.
//

import Foundation
class QuotesModel: Identifiable, Decodable {
    var id:UUID?
    var quote = ""
}
