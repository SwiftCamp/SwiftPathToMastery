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

struct Person {
  let name: String
  let id: Int
}

struct Todo {
  let title: String
  let listId: Int
  let done: Bool
}

extension Person {
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

func todosResource(personId: Int) -> Resource<Todo> {
  return Resource(url: NSURL(string: "https://raw.githubusercontent.com/SwiftCamp/SwiftPathToMastery/Generics/master/\(personId).json")!, parse: Todo.init)
}

let listsResouce = Resource(url: listsURL, parse: Person.init)

func App() -> UINavigationController {
  let viewController = TableVC(resource: listsResouce) { (cell, item) in
    cell.textLabel?.text = item.name
  }
  let navigationController = UINavigationController(rootViewController: viewController)
  viewController.didSelect = { person in
    let todosVC = TableVC(resource: todosResource(person.id), configureCell: { (cell, todo) in
      cell.textLabel?.text = todo.title
      cell.accessoryType = todo.done ? .Checkmark : .None
    })
    navigationController.pushViewController(todosVC, animated: true)
  }
  return navigationController
}

struct Resource<R> {
  let url : NSURL
  let parse: [String:AnyObject] -> R?
}

func loadResource<R>(resource: Resource<R> ) -> [R]? {
  if let data = NSData(contentsOfURL: resource.url),
    let json = try? NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()),
    let lists = json as? [[String:AnyObject]]{
    return lists.flatMap(resource.parse)
  }
  return nil
}

class TableVC<R>: UITableViewController {
  var items: [R] = [] {
    didSet {
      tableView.reloadData()
    }
  }
  
  let resource: Resource<R>
  let configureCell: (UITableViewCell, R) -> ()
  var didSelect: R -> () = { _ in }
  
  init(resource: Resource<R>, configureCell: (UITableViewCell,R) -> ()) {
    self.resource = resource
    self.configureCell = configureCell
    super.init(style: .Plain)
  }
  
  override func viewDidLoad() {
    items = loadResource(resource) ?? []
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
    let item = items[indexPath.row]
    configureCell(cell,item)
    return cell
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    let item = items[indexPath.row]
    didSelect(item)
  }
  
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    
    window = UIWindow(frame: UIScreen.mainScreen().bounds)
    window?.rootViewController = App()
    window?.makeKeyAndVisible()
    
    return true
  }
}

