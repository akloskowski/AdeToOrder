public abstract class Arctan implements Expression {

private double A;

public Arctan() {
A = 0.0;
}

public Arctan(double a) {
A = a;
}

public double getValue(double A) {
return Math.atan(A);
}

}