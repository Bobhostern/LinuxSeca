package jabber.core;

import fileClass.ReadFile;
import fileClass.WriteFile;
import java.io.*;

/**
 *
 * @author onigiri
 */
public class Test {
    public String name;
    public int age;
    public String savefileName;
    public String testname;
    public String mainfileName;
    InputStreamReader stdin = new InputStreamReader(System.in);
    BufferedReader cache = new BufferedReader(stdin);
    public Check checkmodule = new Check();
    
    public Test(String _name, int _age) {
        name = _name;
        age = _age;
        testname = checkmodule.TEST_NAME;
    }
    
    public Test(String _name, String _age) {
        name = _name;
        age = Integer.parseInt(_age);
        testname = checkmodule.TEST_NAME;
    }
    
    public void mainMenu() {
        System.out.println("Do you want to save a profile or start a test? SaP = Save StT = Start");
        String choice = "";
        try {
            choice = cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        choice = choice.toLowerCase();
        switch (choice) {
            case "sap":
                this.saveGame();
                break;
            case "stt":
                this.startGame();
                break;
        }
    }
    
    public void startGame() {
        System.out.println("You wish to start.");
        System.out.println("Checking dependencies...");
        System.out.println("Initializing...");
        Init man = new Init(checkmodule, this);
        Init.run(man);
    }
    
    public void saveGame() {
        System.out.println("What do you want the filename to be? This is used to load it.");
        try {
            mainfileName = cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        System.out.println("What do you want the result file name to be?");
        try {
            savefileName = cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        WriteFile write = new WriteFile("./Saves/" + mainfileName + ".rsbxl2");
        String suffix = "\n";
        String fileContents = name + suffix + age + suffix + testname + suffix + savefileName;
        try {
            write.writeToFile(fileContents);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        System.out.println("Do you wish to continue? (yes|no)");
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
                this.startGame();
                break;
            case "y":
                this.startGame();
                break;
        }
    }
    
    public void loadGame() {
        System.out.println("What is the filename? For maders.rsbxl2, type maders.");
        try {
            mainfileName = cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        ReadFile read = new ReadFile("./Saves/" + mainfileName + ".rsbxl2");
        String[] lines = new String[4];
        try {
            lines = read.OpenFile();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        name = lines[0];
        age = Integer.parseInt(lines[1]);
        testname = lines[2];
        savefileName = lines[3];
        System.out.println("Load Successful.");
        this.startGame();
    }
}
