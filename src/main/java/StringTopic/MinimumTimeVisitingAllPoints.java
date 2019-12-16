package StringTopic;

public class MinimumTimeVisitingAllPoints {
    private int maxTimeBetweenTwoPoints(int[] a,int[] b){
        return Math.max(Math.abs(a[0]-b[0]),Math.abs(a[1]-b[1]));
    }
    public int minTimeToVisitAllPoints(int[][] points) {
        if (points.length == 1)
            return 0;
        int timmer = 0;
        for (int i = 1;i<points.length;i++){
            timmer += maxTimeBetweenTwoPoints(points[i],points[i-1]);

        }
        return timmer;
    }
}
