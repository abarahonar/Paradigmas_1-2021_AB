import dispositivos.Notebook;
import dispositivos.Desktop;
import hardware.RAM;
import support.Technician;

public class Shop {
    public static void main(String[] args) {
        Technician alan = new Technician("Alan");
        Notebook asus = new Notebook(4);
        Desktop tarro = new Desktop();
        tarro.setRAM(new RAM(4), alan);

        String msg = "Tamaño de RAM: %d";

        System.out.print("Notebook\t");
        System.out.println(String.format(msg, asus.getRAM().size));
        System.out.print("Desktop \t");
        System.out.println(String.format(msg, tarro.getRAM().size));

        System.out.print("\nLema de los técnicos: ");
        System.out.println(Technician.getMotto());
        //System.out.println(alan.getMotto());
        
        alan.salute();
    }
}
