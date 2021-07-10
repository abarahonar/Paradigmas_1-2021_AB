class Node<T> {
    T data;
    Node next;
    Node prev;
    boolean isEnd;

    Node(T d) {
        this.data = d;
        this.next = null;
        this.prev = null;
        this.isEnd = false;
    }
}
