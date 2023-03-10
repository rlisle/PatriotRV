//
//  ChecklistRowView.swift
//  RvChecklist
//
//  Created by Ron Lisle on 2/22/21.
//

import SwiftUI

struct ChecklistRowView: View {
    
    @EnvironmentObject var model: ModelData
    
    var listItem: ChecklistItem

    var body: some View {

        HStack {
            Text(listItem.name).strikethrough(listItem.isDone)
            Spacer()
            Checkmark(isDone: $model.checklist[index()].isDone)
        }
    }
    
    func index() -> Int {
        guard listItem.id - 1 > 0 && listItem.id < model.checklist.count else {
            print("Invalid checklistItem index")
            return 0
        }
        return listItem.id - 1
    }
}

struct ChecklistRowView_Previews: PreviewProvider {
    static let modelData = ModelData(mqttManager: MockMQTTManager())
    static var previews: some View {
        List {
            ChecklistRowView(listItem: modelData.checklist.todo().first!)
                .environmentObject(modelData)
        }
    }
}
