//
//  PredatorDetailView.swift
//  PredatorsJP
//
//  Created by André Filipe Fonsêca Borba on 29/10/23.
//

import SwiftUI

struct PredatorDetailView: View {
    let predator: PredatorModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .trailing) {
                Image(predator.type)
                    .resizable()
                    .scaledToFit()
                
                Image(predator.name.lowercased().filter { $0 != " " })
                    .resizable()
                    .scaledToFit()
                    .frame(width: UIScreen.main.bounds.width/1.5, height: UIScreen.main.bounds.height/4)
                    .shadow(color: .black, radius: 6, x: 0, y: 0)
                    .offset(y: -210)
                    .rotation3DEffect(
                        .degrees(180),
                        axis: (x: 0, y: 1, z: 0)
                    )
            }
            VStack(alignment: .leading) {
                Text(predator.name)
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                
                Text("Appears In:")
                    .font(.title3)
                
                ForEach(predator.movies, id: \.self) { movies in
                    Text("•" + movies)
                        .font(.subheadline)
                }
                
                Text("Movie Moments")
                    .font(.title)
                    .padding(.top, 15)
                
                ForEach(predator.movieScenes) { scenes in
                    Text(scenes.movie)
                        .font(.title2)
                        .padding([.top, .bottom], 1)
                    
                    Text(scenes.sceneDescription)
                        .padding(.bottom, 14)
                }
                
                Text("Read More:")
                    .font(.caption)
                
                Link(predator.link, destination: URL(string: predator.link)!)
                    .font(.caption)
                    .foregroundStyle(.blue)
            }
            .padding(.top, -220)
            .padding()
        }
        .edgesIgnoringSafeArea(.top)
    }
}
struct PredatorDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleMovieScene = MovieScene(id: 1, movie: "Sample Movie", sceneDescription: "Sample Description")
        let samplePredator = PredatorModel(id: 1, name: "Indoraptor", type: "land", movies: ["Sample Movie", "Other movie"], movieScenes: [sampleMovieScene], link: "https://example.com")
        
        return PredatorDetailView(predator: samplePredator)
            .preferredColorScheme(.dark)
    }
}
