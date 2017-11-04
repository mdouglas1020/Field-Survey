//
//  ObservationsDetailViewController.swift
//  Field Survey
//
//  Created by Michael  Douglas on 11/3/17.
//  Copyright © 2017 Michael Douglas. All rights reserved.
//

import UIKit

class ObservationsDetailViewController: UIViewController {
    var fieldSurvey: FieldSurvey?
    var dateFormatter = DateFormatter()
    @IBOutlet weak var fieldSurveyIconView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var animalLabelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.title = "Observations"
        fieldSurveyIconView.image = fieldSurvey?.classification.image
        animalLabelView.text = fieldSurvey?.title
        
        if let date = fieldSurvey?.date {
            dateLabel.text = dateFormatter.string(from: date)
        } else {
            dateLabel.text = ""
        }
        descriptionLabel.text = fieldSurvey?.description
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
