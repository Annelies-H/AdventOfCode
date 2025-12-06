import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class ReadInput {
    
    public static ArrayList<Integer> readIntList(String filepath) throws FileNotFoundException{
        Scanner s = new Scanner(new File(filepath));
        ArrayList<Integer> input = new ArrayList<>();
        while (s.hasNext()){
            input.add(Integer.parseInt(s.next()));
        }
        s.close();
        return input;
    }

    public static ArrayList<String> readStringList(String filepath) throws FileNotFoundException{
        Scanner s = new Scanner(new File(filepath));
        ArrayList<String> input = new ArrayList<>();
        while (s.hasNext()){
            input.add(s.next());
        }
        s.close();
        return input;
    }

}
