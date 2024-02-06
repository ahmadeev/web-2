package beans;

//Бин имеет public конструктор без параметров
//Бин реализует интерфейс Serializable
//Бин имеет набор геттеров и сеттеров
//Бин переопределяет equals(), hashCode(), toString()

import java.io.Serializable;

public class Hit implements Serializable {
    private double x;
    private double y;
    private double R;
    private boolean result;

    public Hit() {
    }

    public double getX() {
        return x;
    }

    public double getY() {
        return y;
    }

    public double getR() {
        return R;
    }

    public boolean isResult() {
        return result;
    }

    public void setX(double x) {
        this.x = x;
    }

    public void setY(double y) {
        this.y = y;
    }

    public void setR(double r) {
        R = r;
    }

    public void setResult(boolean result) {
        this.result = result;
    }

    @Override
    public String toString() {
        return "Hit{" +
                "x=" + x +
                ", y=" + y +
                ", r=" + R +
                ", result=" + result +
                "}";
    }
}
