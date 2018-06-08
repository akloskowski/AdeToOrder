import java.lang.Math;

public class Xroot implements Expression {
  Expression A;
  Expression B;
  Xroot(Expression AA, Expression BB) {
    A = AA;
    B = BB;
  }
  public double getValue() {
    return java.lang.Math.pow(B.getValue(), 1.0/A.getValue());
  };
}
