public class Arccos implements Expression {

Expression A;

Arccos (Expression AA) {
A = AA;
}

public double getValue() {
return Math.acos(A.getValue());
}

}