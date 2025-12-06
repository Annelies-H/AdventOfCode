import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Collections;

public class Day1 {
    final static String INPUTFILEPATH = "input/Day1";

    public static void main(String[] args) throws FileNotFoundException {
 
        ArrayList<Integer> input = ReadInput.readIntList(INPUTFILEPATH);
        Collections.sort(input);

        int i = 0;
        int j = input.size() - 1;

        while(j > -1 && i < input.size()) {
            int sum = input.get(i) + input.get(j);
            if(sum == 2020) break;
            if(sum < 2020) {
                i++;
            } else {
                j--;
            }
        }

        System.out.println("i: " + input.get(i));
        System.out.println("j: " + input.get(j));
        int puzzle1 = input.get(i) * input.get(j);
        System.out.println("Answer puzzle 1: " + puzzle1 );


        
        boolean notFound = true;
        int k = 0;
        while(notFound && k < input.size()) {
            i = 0;
            j = input.size() - 1;
            while(j > -1 && i < input.size()) {
                int sum = input.get(k) + input.get(i) + input.get(j);
                if(sum == 2020) {
                    System.out.println("i: " + input.get(i));
                    System.out.println("j: " + input.get(j));
                    System.out.println("k: " + input.get(k));
                    int puzzle2 = input.get(i) * input.get(j) * input.get(k);
                    System.out.println("Answer puzzle 2: " + puzzle2);
                    notFound = false;
                    break;
                }
                if(sum < 2020) {
                    i++;
                } else {
                    j--;
                }                  
            }
            k++;
        }

        


    }

    

}