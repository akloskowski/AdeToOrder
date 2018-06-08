public class Add implements Expression {

Expression A;
Expression B;

Add (Expression AA, Expression BB) {
A = AA;
B = BB;
}

public double getValue() {
return A.getValue() + B.getValue();
}

}