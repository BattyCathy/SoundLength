//
//  ContentView.swift
//  SoundLength
//
//  Created by Guy on 1/18/21.
//

import SwiftUI

struct ContentView: View {
    @State var frequency = "20"
    
    var duration: Double {
        1 / (Double(frequency) ?? 0)
        
    }
    var wavelength: Double {
        duration * speedOfSound
    }
    
    var bpm: Double {
        (Double(frequency) ?? 0) * 60
    }
    let speedOfSound: Double = 343
    
    var body: some View {
        Form {
            Section(header: Text("Frequency")) {
                TextField("Hertz", text: $frequency)
                    .keyboardType(.decimalPad)
            }
            Section(header: Text("period")) {
                Text("Each cycle of a \(frequency)hz wave lasts for a period of \(duration, specifier: "%g") seconds.")
            }
            Section(header: Text("Wavelength")) {
                Text("The distance a \(frequency)hz wave travels in a single cycle is \(wavelength, specifier: "%g") meters")
            }
            Section(header: Text("Tempo")) {
                Text("A \(frequency)hz wave will cycle at a rate of \(bpm, specifier: "%g") beats per minute")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
