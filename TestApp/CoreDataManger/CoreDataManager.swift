//
//  CoreDataManager.swift
//  TestApp
//
//  Created by ROMAN VRONSKY on 12.03.2023.
//

import CoreData

protocol CoreDataManagerProtocol: AnyObject {
    func createUser(email: String, firstName: String, lastName: String, completion: @escaping (Bool) -> Void)
    func chekUser(firstName: String, context: NSManagedObjectContext) -> User?
    func getUser(firstName: String, completion: (((User)?) -> Void))
}

class CoreDataManager: CoreDataManagerProtocol {
    
    lazy var persistentContainer: NSPersistentContainer = {
       
        let container = NSPersistentContainer(name: "TestApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
               
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

   
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func createUser(email: String, firstName: String, lastName: String, completion: @escaping (Bool) -> Void) {
        persistentContainer.performBackgroundTask { backgroundContext in
            if self.chekUser(firstName: firstName, context: backgroundContext) != nil {
                completion(false)
            } else {
                let user = User(context: backgroundContext)
                user.email = email
                user.firstName = firstName
                user.lastName = lastName
                do {
                    try backgroundContext.save()
                } catch {
                    print(error)
                    completion(false)
                }
                completion(true)
            }
            
        }
    }

    
    func chekUser(firstName: String, context: NSManagedObjectContext) -> User?  {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
       return (try? context.fetch(fetchRequest))?.first
    
    }
    
    func getUser(firstName: String, completion: (((User)?) -> Void) ) {
        let fetchRequest = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", firstName)
        do {
             let user = try persistentContainer.viewContext.fetch(fetchRequest).first
            completion(user)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
}

