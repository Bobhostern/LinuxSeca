package jabber.core;

import fileClass.ReadFile;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author onigiri
 */
public class Check {
    public final int LOOP_COUNT;
    public final String[][] DATA;
    public final String[] QUESTIONS;
    public final String[] ANSWERS;
    public final String TEST_NAME;
    
    public Check() {
        DATA = this.checkDependencies();
        QUESTIONS = DATA[0];
        ANSWERS = DATA[1];
        LOOP_COUNT = Integer.parseInt(QUESTIONS[0]);
        TEST_NAME = QUESTIONS[1];
    }
    
    public final String[][] checkDependencies() {
        ReadFile questions = new ReadFile("./libx/questions.rsbin2");
        ReadFile answers = new ReadFile("./libx/answers.rsbin2");
        List<String> returnQuestions = new ArrayList<>();
        List<String> returnAnswers = new ArrayList<>();
        try {
            Collections.addAll(returnQuestions, questions.OpenFile());
            Collections.addAll(returnAnswers, answers.OpenFile());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        String[][] returnArray = {returnQuestions.toArray(new String[returnQuestions.size()]), 
            returnAnswers.toArray(new String[returnAnswers.size()])};
        return returnArray;
    }
}
