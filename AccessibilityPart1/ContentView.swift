//
//  ContentView.swift
//  AccessibilityPart1
//
//  Created by Sree on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var value = 10
    let pictures = [
    "ales-krivec-15949",
    "galina-n-189483",
    "kevin-horstmann-141705",
    "nicolas-tissot-335096"
    ]
    let labels  = [
    "Tulips",
    "Frozen tree buds",
    "Sunflowers",
    "Fireworks"
    ]
    @State private var selectedPicture = Int.random(in: 0...3)
    
    var body: some View {
        VStack {
            Image(pictures[selectedPicture]).resizable().scaledToFit().onTapGesture{
                selectedPicture = Int.random(in: 0...3)
            }.accessibilityLabel(labels[selectedPicture])
                .accessibilityAddTraits(.isButton)
                .accessibilityRemoveTraits(.isImage)
            // Hiding images in voice over
            Image(decorative: "nicolas-tissot-335096").accessibilityHidden(true)
            
            VStack {
                Text("Your score is ")
                Text("1000").font(.title)
            }.accessibilityElement(children: .combine)
            // Or Hide .combine and Add Label
            
            VStack {
                Text("Value:\(value)")
                
                Button("Increment"){
                    value += 1
                }
                Button("Decrement"){
                    value -= 1
                }
            }.accessibilityElement()
                .accessibilityLabel("Value").accessibilityValue(String(value)).accessibilityAdjustableAction { direction in
                    switch direction {
                    case .increment :
                         value += 1
                    case .decrement :
                        value -= 1
                    default:
                        print("Not Handled")
                    }
                    
                }
            
            
            
        }
  
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
