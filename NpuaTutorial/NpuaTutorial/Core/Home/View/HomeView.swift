//
//  HomeView.swift
//  NpuaTutorial
//
//  Created by Solicy Ios on 22.01.24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                let columns = Array(repeating: GridItem(spacing: 10), count: 3)
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(viewModel.colors, id: \.self) { color in
                        
                        GeometryReader { geometry in
                            let size = geometry.size
                            RoundedRectangle(cornerRadius: 10)
                                .fill(color.gradient)
                                .draggable(color) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 1, height: 1)
                                        .onAppear {
                                            viewModel.draggingItem = color
                                        }
                                }
                                .dropDestination(for: Color.self) { items, location in
                                    viewModel.draggingItem = nil
                                    return false
                                } isTargeted: { status in
                                    if let draggingItem = viewModel.draggingItem, status, viewModel.draggingItem != color {
                                        if let sourceIndex = viewModel.colors.firstIndex(of: draggingItem),
                                           let destinationIndex = viewModel.colors.firstIndex(of: color) {
                                            withAnimation(.bouncy) {
                                                let sourceItem = viewModel.colors.remove(at: sourceIndex)
                                                viewModel.colors.insert(sourceItem, at: destinationIndex)
                                            }
                                        }
                                    }
                                }
                        }
                        .frame(height: 100)
                    }
                }
                .padding(15)
            }
            .navigationTitle("Movable Grid")
        }
    }
}

#Preview {
    HomeView()
}
