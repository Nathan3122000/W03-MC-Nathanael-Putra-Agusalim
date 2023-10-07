//
//  ContentView.swift
//  CalculatorApp
//
//  Created by MacBook Pro on 06/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentInput = "0.0"
    @State private var previousNumber = 0.0
    @State private var currentNumber = 0.0
    @State private var selectedOperator = ""
    @State private var isTyping = false

    var body: some View {
        VStack(spacing: 70) {
            Text(currentInput)
                .font(.largeTitle)
                .padding()
            
            VStack(spacing: 100) {
                HStack(spacing: 60) {
                    Button("C") { clear() }
                        .font(.largeTitle)
                    Button("+/-") { toggleSign() }
                        .font(.largeTitle)
                    Button("%") { calculatePercentage() }
                        .font(.largeTitle)
                    Button("/") { operatorTapped("/") }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 70) {
                    Button("7") { digitTapped("7") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("8") { digitTapped("8") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("9") { digitTapped("9") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("*") { operatorTapped("*") }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 70) {
                    Button("4") { digitTapped("4") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("5") { digitTapped("5") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("6") { digitTapped("6") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("-") { operatorTapped("-") }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 70) {
                    Button("1") { digitTapped("1") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("2") { digitTapped("2") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("3") { digitTapped("3") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("+") { operatorTapped("+") }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
                
                HStack(spacing: 84) {
                    Button("0") { digitTapped("0") }
                        .frame(width: 90)
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button(".") { digitTapped(".") }
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    Button("=") { calculate() }
                        .font(.largeTitle)
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
    }

    func digitTapped(_ digit: String) {
        if isTyping {
            currentInput += digit
        } else {
            currentInput = digit
            isTyping = true
        }
    }

    func operatorTapped(_ op: String) {
        if selectedOperator.isEmpty {
            previousNumber = Double(currentInput) ?? 0
            currentInput = "\(previousNumber)"
        } else {
            calculate()
        }
        selectedOperator = op
        isTyping = false
    }

    func calculate() {
        if let current = Double(currentInput) {
            switch selectedOperator {
            case "+":
                previousNumber += current
            case "-":
                previousNumber -= current
            case "*":
                previousNumber *= current
            case "/":
                if current != 0 {
                    previousNumber /= current
                } else {
                    currentInput = "Error"
                    return
                }
            default:
                break
            }
            currentInput = "\(previousNumber)"
            selectedOperator = ""
        }
        isTyping = false
    }
    
    func toggleSign() {
        if let value = Double(currentInput) {
            currentInput = "\(value * -1)"
        }
    }
    
    func calculatePercentage() {
        if let value = Double(currentInput) {
            currentInput = "\(value / 100)"
        }
    }

    func clear() {
        currentInput = "0"
        previousNumber = 0.0
        currentNumber = 0.0
        selectedOperator = ""
        isTyping = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
