class LinkedList<T> {
    Node head;

    public void print() {
        Node current = this.head;

        while (current != null) {
            System.out.print(current.data + "->");
            current = current.next;
        }

        System.out.println("null");
    }

    public void insert(T data) {
        Node new_node = new Node<T>(data);

        if (this.head == null) {
            this.head = new_node;
            return;
        }

        Node current = this.head;
        while (current.next != null) {
            current = current.next;
        }
        current.next = new_node;
    }
}
