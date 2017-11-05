//
//  Info.swift
//  FirstResponder
//
//  Created by SImon Nielsen on 05/11/2017.
//  Copyright © 2017 CSUMB. All rights reserved.
//

import Foundation

struct Info {

    var descript : String?
    var title : String?
    var url : String?
    var text : String?

}
final class InfoData {

    static func generateInfoData() -> [Info] {
        return [
            Info(descript: "Learn how to do proper CPR", title: "CPR", url: "https://www.youtube.com/watch?v=cosVBV96E2g", text: ""),
            Info(descript: "An in-depth article on CPR in a critical situation", title: "Step-by-step CPR", url: "", text: ""),
            Info(descript: "How do paramedics have to act when on duty?", title: "A Day as a Specialist Paramedic", url: "https://www.youtube.com/watch?v=KygCDj_AkUo", text: ""),
            Info(descript: "See what study life is like as a Paramedic student", title: "Study Paramedic", url: "https://www.youtube.com/watch?v=NdqBafo5rAY", text: ""),
            Info(descript: "First Aid training video which might help save a life one day.", title: "First Aid Training", url: "https://www.youtube.com/watch?v=9ttt4mO3cYk", text: "")
        ]
    }
}
