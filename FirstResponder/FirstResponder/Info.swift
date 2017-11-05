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
            Info(descript: "How do paramedics have to act when on duty?", title: "A Day as a Specialist Paramedic", url: "https://www.youtube.com/watch?v=KygCDj_AkUo", text: ""),
            Info(descript: "", title: "", url: "https://www.youtube.com/watch?v=9ttt4mO3cYk", text: ""),
            Info(descript: "First Aid training video which might help save a life one day.", title: "First Aid Training", url: "https://www.youtube.com/watch?v=9ttt4mO3cYk", text: ""),
            Info(descript: "The American Heart Association", title: "Cardiopulmonary resuscitation (CPR)", url: "", text: "Cardiopulmonary resuscitation (CPR) is a lifesaving technique useful in many emergencies, including heart attack or near drowning, in which someone's breathing or heartbeat has stopped. The American Heart Association recommends that everyone — untrained bystanders and medical personnel alike — begin CPR with chest compressions.\n\n Its far better to do something than to do nothing at all if youre fearful that your knowledge or abilities arent 100 percent complete. Remember, the difference between your doing something and doing nothing could be someones life.\n\n Heres advice from the American Heart Association:\n\n Untrained. If youre not trained in CPR, then provide hands-only CPR. That means uninterrupted chest compressions of 100 to 120 a minute until paramedics arrive (described in more detail below). You dont need to try rescue breathing. Trained and ready to go. If youre well-trained and confident in your ability, check to see if there is a pulse and breathing. If there is no breathing or a pulse within 10 seconds, begin chest compressions. Start CPR with 30 chest compressions before giving two rescue breaths. Trained but rusty. If youve previously received CPR training but youre not confident in your abilities, then just do chest compressions at a rate of 100 to 120 a minute. (Details described below.) The above advice applies to adults, children and infants needing CPR, but not newborns.\n\nCPR can keep oxygenated blood flowing to the brain and other vital organs until more definitive medical treatment can restore a normal heart rhythm.\n When the heart stops, the lack of oxygenated blood can cause brain damage in only a few minutes. A person may die within eight to 10 minutes.\nTo learn CPR properly, take an accredited first-aid training course, including CPR and how to use an automated external defibrillator (AED). If you are untrained and have immediate access to a phone, call 911 or your local emergency number before beginning CPR. The dispatcher can instruct you in the proper procedures until help arrives.\n Before you begin\nBefore starting CPR, check:\n\nIs the environment safe for the person?\nIs the person conscious or unconscious?\nIf the person appears unconscious, tap or shake his or her shoulder and ask loudly, Are you OK? If the person doesn't respond and two people are available, one should call 911 or the local emergency number and get the AED, if one is available, and one should begin CPR. \nIf you are alone and have immediate access to a telephone, call 911 or your local emergency number, before beginning CPR. Get the AED, if one is available. \nAs soon as an AED is available, deliver one shock if instructed by the device, then begin CPR. Remember to spell C-A-B"),
            Info(descript: "Learn how to save lives in critical situations", title: "Critical Situations", url: "https://www.youtube.com/watch?v=p44sX1aQr14", text: "")
        ]
    }
}
