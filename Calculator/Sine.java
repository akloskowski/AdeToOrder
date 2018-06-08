public abstract class Sine implements Expression {

private double A;

public Sine() {
A = 0.0;
}

public Sine(double a) {
A = a;
}

public double getValue(double A) {
return Math.sin(A);
}

}