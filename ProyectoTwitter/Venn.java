/* 
 * Proyecto Paradigmas de Programación
 * Venn.java
 * 
 * David Lobo Gúzman.
 * Cristian Díaz Jiménez.
 *
 */

import static com.googlecode.charts4j.Color.*;

import com.googlecode.charts4j.Fills;
import com.googlecode.charts4j.GCharts;
import com.googlecode.charts4j.VennDiagram;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;

public class Venn {

  private static ArrayList<Integer> interseccion(ArrayList<Integer> a, ArrayList<Integer> b) {
    ArrayList<Integer> c = new ArrayList<Integer>();
    ArrayList<Integer> iter = a.size() > b.size() ? a : b;
    for (Integer elem : iter) {
      if (a.contains(elem) && b.contains(elem)) {
        c.add(elem);
      }
    }
    return c;
  }

  private static ArrayList<Integer> interseccionS(ArrayList<Integer> a, ArrayList<Integer> b, ArrayList<Integer> c) {
    ArrayList<Integer> d = new ArrayList<Integer>();
    ArrayList<Integer> iter = a.size() > b.size() ? a : b;
    for (Integer elem : iter) {
      if (a.contains(elem) && b.contains(elem) && c.contains(elem)) {
        d.add(elem);
      }
    }
    return d;
  }

  /**
    * @param args the command line arguments
    */
  public static void main(String[] args) throws URISyntaxException, IOException {

    ArrayList<Integer> A = new ArrayList<Integer>();
    A.addAll(Arrays.asList(2, 4, 6, 8, 10));

    ArrayList<Integer> B = new ArrayList<Integer>();
    B.addAll(Arrays.asList(1, 2, 3, 4, 5));

    ArrayList<Integer> C = new ArrayList<Integer>();
    C.addAll(Arrays.asList(1, 6, 9, 4, 10));

    System.out.printf("Intersección\n A: %s\n B: %s\n La interseccion: %s\n", A, B,
            interseccion(A, B));
    System.out.printf("Intersección\n C: %s\n A: %s\n La interseccion: %s\n", A, B,
            interseccion(C, A));
    System.out.printf("Intersección\n C: %s\n A: %s\n La interseccion: %s\n", C, A,
            interseccion(C, A));
    System.out.printf("Intersección\n A: %s\n B: %s\n C: %s\n La interseccion: %s\n", A, B, C,
            interseccionS(A, B, C));

    final VennDiagram chart = GCharts.newVennDiagram(A.size(), B.size(), C.size(),
            interseccion(A, B).size(), interseccion(C, A).size(),
            interseccion(C, A).size(), interseccionS(A, B, C).size());
    /* VennDiagram(circle1Size, circle2Size, circle3Size, abIntersect, 
          caIntersect, bcIntersect, abcIntersect) */

    chart.setTitle("Diagrama de Venn Twitter", BLACK, 16);
    chart.setSize(600, 450);
    chart.setCircleLegends("Palabras Usadas Amigo", "Palabras Usadas Contactos", "Paginas Web");
    chart.setCircleColors(GREEN, YELLOW, WHITE);
    chart.setBackgroundFill(Fills.newSolidFill(LIGHTBLUE));
    String url = chart.toURLString();

    System.err.println(url);
  }
}
