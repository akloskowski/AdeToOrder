public abstract class Arcsin implements Expression {

private double A;

public Arcsin() {
A = 0.0;
}

public Arcsin(double a) {
A = a;
}

public double getValue(double A) {
return Math.asin(A);
}

}