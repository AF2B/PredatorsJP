import SwiftUI

struct ContentView: View {
    @State private var selectedType: String = "All"
    let predators = PredatorController()
    
    var filteredPredators: [PredatorModel] {
        if selectedType == "All" {
            return predators.predatorsData
        } else {
            return predators.predatorsData.filter { $0.type == selectedType }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter by Type", selection: $selectedType) {
                    Text("All").tag("All")
                    Text("Land").tag("land")
                    Text("Sea").tag("sea")
                    Text("Air").tag("air")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                List {
                    ForEach(filteredPredators) { predator in
                        NavigationLink(destination: PredatorDetailView(predator: predator)) {
                            PredatorRowView(predator: predator)
                        }
                    }
                }
            }
            .navigationTitle("Jurassic Predators")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
