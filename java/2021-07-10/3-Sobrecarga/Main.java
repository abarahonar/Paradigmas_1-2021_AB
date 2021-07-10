import java.util.ArrayList;
import java.util.Arrays;

class Main {
    public static void main(String[] args) {
        LinkedList<Integer> singleLinkedList = new LinkedList<Integer>();
        ArrayList<Integer> dataArray = new ArrayList<Integer>(Arrays.asList(6,7,8,9,10));

        singleLinkedList.insert(1);
        singleLinkedList.insert(2);
        singleLinkedList.insert(3);
        singleLinkedList.insert(4);
        singleLinkedList.insert(5);

        singleLinkedList.print();

        singleLinkedList.insert(dataArray);

        singleLinkedList.print();


        DoubleLinkedList<String> DoubleLinkedList = new DoubleLinkedList<String>();

        DoubleLinkedList.insert("a");
        DoubleLinkedList.insert("b");
        DoubleLinkedList.insert("c");
        DoubleLinkedList.insert("d");
        DoubleLinkedList.insert("e");

        DoubleLinkedList.print();
        DoubleLinkedList.printReverse();

    }
}
