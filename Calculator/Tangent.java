public abstract class Tangent implements Expression {

private double A;

public Tangent() {
A = 0.0;
}

public Tangent(double a) {
A = a;
}


public double getValue(double A) {
return Math.tan(A);
}

}