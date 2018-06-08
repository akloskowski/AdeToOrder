import java.lang.Math;

public class Sqrt implements Expression {
  Expression A;
  Sqrt(Expression AA) {
    A = AA;
  }
  public double getValue() {
    return java.lang.Math.sqrt(A.getValue());
  };
}
