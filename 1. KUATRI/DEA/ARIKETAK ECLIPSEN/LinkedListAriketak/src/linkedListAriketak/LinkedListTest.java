package linkedListAriketak;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class LinkedListTest {
	
	LinkedList<Integer> L1 = new LinkedList<Integer>();
	LinkedList<Integer> L2 = new LinkedList<Integer>();

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testAzpiLista() {
		L1.add(20);
		L1.add(17);
		L1.add(5);
		
		L2.add(20);
		L2.add(17);
		L2.add(10);
		L2.add(5);
		
		assertTrue(L2.azpiLista(L1));
	}

}
