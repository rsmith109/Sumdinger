//
//  ContentView.swift
//  Sumdinger
//
//  Created by Russell Smith on 2/27/24.
//
//  This file uses a Summer object to display the SumdingerApp
//
// (8/8) MVM
// (32/32) View
// (32/32) Model
// (16/16) View-Model
// (4/4) Name & Description
// (8/8) Meaningful, descriptive, unabbreviated names and parameter labels

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var theSummer = Summer()
    
    var body: some View {
        Text("Sumdinger")
            .font(.title)
            .bold()
            .foregroundStyle(Color(red: 0.7, green: 0, blue: 0))
        HStack {
            VStack {
                Text("3")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(3) ? .black : .blue)
                Text("4")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(4) ? .black : .blue)
                Text("5")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(5) ? .black : .blue)
                Text("6")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(6) ? .black : .blue)
                Text("7")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(7) ? .black : .blue)
                Text("8")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(8) ? .black : .blue)
                Text("9")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(9) ? .black : .blue)
                Text("10")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(10) ? .black : .blue)
                Text("11")
                    .bold()
                    .font(.title)
                    .foregroundStyle(theSummer.turnBlue(11) ? .black : .blue)
            }
            
            Spacer()
                .frame(width: 60)
            
            VStack {
                Image(theSummer.getDice(at: 0).imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        theSummer.tap(at: 0)
                    }
                    .shadow(color: theSummer.isIndexSelected(value: 0) ? .red : .white, radius: 10)
                Image(theSummer.getDice(at: 1).imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        theSummer.tap(at: 1)
                    }
                    .shadow(color: theSummer.isIndexSelected(value: 1) ? .orange : .white, radius: 10)
                Image(theSummer.getDice(at: 2).imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        theSummer.tap(at: 2)
                    }
                    .shadow(color: theSummer.isIndexSelected(value: 2) ? .green : .white, radius: 10)
                Image(theSummer.getDice(at: 3).imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        theSummer.tap(at: 3)
                    }
                    .shadow(color: theSummer.isIndexSelected(value: 3) ? .blue : .white, radius: 10)
                Image(theSummer.getDice(at: 4).imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                        theSummer.tap(at: 4)
                    }
                    .shadow(color: theSummer.isIndexSelected(value: 4) ? .purple : .white, radius: 10)
            }
           
        }
        .padding()
        
        Button() {

        } label: {
            Text("Roll Again")
                .font(.title)
                .onTapGesture {
                    theSummer.rollAgain()
                }
        }
        
        Text("Selected: \(theSummer.selected)")
        
        Text("Sum:  \(theSummer.sumOfDice)")
    }
}

#Preview {
    ContentView()
}
