package support;

import hardware.RAM;

public class Technician {
    private static String motto = "Who you gonna call? Bug busters";
    private String name;

    public Technician(String name) {
        this.name = name;
    }

    public RAM installRAM(RAM ram) {
        return ram;
    }

    public void salute() {
        System.out.print("¡Hola! Me llamo " + this.name);
        System.out.println(" y mi lema es " + motto);
    }

    public static String getMotto() {
        return motto;
    }
}
