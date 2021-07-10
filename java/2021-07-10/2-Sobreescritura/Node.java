class Node<T> {
    T data;
    Node next;
    Node prev;

    Node(T d) {
        this.data = d;
        this.next = null;
        this.prev = null;
    }
}
