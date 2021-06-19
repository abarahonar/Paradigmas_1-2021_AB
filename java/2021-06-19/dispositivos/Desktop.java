package dispositivos;

import hardware.RAM;
import support.Technician;

public class Desktop {
    private RAM ram;

    public Desktop() {
    }

    public void setRAM(RAM ram, Technician tech) {
        this.ram = tech.installRAM(ram); //Paso por referencia
    }

    public RAM getRAM() {
        return this.ram;
    }
}
