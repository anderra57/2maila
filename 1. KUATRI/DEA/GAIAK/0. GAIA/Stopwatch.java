package packSortAndSearch;

public class Stopwatch { 

    private final long start;

   /**
     * Create a stopwatch object.
     */
    /*  For additional documentation, see
    *  <a href="http://introcs.cs.princeton.edu/32class">Section 3.2</a> of
    *  <i>Introduction to Programming in Java: An Interdisciplinary 
               Approach</i>
    *  by Robert Sedgewick and Kevin Wayne. */

    public Stopwatch() {
        start = System.currentTimeMillis();
    } 

   /**
     * Return elapsed time (in seconds) since this object was created.
     */
    public double elapsedTime() {
        long now = System.currentTimeMillis();
        return (now - start) / 1000.0;
    }
}
