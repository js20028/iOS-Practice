//
//  ViewController.swift
//  CoreDataTest
//
//  Created by 곽재선 on 2023/01/29.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    struct Allergy {
        let allergyResult: String
        let productName: String
        let productIngredient: String
    }
    
    let result = Allergy(allergyResult: "단백질", productName: "소고기", productIngredient: "탄수화물, 단백질, 지방")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("123")
        self.fetchAllergy()

//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//
//        let entity = NSEntityDescription.entity(forEntityName: "AllergyResult", in: context)
//
//        if let entity = entity {
//            let allergy = NSManagedObject(entity: entity, insertInto: context)
//            allergy.setValue(result.productName, forKey: "productName")
//            allergy.setValue(result.productIngredient, forKey: "productIngredient")
//            allergy.setValue(result.allergyResult, forKey: "allergyResult")
//
//            do {
//                try context.save()
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
        
    }
    
    func fetchAllergy() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext

        do {
            let allergy = try context.fetch(AllergyResult.fetchRequest()) as! [AllergyResult]
           allergy.forEach {
               print($0.productName!)
               print($0.productIngredient!)
               print($0.allergyResult!)
          }
        } catch {
           print(error.localizedDescription)
        }
    }


}

