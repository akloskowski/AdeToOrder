public abstract class Arccos implements Expression {

private double A;

public Arccos() {
A = 0.0;
}

public Arccos(double a) {
A = a;
}

public double getValue(double A) {
return Math.acos(A);
}

}