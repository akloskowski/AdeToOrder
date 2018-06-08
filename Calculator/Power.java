import java.lang.Math;

public class Power implements Expression {
  Expression A;
  Expression B;
  Power(Expression AA, Expression BB) {
    A = AA;
    B = BB;
  }
  public double getValue() {
    return java.lang.Math.pow(A.getValue(), B.getValue());
  };
}
