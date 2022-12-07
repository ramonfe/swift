class Node{
    var val: String
    var next: Node? = nil

    init(_ val: String){
        self.val = val       
    }
}

class singleLinkedList{
    var head: Node? = nil
    var tail: Node? = nil
    var length = 0
   
    func push(_ val: String) -> singleLinkedList{
        let newNode = Node(val)
        if self.length == 0 {
            self.head = newNode
            self.tail = self.head            
        }else{
            self.tail?.next = newNode
            self.tail = newNode           
        }
        self.length += 1

        return self
    }
}
var n1 = singleLinkedList()
print(n1.push("Hi"))