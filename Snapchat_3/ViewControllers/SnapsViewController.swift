//
//  SnapsViewController.swift
//  Snapchat_3
//
//  Created by Cafu Aguilar on 5/30/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit
import Firebase
class SnapsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    var snaps : [Snap] = []
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let snap = snaps[indexPath.row]
        performSegue(withIdentifier: "versnapsegue", sender: snap)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return snaps.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "versnapsegue" {
            let siguienteVC = segue.destination as! VerSnapViewController
            siguienteVC.snap = sender as! Snap
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let snap = snaps[indexPath.row]
        cell.textLabel?.text = snap.from
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
            FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").observe(FIRDataEventType.childAdded, with: {(snapshot) in
                let snap = Snap()
                snap.imageURL = (snapshot.value as! NSDictionary)["imagenURL"] as! String
                snap.from = (snapshot.value as! NSDictionary)["from"] as! String
                snap.descrip = (snapshot.value as! NSDictionary)["description"] as! String
                self.snaps.append(snap)
                self.tableView.reloadData()
            })
    }

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func cerrarSesionTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
