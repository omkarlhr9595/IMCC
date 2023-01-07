//Add Node to given position in DOUBLY LinkedList
class Node {
  constructor(data) {
    this.prev = null;
    this.data = data;
    this.next = null;
  }
}

class LinkedList {
  addAtEnd(data) {
    let temp = new Node(data);
    if (this.head == null) {
      this.head = temp;
      return;
    }
    let last = this.head;
    while (last.next != null) {
      last = last.next;
    }
    last.next = temp;
    temp.prev = last;
  }

  addAtPo(position, data) {
    console.log("After insert at given position");
    let n = new Node(data);

    //Step 1: check if positionis 1
    if (position == 1) {
      n.next = this.head;
      this.head.prev = n;
      this.head = n;
      return;
    }
    let curr = this.head;
    //let prevn;
    let count = 1;
    while (count < position) {
      // prevn = curr;
      curr = curr.next;
      count++;
    }
    //n.prev = curr.prev.prev.next;
    n.prev = curr.prev;
    n.next = curr;
    n.prev.next = n;
    curr.prev = n;

    //curr.prev.next  = n;
  }
  display() {
    let current = this.head;
    while (current != null) {
      console.log(current.data);
      current = current.next;
    }
  }

  delete(position) {
    if (position == 1) {
      let temp = this.head;
      this.head.next.prev = null;
      this.head = temp.next;
      return;
    }

    let count = 1;
    let curr = this.head;
    while (count < position) {
      // prevn = curr;
      curr = curr.next;
      count++;
    }

    if (curr.next == null) {
      curr.prev.next = null;
      return;
    } else {
      let prev = curr.prev;
      let next = curr.next;

      prev.next = next;
      next.prev = prev;
    }
  }
}
const ll = new LinkedList();
ll.addAtEnd(10);
ll.addAtEnd(20);
ll.addAtEnd(30);
ll.addAtEnd(40);
ll.addAtEnd(50);
ll.addAtEnd(60);
ll.display();

console.log("\n");

ll.delete(6);
ll.display();
