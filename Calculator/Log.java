public class Log implements Expression {
  Expression A;
  Log(Expression AA) {
    A = AA;
  }
  public double getValue() {
	  return Math.log10(A.getValue());
  };
}
