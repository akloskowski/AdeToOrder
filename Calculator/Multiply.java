public class Multiply implements Expression {

Expression A;
Expression B;

Multiply (Expression AA, Expression BB) {
A = AA;
B = BB;
}

public double getValue() {
return A.getValue() * B.getValue();
}

}