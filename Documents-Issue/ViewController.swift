//
//  ViewController.swift
//  Documents-Issue
//
//  Created by Terrence Covin on 2/26/18.
//  Copyright © 2018 Ickrisrun. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        
    }
    
    
    
    func loadData(){
        
        let db = Firestore.firestore()
        
        db.collection("posts").order(by: "timeStamp", descending: true).limit(to: 15).getDocuments() {(querySnapshot, err) in
            
            if let err = err {
                print("\(err.localizedDescription)")
                
            }else{
                
                
                
                for document in querySnapshot!.documents{
                    
                    print("\(document.documentID) => \(document.data())")
                    
                    
                }
                
                
            }
            
            
        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

