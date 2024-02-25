//
//  ContentView.swift
//  Exercise7_Mandapati_Likhitha_watch Watch App
//
//  Created by student on 11/6/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = ViewModelWatch()
    var body: some View {
        VStack {
            Image(systemName: "photo.artframe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Image(uiImage: model.messageImg!)
            Text(model.messageText)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
