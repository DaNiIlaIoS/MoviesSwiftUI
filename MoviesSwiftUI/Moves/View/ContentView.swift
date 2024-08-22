//
//  ContentView.swift
//  MoviesSwiftUI
//
//  Created by Даниил Сивожелезов on 21.08.2024.
//

import SwiftUI

struct ContentView: View {
    private let columns: [GridItem] = [GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                GeometryReader { geometry in
                    HStack(alignment: .top) {
                        Image("mockImg")
                            .resizable()
                            .frame(width: geometry.size.width / 2, height: geometry.size.height)
                        VStack(alignment: .leading) {
                            Text("Movie name")
                                .font(.system(size: 24, weight: .bold))
                            Text("Ограничивает ширину текста, чтобы он занимал не более половины ширины экрана, соответствуя ширине изображения.")
                        }
                    }
                }
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
                .frame(height: 200)
                .background(Color(.systemGray4))
                .clipShape(.rect(cornerRadius: 10))
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    ContentView()
}
