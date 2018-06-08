public class Tangent implements Expression {

Expression A;

Tangent (Expression AA) {
A = AA;
}

public double getValue() {
return Math.tan(A.getValue());
}

}