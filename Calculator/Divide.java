public class Divide implements Expression {

Expression A;
Expression B;

Divide (Expression AA, Expression BB) {
A = AA;
B = BB;
}

public double getValue() {
return A.getValue() / B.getValue();
}

}