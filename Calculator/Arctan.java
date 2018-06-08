public class Arctan implements Expression {

Expression A;

Arctan (Expression AA) {
A = AA;
}

public double getValue() {
return Math.atan(A.getValue());
}

}