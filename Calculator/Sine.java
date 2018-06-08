public class Sine implements Expression {

Expression A;

Sine (Expression AA) {
A = AA;
}

public double getValue() {
return Math.sin(A.getValue());
}

}