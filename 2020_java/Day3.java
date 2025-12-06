import java.io.FileNotFoundException;
import java.util.ArrayList;

public class Day3 {
    final static String INPUTFILEPATH = "input/Day3";  

    public static void main(String[] args) throws FileNotFoundException {

        ArrayList<String> input = ReadInput.readStringList(INPUTFILEPATH);
        
        System.out.println("Puzzel 1: " + countTrees(input, 1, 1));
        System.out.println("=========");
        System.out.println("Puzzel 2: " + (countTrees(input, 1, 1) * countTrees(input, 3, 1) * 
                                                countTrees(input, 5, 1) * countTrees(input, 7, 1) * countTrees(input, 1, 2)));
        
    }

    private static int countTrees(ArrayList<String> input, int dx, int dy) {
        int totalTrees = 0;
        int patternWidth = input.get(0).length();
        int index = 0;
        for (int i = 0; i < input.size(); i = i + dy) {
            String row = input.get(i);
            int position =  index % (patternWidth); //use modulo to loop over input string
            if (row.charAt(position) == '#' ) totalTrees++;
            index = index + dx;
        }
        System.out.println("aantal bomen: " + totalTrees);
        return totalTrees;

    }

}