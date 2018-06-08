public class Factorial implements Expression {
  Expression A;
  Factorial(Expression AA) {
    A = AA;
  }
  public double getValue() {
	  int num = (int) A.getValue();
	  int val = 1;
	  for (int i = 2; i <= num; i++) {
		  val *= i;
	  }
	  return (double) val;
  };
}
