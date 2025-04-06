import SwiftUI

enum ConversionCategory: String, CaseIterable, Identifiable {
    case temperature = "Temperature"
    case length = "Length"
    case time = "Time"
    case volume = "Volume"
    
    var id: String { self.rawValue }
    
    var icon: String {
        switch self {
        case .temperature: return "thermometer"
        case .length: return "ruler"
        case .time: return "clock"
        case .volume: return "drop"
        }
    }
}

struct ContentView: View {
    @State private var selectedCategory: ConversionCategory = .temperature
    
    @ViewBuilder
    func categoryView(for category: ConversionCategory) -> some View {
        switch category {
        case .temperature:
            TemperatureConverterView()
        case .length:
            LengthConverterView()
        case .time:
            TimeConverterView()
        case .volume:
            VolumeConverterView()
        }
    }
    
    var body: some View {
        TabView(selection: $selectedCategory) {
            ForEach(ConversionCategory.allCases) { category in 
                categoryView(for: category)
                    .tabItem {
                        Label(category.rawValue, systemImage: category.icon)
                    }
                    .tag(category)
            }
        }
    }
}