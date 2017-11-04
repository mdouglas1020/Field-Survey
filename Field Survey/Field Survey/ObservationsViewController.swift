//
//  ObservationsViewController.swift
//  Field Survey
//
//  Created by Michael  Douglas on 11/3/17.
//  Copyright © 2017 Michael Douglas. All rights reserved.
//

import UIKit

class ObservationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var obvTableView: UITableView!
    
    
    
    let dateFormatter = DateFormatter()
    let fieldSurvey = FieldSurveyJSONLoader.load(fileName: "field_observations")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        self.title = "Field Survey"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fieldSurvey.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classificationCell", for: indexPath)
        if let cell = cell as? FieldSurveyTableViewCell {
            let observations = fieldSurvey[indexPath.row]
            cell.animalIconImageView.image = observations.classification.image
            cell.titleLabel.text = observations.title
            cell.dateLabel.text = dateFormatter.string(from: observations.date)
        }
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ObservationsDetailViewController, let row = obvTableView.indexPathForSelectedRow?.row {
            
            destination.fieldSurvey = fieldSurvey[row]
        }
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
