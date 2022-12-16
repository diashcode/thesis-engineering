package net.diana.taxi;

import net.diana.taxi.tools.CalculateDistance;
import org.junit.Test;

public class CalculateDistanceTest
{
    @Test
    public void testDistance()
    {
        double distance = CalculateDistance.distance(42.876846, 74.56405, 41.338427, 72.218971);
        System.out.println(distance);
    }
}
