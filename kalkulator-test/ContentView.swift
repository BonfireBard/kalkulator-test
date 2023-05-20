//
//  ContentView.swift
//  kalkulator-test
//
//  Created by user234228 on 5/20/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var userInput: String = "0"
    @State private var didntypedyet: Bool = true
    @State private var userInput1: Int = 0
    @State private var userInput2: Int = 0
    @State private var userInput1_hasvalue: Bool = false
    @State private var userInput2_hasvalue: Bool = false
    
    func updateInput(_ newInput: String) {
        if didntypedyet {
            userInput = newInput
            didntypedyet = false
        } else {
            userInput += newInput
        }
    }
    
    struct MathOperation {
        var multiply = false
        var sum = false
        var subtract = false
        var divide = false
        
        mutating func setOperation(_ operation: Operation) {
            resetOperations()
            
            switch operation {
            case .multiply:
                self.multiply = true
            case .sum:
                self.sum = true
            case .subtract:
                self.subtract = true
            case .divide:
                self.divide = true
            }
        }
        
        func performOperationInt(_ a: Double, _ b: Double) -> Double {
              switch true {
              case self.multiply:
                  return a * b
              case self.sum:
                  return a + b
              case self.subtract:
                  return a - b
              case self.divide:
                  guard b != 0 else { fatalError("Division by zero is not allowed") }
                  return a / b
              default:
                  fatalError("No operation selected")
              }
          }
        
        private mutating func resetOperations() {
            self.multiply = false
            self.sum = false
            self.subtract = false
            self.divide = false
        }
    }

    enum Operation {
        case multiply
        case sum
        case subtract
        case divide
    }
    
    @State var operations = MathOperation();

    //operations.setOperation(.multiply);
    
    var body: some View {
        
        VStack {
            
            Spacer()
            
            HStack{
                Spacer()
                VStack{
                    Text("userinput1:")
                    Text(String(userInput1))
                }
                Spacer()
                VStack{
                    Text("userinput2:")
                    Text(String(userInput2))
                }
                Spacer()
                }
            
            Spacer()
            
            Text(String(userInput))
            
            Spacer()
            
            VStack {
                Spacer()
                HStack{
                    Spacer()
                    Button("C"){
                        userInput1_hasvalue = false
                        userInput2_hasvalue = false
                        userInput1 = 0
                        userInput2 = 0
                        didntypedyet = true
                        userInput = "0"
                    }
                    Spacer()
                    Button("DEL"){
                        if (userInput2_hasvalue){
                            userInput2_hasvalue = false
                            userInput2 = 0
                            userInput = "0"
                        }else{
                            if(userInput1_hasvalue){
                                userInput1_hasvalue = false
                                userInput1 = 0
                                userInput = "0"
                            }
                        }
                        
                    }
                    Spacer()
                    Button("+-"){}
                    Spacer()
                    Button("/"){
                        operations.setOperation(.divide)
                        if(!userInput1_hasvalue){
                            if let convertedNumber = Int(userInput) {
                                userInput1 = convertedNumber
                                userInput1_hasvalue = true
                                didntypedyet = true
                                userInput = "0"
                            }else{
                                print("error")
                            }
                            //userInput1 = Int(userInput)
                        }else{
                            
                        }
                        
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("1"){updateInput("1")}
                    Spacer()
                    Button("2"){updateInput("2")}
                    Spacer()
                    Button("3"){updateInput("3")}
                    Spacer()
                    Button("+"){operations.setOperation(.sum)
                        if(!userInput1_hasvalue){
                            if let convertedNumber = Int(userInput) {
                                userInput1 = convertedNumber
                                userInput1_hasvalue = true
                                didntypedyet = true
                                userInput = "0"
                            }else{
                                print("error")
                            }
                            //userInput1 = Int(userInput)
                        }else{
                            
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("4"){updateInput("4")}
                    Spacer()
                    Button("5"){updateInput("5")}
                    Spacer()
                    Button("6"){updateInput("6")}
                    Spacer()
                    Button("-"){operations.setOperation(.subtract)
                        if(!userInput1_hasvalue){
                            if let convertedNumber = Int(userInput) {
                                userInput1 = convertedNumber
                                userInput1_hasvalue = true
                                didntypedyet = true
                                userInput = "0"
                            }else{
                                print("error")
                            }
                            //userInput1 = Int(userInput)
                        }else{
                            
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("7"){updateInput("7")}
                    Spacer()
                    Button("8"){updateInput("8")}
                    Spacer()
                    Button("9"){updateInput("9")}
                    Spacer()
                    Button("*"){operations.setOperation(.multiply)
                        if(!userInput1_hasvalue){
                            if let convertedNumber = Int(userInput) {
                                userInput1 = convertedNumber
                                userInput1_hasvalue = true
                                didntypedyet = true
                                userInput = "0"
                            }else{
                                print("error")
                            }
                            //userInput1 = Int(userInput)
                        }else{
                            
                        }
                    }
                    Spacer()
                }
                Spacer()
                HStack{
                    Spacer()
                    Button("0"){
                        if (userInput != "0"){
                            updateInput("0")
                        }
                    }
                    Spacer()
                    Button("."){}
                    Spacer()
                    Button("="){
                        if let convertedNumber = Int(userInput) {
                            userInput2 = convertedNumber
                            userInput2_hasvalue = true
                            didntypedyet = true
                            userInput = String(operations.performOperationInt(Double(userInput1), Double(userInput2)))
                        }else{
                            print("error")
                        }

                        
                        
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
