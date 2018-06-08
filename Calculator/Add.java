public class Subtract implements Expression {

Expression A;
Expression B;

Subtract (Expression AA, Expression BB) {
A = AA;
B = BB;
}

public double getValue() {
return A.getValue() - B.getValue();
}

}
