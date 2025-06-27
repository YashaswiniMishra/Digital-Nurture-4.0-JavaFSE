import static org.junit.Assert.*;
import org.junit.*;

public class CalculatorTest {

    private Calculator calculator;

    @Before
    public void setUp() {
        calculator = new Calculator();
    }

    @After
    public void tearDown() {
        calculator = null;
    }

    @Test
    public void testAdd() {
        int result = calculator.add(4, 3); // act
        assertEquals(7, result);          // assert
    }

    @Test
    public void testSubtract() {
        int result = calculator.subtract(10, 5); // act
        assertEquals(5, result);                // assert
    }
}
