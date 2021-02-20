import Foundation

class ListContactsPresenter {
    private let service = ListContactService()
    
    private var completion: (([ContactDTO]?, Error?) -> Void)?
    
    init() { }
    
    func loadContacts(_ completion: @escaping ([ContactDTO]?, Error?) -> Void) {
        self.completion = completion
        service.fetchContacts { contacts, err in
            self.handle(contacts, err)
        }
    }
    
    private func handle(_ contacts: [ContactDTO]?, _ error: Error?) {
        if let e = error {
            completion?(nil, e)
        }
        
        if let contacts = contacts {
            completion?(contacts, nil)
        }
    }
}
