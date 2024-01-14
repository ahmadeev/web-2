package utils;

public class Point {
    private final int x;
    private final double y;
    private final int r;
    private final boolean isInArea;

    public Point(int x, double y, int r) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.isInArea = isInside(x, y, r);
    }

    private boolean isInside(int x, double y, int r) {
        //Top-right
        if (x >= 0 && y >= 0) {
            return (x * x + y * y) <= (r / 2) * (r / 2);
        }
        //Top-left
        if (x < 0 && y >= 0) {
            return (y <= r) && (x >= (-r) / 2);
        }
        //Bottom-left
        if (x <= 0 && y < 0) {
            return (y >= -x - r / 2);
        }
        //Bottom-right
        return false;
    }

}
