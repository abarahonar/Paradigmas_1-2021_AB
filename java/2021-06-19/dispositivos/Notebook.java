package dispositivos;

import hardware.RAM;

public class Notebook {
    private RAM ram;

    public Notebook(int size) {
        this.ram = new RAM(size);
    }

    public RAM getRAM() {
        return this.ram;
    }
}
