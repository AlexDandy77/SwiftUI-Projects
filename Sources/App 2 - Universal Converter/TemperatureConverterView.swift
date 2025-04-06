import SwiftUI

struct TemperatureConverterView: View {
    @State private var sourceTemp = 0.0
    @State private var targetTemp = 0.0
    let temperatureOptions = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var sourceSelection = "Celsius"
    @State private var targetSelection = "Fahrenheit"
    
    func getUnit(from label: String) -> UnitTemperature {
        switch label {
        case "Celsius": return .celsius
        case "Fahrenheit": return .fahrenheit
        case "Kelvin": return .kelvin
        default: return .celsius
        }
    }
    var convertedTemp: Double {
        let input = Measurement(value: sourceTemp, unit: getUnit(from: sourceSelection))
        let output = input.converted(to: getUnit(from: targetSelection))
        return output.value
    }
    
    var body: some View{
        NavigationStack {
            Form {
                Section("From:") {
                    TextField("Amount", value: $sourceTemp, format: .number)
                        .keyboardType(.decimalPad)
                    
                    Picker("Source", selection: $sourceSelection) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("To:") {
                    Text(convertedTemp, format: .number)
                        .foregroundColor(.blue)
                        .bold()
                    
                    Picker("Target", selection: $targetSelection) {
                        ForEach(temperatureOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("Temp Converter")
        }
    }
}