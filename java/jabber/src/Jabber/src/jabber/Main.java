package jabber;

import jabber.core.Test;
import java.io.*;

/**
 *
 * @author onigiri
 */
public class Main {
    public static void main(String[] args) {
        InputStreamReader stdin = new InputStreamReader(System.in);
        BufferedReader cache = new BufferedReader(stdin);
        System.out.println("Are you new? (yes|no)");
        String choice = "";
        try {
            choice = cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        choice = choice.toLowerCase();
        switch (choice) {
            case "yes":
            case "y":
                System.out.println("What is your name?");
                String name = "";
                String age = "";
                try {
                    name = cache.readLine();
                } catch (IOException ex) {
                    System.out.println(ex.getMessage());
                    System.exit(-1);
                }
                System.out.println("What age?");
                try {
                    age = cache.readLine();
                } catch (IOException ex) {
                    System.out.println(ex.getMessage());
                    System.exit(-1);
                }
                int _age_ = Integer.parseInt(age);
                Test main = new Test (name, _age_);
                main.mainMenu();
                break;
            case "no":
            case "n":
                Test mainx = new Test("Nil", 0);
                mainx.loadGame();
                break;
        }
    }
}
