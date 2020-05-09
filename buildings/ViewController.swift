//
//  ViewController.swift
//  buildings
//
//  Created by Mario Perozo on 5/8/20.
//  Copyright © 2020 Mario Perozo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var stackView: UIStackView!
    
    struct Building {      //in the file Building.swift
        let name: String;
        let image: String; //name of image file in Assets.xcassets
    }
    
    let streets: [Int: [Building]] = [
        12: [
            Building(name: "The Strand",                image: "strand")
        ],
        
        14: [
            Building(name: "Zeckendorf Towers",         image: "zeckendorf"),
            Building(name: "The Con Ed Building",       image: "coned")
        ],
        
        23: [
            Building(name: "The Met Life Building",     image: "metlife")
        ],
        
        34: [
            Building(name: "The Javitz Center",         image: "javitz"),
            Building(name: "The Empire State Building", image: "empire")
        ],
        
        42: [
            Building(name: "Grand Central Terminal",    image: "grand"),
            Building(name: "The Chrysler Building",     image: "chrysler"),
            Building(name: "The United Nations",        image: "un"),
        ],
        
        72: [
            Building(name: "The Dakota",                image: "dakota")
        ],
        
        89: [
            Building(name: "The Guggenheim",            image: "guggenheim")
        ]
    ];
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            
            return true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let street: Int = Int(textField.text!) {
                
                if let arrayOfBuildings: [Building] = streets[street] {
                    
                    for building: Building in arrayOfBuildings {
                        let label: UILabel = UILabel();
                        label.backgroundColor = .yellow;
                        label.layer.borderWidth = 0.5;
                        label.textAlignment = .center;
                        label.font = .systemFont(ofSize: 36.0);
                        label.text = building.name;
                        stackView.addArrangedSubview(label);
                        
                        let buildingImage: UIImageView = UIImageView()
                        buildingImage.layer.borderWidth = 0.5
                        buildingImage.image = UIImage(named: building.image)
                        stackView.addArrangedSubview(buildingImage);
                    }
                } else {
                    print("\(street) Street has no noteworthy buildings.");
                }
                
                
                }
                
            }
            
            
        }
        
        
        
}

