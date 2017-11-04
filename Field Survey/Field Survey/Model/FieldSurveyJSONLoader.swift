//
//  FieldSurveyJSONLoader.swift
//  Field Survey
//
//  Created by Michael  Douglas on 11/3/17.
//  Copyright © 2017 Michael Douglas. All rights reserved.
//

import Foundation

class FieldSurveyJSONLoader {
    class func load(fileName: String) -> [FieldSurvey] {
        var observations = [FieldSurvey]()
        if let path = Bundle.main.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
            observations = FieldSurveyJSONParser.parse(data)
        }
        return observations
    }
}
