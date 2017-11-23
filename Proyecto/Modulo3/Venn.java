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
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


public class Venn {

  private static ArrayList<String> interseccion(ArrayList<String> a, ArrayList<String> b) {
    ArrayList<String> c = new ArrayList<String>();
    ArrayList<String> iter = a.size() > b.size() ? a : b;
    for (String elem : iter) {
      if (a.contains(elem) && b.contains(elem)) {
        c.add(elem);
      }
    }
    return c;
  }

  private static ArrayList<String> interseccionS(ArrayList<String> a, ArrayList<String> b, ArrayList<String> c) {
    ArrayList<String> d = new ArrayList<String>();
    ArrayList<String> iter = a.size() > b.size() ? a : b;
    for (String elem : iter) {
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
    int totalPalabras=0, totalHashtags=0, totalAmigo=0, total=0;
    ArrayList<String> frecuenciaATotal = new ArrayList<>();
    ArrayList<String> frecuenciaHTotal = new ArrayList<>();
    ArrayList<String> frecuenciaPTotal = new ArrayList<>();
    ArrayList<String> nAmigos = new ArrayList<>();
    ArrayList<String> nPalabras = new ArrayList<>();
    ArrayList<String> nHashtags = new ArrayList<>();
    int contador =0;
    
    try(BufferedReader br = new BufferedReader(new FileReader("frecAmigo"))) {
            for(String line; (line = br.readLine()) != null; ) {
                if (contador%2 == 0){
                    frecuenciaATotal.add("[" + line);
                    nAmigos.add(line);
                } else {
                   frecuenciaATotal.add(line + "]"); 
                }
                contador++;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    try(BufferedReader br = new BufferedReader(new FileReader("frechashtags"))) {
            for(String line; (line = br.readLine()) != null; ) {
                if (contador%2 == 0){
                    frecuenciaHTotal.add("[" + line);
                    nHashtags.add(line);
                } else {
                   frecuenciaHTotal.add(line + "]"); 
                }
                contador++;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    try(BufferedReader br = new BufferedReader(new FileReader("frecUsuario"))) {
            for(String line; (line = br.readLine()) != null; ) {
                if (contador%2 == 0){
                    frecuenciaPTotal.add("[" + line);
                    nPalabras.add(line);
                } else {
                   frecuenciaPTotal.add(line + "]"); 
                }
                contador++;
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Venn.class.getName()).log(Level.SEVERE, null, ex);
        }
    

    final VennDiagram chart = GCharts.newVennDiagram(frecuenciaATotal.size(), frecuenciaHTotal.size(), frecuenciaPTotal.size(),
        Venn.interseccion(frecuenciaATotal, frecuenciaHTotal).size(), Venn.interseccion(frecuenciaPTotal, frecuenciaATotal).size(),
        Venn.interseccion(frecuenciaPTotal, frecuenciaHTotal).size(), Venn.interseccionS(frecuenciaATotal, frecuenciaHTotal, 
        frecuenciaPTotal).size());
        
    /* VennDiagram(circle1Size, circle2Size, circle3Size, abIntersect, 
          caIntersect, bcIntersect, abcIntersect) */

    chart.setTitle("Diagrama de Venn", BLACK, 18);
    chart.setSize(600, 450);
    chart.setCircleLegends("Palabras Usadas Amigo", "Palabras Usadas Contactos", "Paginas Web");
    chart.setCircleColors(GREEN, YELLOW, WHITE);
    chart.setBackgroundFill(Fills.newSolidFill(PALEGREEN));
    String url = chart.toURLString();

    System.err.println(url);
  }
}
