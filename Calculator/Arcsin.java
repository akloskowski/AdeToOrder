public class Arcsin implements Expression {

Expression A;

Arcsin (Expression AA) {
A = AA;
}

public double getValue() {
return Math.asin(A.getValue());
}

}