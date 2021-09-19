//
//  ViewController.swift
//  Automatizacion
//
//  Created by Brandon Rubio Rodriguez on 17/08/20.
//  Copyright © 2020 Brandon Rubio Rodriguez. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var flujo: UILabel!
    @IBOutlet weak var consumo: UILabel!
    @IBOutlet weak var flujoHora: UILabel!
    
    @IBAction func refrescar(_ sender: Any) {
        self.consumo.text = "0" + " L"
        self.flujo.text = "0" + " L/m"
        self.flujoHora.text = "0" + " L/h"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datoConsumo()
        datoFlujo()
        datoFlujoHora()
    }
    func datoConsumo(){
        
        let scoresRef = Database.database().reference()
        
        scoresRef.child("Consumo").observe(.childChanged, with: { snapshot in
            
            print(snapshot)     // replace this with textLabel or other item
            
            self.consumo.text = snapshot.value as! String + " L"
            
        })
    }
    func datoFlujo() {
        
        let scoresRef = Database.database().reference()
        
        scoresRef.child("FlujoMinuto").observe(.childChanged, with: { snapshot in
            
            print(snapshot)     // replace this with textLabel or other item
            
            self.flujo.text = snapshot.value as! String + " L/m"
            
        })
    }
    
    func datoFlujoHora() {
        
        let scoresRef = Database.database().reference()
        
        scoresRef.child("FlujoHora").observe(.childChanged, with: { snapshot in
            
            print(snapshot)     // replace this with textLabel or other item
            
            self.flujoHora.text = snapshot.value as! String + " L/h"
            
        })
    }
}


