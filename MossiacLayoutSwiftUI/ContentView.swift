//
//  ContentView.swift
//  MossiacLayoutSwiftUI
//
//  Created by apple on 31/05/24.
//

import SwiftUI
import MosaicGrid

struct ContentView: View {
    @State private var scrolLViewId: Int = 0
    var body: some View {
        ScrollView {
            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
//                Text("Hello, world!")
//                
                VMosaicGrid(hGridCount: 3, spacing: 10) {
                    ForEach(0..<5) { index in
                        if index % 2 == 0 {
                            image(from: "https://picsum.photos/200")
                            image(from: "https://picsum.photos/100")
                                .usingGrids(h: 2, v: 2)
                            image(from: "https://picsum.photos/100")
                                .usingGrids(v: 2)
                            image(from: "https://picsum.photos/100/200")
                                .usingGrids(h: 2)
                        }
                        else {
                            image(from: "https://picsum.photos/200")
                                .usingGrids(h: 2, v: 2)
                            image(from: "https://picsum.photos/100")
                            image(from: "https://picsum.photos/100")
                                .usingGrids(v: 2)
                            image(from: "https://picsum.photos/100/200")
                                .usingGrids(h: 2)
                        }
                    }
                }
            }
        }
        .padding()
        .id(scrolLViewId)
        .refreshable {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                scrolLViewId += 1
            }
        }
    }
    
    // MARK: - Load image from internet
    
    func image(from url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
//                .scaledToFit()
                .clipped()
        } placeholder: {
            Rectangle()
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    ContentView()
}
