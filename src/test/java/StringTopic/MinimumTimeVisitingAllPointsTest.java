package StringTopic;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class MinimumTimeVisitingAllPointsTest {
    MinimumTimeVisitingAllPoints minimumTimeVisitingAllPoints = new MinimumTimeVisitingAllPoints();
    @Test
    void minTimeToVisitAllPoints() {
        int [][] s = {{1,1},{3,4},{-1,0}};
        assertEquals(7,minimumTimeVisitingAllPoints.minTimeToVisitAllPoints(s));
        int [][] s2 = {{3,2},{-2,2}};
        assertEquals(5,minimumTimeVisitingAllPoints.minTimeToVisitAllPoints(s2));
    }
}