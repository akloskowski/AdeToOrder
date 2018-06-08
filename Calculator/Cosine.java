public abstract class Cosine implements Expression {

private double A;

public Cosine() {
A = 0.0;
}

public Cosine(double a) {
A = a;
}

public double getValue(double A) {
return Math.cos(A);
}

}