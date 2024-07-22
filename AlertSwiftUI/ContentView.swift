//
//  ContentView.swift
//  AlertSwiftUI
//
//  Created by Meltem Uğurlu on 22.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var alert = false
    @State private var actionSheetAlert = false
    var body: some View {
        VStack (spacing: 100) {
            Button("Alert"){
                alert = true
            }.alert("Title", isPresented: $alert, actions: {
                Button("Cancel", role: .cancel, action: {
                    print("chosen cancel")
                })
                Button("Okey", role: .destructive, action: {
                    print("Okey")
                })
                
            }, message:  {Text("İndex") })
                    
            Button("Action Sheet"){
                actionSheetAlert = true
            }.actionSheet(isPresented: $actionSheetAlert) {
             ActionSheet(title: Text("Title"),
                        message: Text("New Index"),
                         buttons: [
                            .default(Text("Cancel"),action: {
                                print("cancel")
                            }),
                            .destructive(Text("Okey"), action: {
                              print("Okey")
                            })
                         ])
            }
            
            
            Text("Context Menu") //when long press
                .contextMenu {
                    Button{
                        print("fotography chosen")
                    }label: {
                        Label("Take a photo", systemImage: "camera")
                    }
                    Button{
                        print("video chosen")
                    }label: {
                        Label("Save video", systemImage: "video")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
