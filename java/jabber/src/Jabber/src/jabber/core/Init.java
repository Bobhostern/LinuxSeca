package jabber.core;


import fileClass.WriteFile;
import java.io.*;

/**
 *
 * @author onigiri
 */
public class Init {
    public int correct = 0;
    public int incorrect = 0;
    public Check checkmodule;
    public Test testmodule;
    InputStreamReader stdin = new InputStreamReader(System.in);
    BufferedReader cache = new BufferedReader(stdin);
    
    public Init (Check check, Test test) {
        checkmodule = check;
        testmodule = test;
    }
    
    public static void run(Init init) {
        int loopCount = init.checkmodule.LOOP_COUNT;
        String[] questions = init.checkmodule.QUESTIONS;
        String[] answers = init.checkmodule.ANSWERS;
        int _index = 2;
        String answer = "";
        int _correctNum_;
        int yourAns = 0;
        int correctAns;
        for (int i = 1; i <= loopCount; i++) {
            System.out.println(questions[_index++]);
            System.out.println("1 = " + questions[_index++]);
            System.out.println("2 = " + questions[_index++]);
            System.out.println("3 = " + questions[_index++]);
            System.out.println("4 = " + questions[_index++]);
            System.out.println("What is your answer?");
            try {
                answer = init.cache.readLine();
            } catch (IOException ex) {
                System.out.println(ex.getMessage());
                System.exit(-1);
            }
            _correctNum_ = i - 1;
            if (!"".equals(answer)) {
                yourAns = Integer.parseInt(answer);
            }
            correctAns = Integer.parseInt(answers[_correctNum_]);
            if (yourAns == correctAns) {
                init.correct += 1;
            } else {
                init.incorrect += 1;
            }
        }
        Init.fin(init);
    }
    
    public static void fin(Init init) {
        String savefilename = init.testmodule.savefileName; 
        WriteFile cab = new WriteFile("./Results/" + savefilename + ".xrsbxl2x");
        String fileContent = "Correct: " + init.correct + "\nIncorrect: " + init.incorrect
            + "\nName: " + init.testmodule.name + "\nAge: " + init.testmodule.age +
                "\nName of test: " + init.checkmodule.TEST_NAME;
        try {
            cab.writeToFile(fileContent);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        System.out.println("Do you want to view your results? (yes|no)");
        String choice = "";
        try {
            choice = init.cache.readLine();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        choice = choice.toLowerCase();
        switch (choice) {
            case "yes":
                {
                    Result read = new Result(init.testmodule.savefileName);
                    read.readResults();
                    break;
                }
            case "y":
                {
                    Result read = new Result(init.testmodule.savefileName);
                    read.readResults();
                    break;
                }
        }
    }
}
