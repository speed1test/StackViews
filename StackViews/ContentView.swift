//
//  ContentView.swift
//  StackViews
//
//  Created by elsalvador on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showImage = true
    
    var body: some View {
        VStack {
            // Encabezado
            VStack {
                Text("StackViews Example")
                    .font(.title)
                    .padding()
                
                // Cargar y mostrar una imagen desde una URL
                if showImage {
                    AsyncImage(url: URL(string: "https://docs-assets.developer.apple.com/published/2014331d7f7b75d09c46cecd9e603335/cta-building-lists-navigation@2x.png")) { phase in
                        switch phase {
                        case .success(let image):
                            CircleImage(image: image)
                                .frame(width: 150, height: 150)
                                .padding(.bottom, 20)
                        case .failure:
                            Text("Error al cargar la imagen")
                        case .empty:
                            ProgressView()
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            
            // Contenido principal
            VStack(alignment: .leading) {
                Text("Contenido principal aquí")
                    .font(.headline)
                    .padding()
                
                // Agrega más vistas y contenido según sea necesario
                
            }
            
            // Pie de página
            VStack {
                Divider()
                Text("Pie de página aquí")
                    .font(.footnote)
                    .padding()
                
                // Botón para ocultar/mostrar la imagen
                Button(action: {
                    withAnimation {
                        showImage.toggle()
                    }
                }) {
                    Text(showImage ? "Ocultar Imagen" : "Mostrar Imagen")
                }
            }
        }
        .padding()
    }
}

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}


#Preview {
    ContentView()
}
