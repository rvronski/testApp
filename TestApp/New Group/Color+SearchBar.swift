//
//  Color.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 11.03.2023.
//

import UIKit

extension UIColor {
    static var buttonColor: UIColor = #colorLiteral(red: 0.3052096963, green: 0.3318368793, blue: 0.8421060443, alpha: 1)
    static var backgroundColor: UIColor = #colorLiteral(red: 0.9803897738, green: 0.9764357209, blue: 1, alpha: 1)
    static var earlGrey: UIColor = #colorLiteral(red: 0.9098039269, green: 0.9098039269, blue: 0.9098039269, alpha: 1)
    static var eyes: UIColor = #colorLiteral(red: 0.3607842922, green: 0.3607842922, blue: 0.3607842922, alpha: 1)
    
}
var resultsList:[String] = [String]()
class CustomSearchBar: UISearchBar {
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundImage = UIImage()
        let searchTextField:UITextField = self.searchTextField
        searchTextField.textAlignment = .left
        searchTextField.layer.cornerRadius = 20
        searchTextField.layer.masksToBounds = true
        setSearchFieldBackgroundImage(UIImage(named: "backgroundImage"), for: .normal)
        searchTextField.leftView = nil
        searchTextField.placeholder = "      What are you looking for?"
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var tableView: UITableView?
    
    // Connecting the new element to the parent view
    open override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        tableView?.removeFromSuperview()
        
    }
    
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        self.searchTextField.addTarget(self, action: #selector(CustomSearchBar.textFieldDidChange), for: .editingChanged)
        self.searchTextField.addTarget(self, action: #selector(CustomSearchBar.textFieldDidBeginEditing), for: .editingDidBegin)
        self.searchTextField.addTarget(self, action: #selector(CustomSearchBar.textFieldDidEndEditing), for: .editingDidEnd)
        self.searchTextField.addTarget(self, action: #selector(CustomSearchBar.textFieldDidEndEditingOnExit), for: .editingDidEndOnExit)
    }
    
    
    @objc open func textFieldDidChange(){
        print("Text changed ...")
        buildSearchTableView()
        updateSearchTableView()
        tableView?.isHidden = false
    }
    
    @objc open func textFieldDidBeginEditing() {
        
        tableView?.isHidden = false
        tableView?.reloadData()
        print(resultsList.count)
    }
    
    @objc open func textFieldDidEndEditing() {
        print("End editing")
        tableView?.isHidden = true
        searchTextField.endEditing(true)
        print(resultsList.count)
    }
    
    @objc open func textFieldDidEndEditingOnExit() {
        print("End on Exit")
        
        tableView?.isHidden = true
       
        print(resultsList.count)
    }
    
}

extension CustomSearchBar: UITableViewDelegate, UITableViewDataSource {
    

    // MARK: TableView creation and updating
    
    // Create SearchTableview
    func buildSearchTableView() {

        if let tableView = tableView {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CustomSearchTextFieldCell")
            tableView.delegate = self
            tableView.dataSource = self
            self.window?.addSubview(tableView)

        } else {
            //addData()
            print("tableView created")
            tableView = UITableView(frame: CGRect.zero)
        }
        
        updateSearchTableView()
    }
    
    // Updating SearchtableView
    func updateSearchTableView() {
        
        if let tableView = tableView {
            superview?.bringSubviewToFront(tableView)
            var tableHeight: CGFloat = 0
            tableHeight = tableView.contentSize.height
            
            // Set a bottom margin of 10p
            if tableHeight < tableView.contentSize.height {
                tableHeight -= 10
            }
            
            // Set tableView frame
            var tableViewFrame = CGRect(x: 0, y: 0, width: frame.size.width - 4, height: tableHeight)
            tableViewFrame.origin = self.convert(tableViewFrame.origin, to: nil)
            tableViewFrame.origin.x += 2
            tableViewFrame.origin.y += frame.size.height + 2
            UIView.animate(withDuration: 0.2, animations: { [weak self] in
                self?.tableView?.frame = tableViewFrame
            })
            
            //Setting tableView style
            tableView.layer.masksToBounds = true
            tableView.separatorInset = UIEdgeInsets.zero
            tableView.layer.cornerRadius = 5.0
            tableView.separatorColor = UIColor.lightGray
            tableView.backgroundColor = UIColor.white
            
            if self.isFirstResponder {
                superview?.bringSubviewToFront(self)
            }
            
            tableView.reloadData()
        }
    }
    
    
    
    // MARK: TableViewDataSource methods
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(resultsList.count)
        return resultsList.count
    }
    
    // MARK: TableViewDelegate methods
    
    //Adding rows in the tableview with the data from dataList

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomSearchTextFieldCell", for: indexPath) as UITableViewCell
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.text = resultsList[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row")
        searchTextField.text = resultsList[indexPath.row]
        tableView.isHidden = true
        searchTextField.endEditing(true)
      
    }
       
}
