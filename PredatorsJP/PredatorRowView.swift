//
//  PredatorRowView.swift
//  PredatorsJP
//
//  Created by André Filipe Fonsêca Borba on 29/10/23.
//

import SwiftUI

struct PredatorRowView: View {
    let predator: PredatorModel
    
    var body: some View {
        HStack {
            Image(predator.name.lowercased().filter { $0 != " " })
                .resizable()
                .scaledToFit()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .shadow(color: .white, radius: 1, x: 0, y: 0)
            
            VStack(alignment: .leading) {
                Text(predator.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                
                Text(predator.type.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(.horizontal, 13)
                    .padding(.vertical, 6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .fill(predator.typeOverlay().opacity(0.32))
                    )
            }
        }
    }
}

struct PredatorRowView_Previews: PreviewProvider {
    static var previews: some View {
        let movieScene = MovieScene(id: 3, movie: "Jurassic World: Fallen Kingdom", sceneDescription: "It is revealed that there are some surviving Brachiosaurus populations on Isla Nublar, but the species faces danger in the form of an impending erupting volcano.\n\nA Brachiosaurus is later seen walking down the ruins of Main Street, in front of Owen, Claire, Zia and others.\n\nA Brachiosaurus skeleton was seen near the radio tower's hatch.\n\nWhen Mt. Sibo erupts, the Brachiosaurs were among the dinosaurs stampeding from the eruption, facing many heavy casualties, most notably: as the boat Arcadia leaves Nublar to its fate, a Brachiosaurus, the same one seen by Grant and Sattler 25 years ago, is seen walking down the East Dock, crying out and standing on its hind legs as it is slowly engulfed by the toxic smoke and debris from the erupting volcano, letting out its final cries.\n\nDespite the massive casualties, the species' survival is confirmed by the Arcadia's manifest, and by J.A. Bayona himself, which shows that at least two adult Brachiosaurus had been captured and escaped the estate off-screen.\n\nSome of Mill's mercenaries managed to salvage its viable embryo, as seen during Malcolm's voiced over final testimony with the committee, implying that more Brachiosaurus may be engineered in the future.")
        let predator = PredatorModel(id: 3, name: "Tyrannosaurus Rex", type: "land", movies: ["Jurassic Park III", "Jurassic World", "The Lost World: Jurassic Park"], movieScenes: [movieScene], link: "https://jurassicpark.fandom.com/wiki/Tyrannosaurus_rex")
        
        return PredatorRowView(predator: predator)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
