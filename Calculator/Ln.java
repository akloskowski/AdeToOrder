public class Ln implements Expression {
  Expression A;
  Ln(Expression AA) {
    A = AA;
  }
  public double getValue() {
	  return Math.log(A.getValue());
  };
}
