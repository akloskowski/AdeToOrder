public class Cosine implements Expression {

Expression A;

Cosine (Expression AA) {
A = AA;
}

public double getValue() {
return Math.cos(A.getValue());
}

}