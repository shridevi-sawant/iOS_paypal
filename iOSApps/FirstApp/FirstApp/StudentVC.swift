//
//  StudentVC.swift
//  FirstApp
//
//  Created by Shridevi Sawant on 30/09/24.
//

import UIKit

struct Student {
    var name: String
    var roll: Int
    var marks: Int
}


class StudentVC: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    
    var stdList: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        populateData()
        
        tbl.dataSource = self
    }
    
    func populateData(){
        stdList.append(Student(name: "john", roll: 1, marks: 89))
        stdList.append(Student(name: "merry", roll: 2, marks: 89))
        stdList.append(Student(name: "robert", roll: 3, marks: 89))
        stdList.append(Student(name: "mark", roll: 4, marks: 89))
        stdList.append(Student(name: "tom", roll: 5, marks: 89))
        stdList.append(Student(name: "john", roll: 1, marks: 89))
        stdList.append(Student(name: "merry", roll: 2, marks: 89))
        stdList.append(Student(name: "robert", roll: 3, marks: 89))
        stdList.append(Student(name: "mark", roll: 4, marks: 89))
        stdList.append(Student(name: "tom", roll: 5, marks: 89))
        stdList.append(Student(name: "john", roll: 1, marks: 89))
        stdList.append(Student(name: "merry", roll: 2, marks: 89))
        stdList.append(Student(name: "robert", roll: 3, marks: 89))
        stdList.append(Student(name: "mark", roll: 4, marks: 89))
        stdList.append(Student(name: "tom", roll: 5, marks: 89))
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension StudentVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stdList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // indexPath - section #, row #
        
        //1. render cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "stdCell", for: indexPath)
        
        //2. bind data
        let std = stdList[indexPath.row]
        cell.textLabel?.text = std.name
        cell.detailTextLabel?.text = "\(std.roll), Marks: \(std.marks)"
        
        return cell
    }
    
    
}
