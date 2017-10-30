/* 
 * Proyecto Investigación Paradigmas de Programación
 * royaleandcheese.java
 * 
 * David Lobo Gúzman.
 * Cristian Díaz Jiménez.
 *
 */
package javaapplication1;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class royaleandcheese {

    public int parseo(int n) {
        if (n >= 20) {
            n += 30;
        }
        if (n % 10 == 2 || n % 10 == 6) {
            return n + 3;
        }
        if (n % 10 == 5 || n % 10 == 9) {
            return n - 3;
        }
        return n;
    }

    public String coding(String input) {
        Map<Character, String> map = new HashMap<Character, String>();
        String output = "";
        int size = input.length();
        if (size < 100000 && input.matches("[a-z]+")) {
            int i = 0, j = 1;
            for (; i < size; i++) {
                if (!map.containsKey(input.charAt(i))) {
                    map.put(input.charAt(i), parseo(j++) + "");
                    output += map.get(input.charAt(i));
                } else {
                    output += map.get(input.charAt(i));
                }
            }
        }
        return output;
    }

    public static void main(String[] args) throws IOException {

        royaleandcheese m = new royaleandcheese();
        Scanner sc = new Scanner(System.in);

        while (sc.hasNext()) {
            System.out.println(m.coding(sc.nextLine()));
        }
    }
}
