public class Float implements Expression {
  double val;
  Float(double v) {
    val = v;
  }
  public double getValue() {
    return val;
  };
}
