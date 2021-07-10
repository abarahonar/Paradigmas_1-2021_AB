class Main {
    public static void main(String[] args) {
        LinkedList<Integer> number_list = new LinkedList<Integer>();

        number_list.insert(1);
        number_list.insert(2);
        number_list.insert(3);
        number_list.insert(4);
        number_list.insert(5);

        number_list.print();

        LinkedList<String> string_list = new LinkedList<String>();

        string_list.insert("a");
        string_list.insert("b");
        string_list.insert("c");
        string_list.insert("d");
        string_list.insert("e");

        string_list.print();

    }
}
