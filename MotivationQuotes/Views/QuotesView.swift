//
//  testView.swift
//  MotivationQuotes
//
//  Created by Ankish Khatri on 03/06/21.
//

import SwiftUI

// MARK: Quotes View
struct QuotesView: View {
    @EnvironmentObject var quotesVM: QuotesViewModel
//    lazy var totalCount = quotesVM.quotes.count
    var body: some View {
        LazyHStack(alignment: .center, spacing: 30) {
            ForEach(quotesVM.quotes) { i in
                ForEach(quotesVM.quotes, content: { item in
                    if item.Category == "Sad" {
                        VStack {
                            HStack {
                                Image("appostphy")
                                Spacer()
                            }
                            
                            .padding(.horizontal)
                            InnerQuoteView(item: item)
                        }
                        .frame(width: 350, height: 400, alignment: .center)
                        .cornerRadius(10)
                    }
                })
                
            }
        }
        .modifier(ScrollingHStackModifier(items: quotesVM.quotes.count, itemWidth: 350, itemSpacing: 30))
        
    }
}

// MARK: InnerQuote View
struct InnerQuoteView: View {
    @EnvironmentObject var quotesVM: QuotesViewModel
    let item: QuotesModel
    var body: some View {
            Text(item.quote)
                    .font(.system(size: 28))
                    .lineSpacing(8)
                    .padding()
                
        
    }
}




//MARK: Custom Modifier
struct ScrollingHStackModifier: ViewModifier {
    
    @State private var scrollOffset: CGFloat
    @State private var dragOffset: CGFloat
    
    var items: Int
    var itemWidth: CGFloat
    var itemSpacing: CGFloat
    
    init(items: Int, itemWidth: CGFloat, itemSpacing: CGFloat) {
        self.items = items
        self.itemWidth = itemWidth
        self.itemSpacing = itemSpacing
        
        // Calculate Total Content Width
        let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
        let screenWidth = UIScreen.main.bounds.width
        
        // Set Initial Offset to first Item
        let initialOffset = (contentWidth/2.0) - (screenWidth/2.0) + ((screenWidth - itemWidth) / 2.0)
        
        self._scrollOffset = State(initialValue: initialOffset)
        self._dragOffset = State(initialValue: 0)
    }
    
    func body(content: Content) -> some View {
        content
            .offset(x: scrollOffset + dragOffset, y: 0)
            .gesture(DragGesture()
                        .onChanged({ event in
                            dragOffset = event.translation.width
                        })
                        .onEnded({ event in
                            // Scroll to where user dragged
                            scrollOffset += event.translation.width
                            dragOffset = 0
                            
                            // Now calculate which item to snap to
                            let contentWidth: CGFloat = CGFloat(items) * itemWidth + CGFloat(items - 1) * itemSpacing
                            let screenWidth = UIScreen.main.bounds.width
                            
                            // Center position of current offset
                            let center = scrollOffset + (screenWidth / 2.0) + (contentWidth / 2.0)
                            
                            // Calculate which item we are closest to using the defined size
                            var index = (center - (screenWidth / 2.0)) / (itemWidth + itemSpacing)
                            
                            // Should we stay at current index or are we closer to the next item...
                            if index.remainder(dividingBy: 1) > 0.5 {
                                index += 1
                            } else {
                                index = CGFloat(Int(index))
                            }
                            
                            // Protect from scrolling out of bounds
                            index = min(index, CGFloat(items) - 1)
                            index = max(index, 0)
                            
                            // Set final offset (snapping to item)
                            let newOffset = index * itemWidth + (index - 1) * itemSpacing - (contentWidth / 2.0) + (screenWidth / 2.0) - ((screenWidth - itemWidth) / 2.0) + itemSpacing
                            
                            // Animate snapping
                            withAnimation {
                                scrollOffset = newOffset
                            }
                            
                        })
            )
    }
}

// MARK: Preview
struct testView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
            .environmentObject(QuotesViewModel())
            .preferredColorScheme(.dark)
    }
}
