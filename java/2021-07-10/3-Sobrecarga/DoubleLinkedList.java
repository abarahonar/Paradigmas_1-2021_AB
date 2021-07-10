class DoubleLinkedList<T> extends LinkedList<T>{
    Node tail;

    public void printReverse() {
        Node current = this.tail;
        
        while (current != null) {
            System.out.print(current.data + "->");
            current = current.prev;
        }

        System.out.println("null");
    }

    public void insert(T data) {
        Node new_node = new Node<T>(data);

        if (this.head == null) {
            this.head = new_node;
            this.tail = new_node;
            return;
        }

        Node current = this.head;
        while (current.next != null) {
            current = current.next;
        }

        new_node.prev = current;
        current.next = new_node;

        this.tail = new_node;
    }
}
