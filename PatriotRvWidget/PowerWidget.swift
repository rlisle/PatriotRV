//
//  PowerWidget.swift
//  PatriotRV
//
//  Created by Ron Lisle on 2/25/23.
//

import WidgetKit
import SwiftUI
import Intents


struct PowerWidgetEntryView : View {
    @Environment(\.widgetFamily) var family
    
    var entry: Provider.Entry

    var body: some View {
        
        switch family {
        case .accessoryCircular:
            CircularPowerView(tripMode: entry.tripMode, doneCount: entry.doneCount, totalCount: entry.totalCount)

        case .accessoryInline:
            Text("\(entry.nextTrip): \(entry.tripMode) \(entry.doneCount) of \(entry.totalCount)")
            
        case .systemLarge:
                VStack(alignment: .leading) {
                    HStack {
                        Text("Trip: ")
                        Spacer()
                        Text(entry.nextTrip)
                    }
                    HStack {
                        Text(entry.tripMode)
                        Spacer()
                        Text("\(entry.doneCount) of \(entry.totalCount)")
                    }
                    HStack {
                        Text("Next: ")
                        Spacer()
                        Text(entry.nextItem)
                    }
                }
                .background(Image("truck-rv"))
                .padding(8)
            
        case .systemSmall:
            Text("RV Power")
                .widgetURL(URL(string: "patriot:///power")!)

        default:
            ZStack {
                //Color("WidgetBackground")
                VStack(alignment: .leading) {
                    HStack {
                        Text("Trip: ")
                        Spacer()
                        Text(entry.nextTrip)
                    }
                    HStack {
                        Text(entry.tripMode)
                        Spacer()
                        Text("\(entry.doneCount) of \(entry.totalCount)")
                    }
                    HStack {
                        Text("Next: ")
                        Spacer()
                        Text(entry.nextItem)
                    }
                }
                .padding(8)
            }
        }
    }
}

struct PowerWidget: Widget {
    let kind: String = Constants.powerKind
    
    let accessories: [WidgetFamily] = [.accessoryRectangular, .accessoryInline, .accessoryCircular, .systemLarge, .systemMedium, .systemSmall]
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind,
                            provider: Provider()) { entry in
            PowerWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("RV Power")
        .description("RV Power Monitor")
        .supportedFamilies(accessories)
    }
}

struct PowerWidget_Previews: PreviewProvider {
    
    static let phoneFamilies: [WidgetFamily] = [.accessoryRectangular, .accessoryInline, .accessoryCircular, .systemLarge, .systemMedium, .systemSmall]

    static var previews: some View {
        Group {
            ForEach(phoneFamilies,
                id: \.self) { family in
                
                ChecklistWidgetEntryView(
                    entry: ChecklistEntry(
                        nextTrip: "Canada",
                        tripMode: "Parked",
                        doneCount: 3,
                        totalCount: 15,
                        nextItem: "Plan Trip"))
                .previewContext(WidgetPreviewContext(family: family))
                .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
                .previewDisplayName(String(family.description.dropFirst(9)))
            }
        }
    }
}
