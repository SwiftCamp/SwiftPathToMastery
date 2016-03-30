//
//  AppDelegate.swift
//  Generics Example
//
//  Created by João Mourato on 23/03/16.
//  Copyright © 2016 iOSwiftCamp. All rights reserved.
//

import UIKit

enum API {
  static let Name = "Name"
  static let Id = "Id"
  static let Title = "Title"
  static let ListId = "ListId"
  static let Done = "Done"
}

struct List {
  let name: String
  let id: Int
}

struct Todo {
  let title: String
  let listId: Int
  let done: Bool
}

extension List {
  init?(json: [String:AnyObject]){
    guard let name = json[API.Name] as? String,
      let id = json[API.Id] as? Int else { return nil }
    self.name = name
    self.id = id
  }
}

extension Todo {
  init?(json: [String:AnyObject]){
    guard let title = json[API.Title] as? String,
      let listId = json[API.ListId] as? Int,
      let done = json[API.Done] as? Bool
      else { return nil }
    self.title = title
    self.listId = listId
    self.done = done
  }
}

let listsURL = NSURL(string: "https://raw.githubusercontent.com/SwiftCamp/SwiftPathToMastery/Generics/master/persons.json")!
let todosURL = NSURL(string: "https://raw.githubusercontent.com/SwiftCamp/SwiftPathToMastery/Generics/master/0.json")!

func loadTodos () -> [Todo]? {
  if let data = NSData(contentsOfURL: todosURL),
    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()),
    let lists = json as? [[String:AnyObject]]{
    return lists.flatMap(Todo.init)
  }
  return nil
}


func loadLists() -> [List]? {
  if let data = NSData(contentsOfURL: listsURL),
    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()),
    let lists = json as? [[String:AnyObject]]{
    return lists.flatMap(List.init)
  }
  return nil
}

class TableVC: UITableViewController {
  var items: [List] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    items = loadLists() ?? []
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
    let item = items[indexPath.row]
    cell.textLabel?.text = item.name
    return cell
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    let viewController = TableVC(style: .Plain)
    let navigationController = UINavigationController(rootViewController: viewController)
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
    
    print(loadTodos())
    
    testConformityToProtocol()
    
    return true
  }
}

