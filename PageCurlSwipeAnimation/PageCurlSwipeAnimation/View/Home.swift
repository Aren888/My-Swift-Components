//
//  Home.swift
//  PageCurlSwipeAnimation
//
//  Created by Solicy Ios on 27.11.23.
//

import SwiftUI

struct Home: View {
    // TODO: Add comments to explain the purpose of the @State variable.
    @State private var images: [ImageModel] = []
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(images) { image in
                    // TODO: Explain the purpose of PeelEffect and onDelete.
                    PeelEffect {
                        CardView(image)
                    } onDelete: {
                        // TODO: Explain the purpose of this block and add comments for clarity.
                        if let index = images.firstIndex(where: { C1 in
                            C1.id == image.id
                        }) {
                            // TODO: Add comments to explain the purpose of this animation block.
                            let _ = withAnimation(.easeInOut(duration: 0.35)) {
                                images.remove(at: index)
                            }
                        }
                    }
                }
            }
            .padding(15)
        }
        .onAppear {
            // TODO: Add comments to explain the purpose of this loop and how images are initialized.
            for index in 1...5 {
                images.append(.init(assetName: "Pic \(index)"))
            }
        }
    }
    
    // TODO: Add comments to explain the purpose of this ViewBuilder function.
    @ViewBuilder
    func CardView(_ imageModel: ImageModel) -> some View {
        GeometryReader {
            let size = $0.size
            
            ZStack {
                Image(imageModel.assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            }
        }
        .frame(height: 130)
        .contentShape(Rectangle())
    }
}

// TODO: Add comments for the purpose of the preview.
#Preview {
    ContentView()
}

struct ImageModel: Identifiable {
    var id: UUID = .init()
    var assetName: String
}

// TODO: Consider adding more comments to explain any additional functionality or context.
