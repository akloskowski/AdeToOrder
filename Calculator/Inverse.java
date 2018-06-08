public class Inverse implements Expression {

Expression A;

Inverse (Expression AA) {
A = AA;
}

public double getValue() {
return A.getValue() * -1;
}

}