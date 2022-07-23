
import java.util.HashSet;
import java.util.Scanner;

class answer {

  int sum_aux;
  boolean validity_aux;
  int num1_aux;
  int num2_aux;

  answer(int sum, boolean validity, int num1, int num2) {
    sum_aux = sum;
    validity_aux = validity;
    num1_aux = num1;
    num2_aux = num2;
  }
}

public class daily1 {

  public static void main(String[] args) {
    
    int method;
    int n;
    int k;
    Scanner input = new Scanner(System.in);
    System.out.println("####DAILY CODING PROBLEM 1####\nChoose a method:");
    System.out.println("1)Naive method\n2)Better method");
    method = input.nextInt();
    System.out.println("Insert N");
    n = input.nextInt();
    int values[] = new int[n];
    for (int i = 0; i < n; i++) {
      System.out.println("Insert number " + (i+1));
      values[i] = input.nextInt();
    }
    System.out.println("Insert K");
    k = input.nextInt();
    input.close();
    if (method == 1) {
      answer ans = GetNaive_Sol(values, k);
      if (ans.validity_aux) {
        System.out.println(
          "There is a match " +
          ans.num1_aux +
          "+" +
          ans.num2_aux +
          "=" +
          ans.sum_aux
        );
      } else {
        System.out.println("There is no match");
      }
    }
    if (method == 2) {
      answer ans = GetBetter_Sol(values, k);
      if (ans.validity_aux) {
        System.out.println(
          "There is a match " +
          ans.num1_aux +
          "+" +
          ans.num2_aux +
          "=" +
          ans.sum_aux
        );
      } else {
        System.out.println("There is no match");
      }
    }
  }

  /*####################################
 ####################################*/
  public static answer GetNaive_Sol(int[] values, int k) {
    int sum = 0, num1 = 0, num2 = 0;
    boolean validity = false;

    for (int i = 0; i < values.length; i = i + 1) {
      for (int j = 0; j < values.length; j = j + 1) {
        if (!(i == j)) {
          sum = values[i] + values[j];
          num1 = values[i];
          num2 = values[j];
          if (sum == k) {
            validity = true;
            break;
          } else {
            continue;
          }
        } else {
          j++;
        }
      }
      if (sum == k) {
        break;
      }
    }
    return new answer(sum, validity, num1, num2);
  }

  /*####################################
 ####################################*/

  public static answer GetBetter_Sol(int[] values, int k) {
    int num1 = 0, num2 = 0;
    boolean validity = false;
    HashSet<Integer> ValContainer = new HashSet<Integer>();

    for (int i = 0; i < values.length; i++) {
      if (ValContainer.contains(values[i])) {
        validity = true;
        num1 = values[i];
        num2 = k - values[i];
        return new answer(k, validity, num1, num2);
      } else {
        ValContainer.add(k - values[i]);
      }
    }
    return new answer(k, validity, num1, num2);
  }
  /*####################################
 ####################################*/
}
