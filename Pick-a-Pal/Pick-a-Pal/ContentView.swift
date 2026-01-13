//
//  ContentView.swift
//  Pick-a-Pal
//
//  Created by Meezotech Mac on 07/01/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Anas"]
    @State private var nameToAdd = ""
    @State private var pickedName = ""
    @State private var shouldRemovePickedName = false
    
    var body: some View {
        VStack {
            
            VStack(spacing: 8){
                Image(systemName: "person.3.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                Text("Pick-a-Pal")
            }
            .font(.title)
            .fontWeight(.bold)
            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            List{
                ForEach(names, id: \.description){
                    name in
                    Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            TextField("Name to add", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    let newName = nameToAdd.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    guard !newName.isEmpty else {return}
                    
                    if names.contains(where:{ $0.lowercased() == newName.lowercased()}){
                        
                        print("Name already exist")
                    } else {
                        names.append(newName)
                        nameToAdd = ""
                    }
//                    if !nameToAdd.isEmpty{
//                        names.append(nameToAdd)
//                        nameToAdd = ""
//                    }
                }
            Divider()
            
            Toggle("Remove when Picked", isOn: $shouldRemovePickedName)
                .padding()
            
            Button("Pick a Random Name") {
                if let randomName = names.randomElement(){
                    pickedName = randomName
                    
                    if shouldRemovePickedName {
                        names.removeAll() {
                            name in
                            return (name == randomName)
                        }
                    }
                }
                else {
                    pickedName = " "
                }
                
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
        .background(.appBackground)
    }
}

#Preview {
    ContentView()
}
