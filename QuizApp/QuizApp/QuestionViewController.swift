//
//  QuestionViewController.swift
//  QuizApp
//
//  Created by Pedro Freddi on 09/02/23.
//

import Foundation
import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - Properties
    
    private var question: String = ""
    private var options: [String] = []
    
    var headerLabel: UILabel = UILabel()
    var tableView: UITableView = UITableView()

    // MARK: - Lifecycle

    convenience init(question: String, options: [String]) {
        self.init()
        self.question = question
        self.options = options
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestionHeader()
        setupTableView()
    }
    
    // MARK: - UI Setup
    
    func setupQuestionHeader() {
        headerLabel.text = question
        view.addSubview(headerLabel)
        headerLabel.center = view.center
    }
    
    func setupTableView() {
        tableView.dataSource = self
    }
}

extension QuestionViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        content.text = options[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
}
