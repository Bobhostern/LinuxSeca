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
public class Result {
    public String saveFileName;
    
    public Result(String savefilename) {
        saveFileName = savefilename;
    }
    
    public void readResults() {
        String saveFile = saveFileName + ".xrsbxl2x";
        ReadFile read = new ReadFile("./Results/" + saveFile);
        List<String> readLines = new ArrayList<>();
        try {
            Collections.addAll(readLines, read.OpenFile());
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
            System.exit(-1);
        }
        String[] lines = readLines.toArray(new String[readLines.size()]);
        for (int i = 0; i < 5; i++) {
            System.out.println(lines[i]);
        }
    }
}
