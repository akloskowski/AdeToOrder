public abstract class Multiply implements Expression {

private int A;
private int B;

public Multiply() {
A = 0;
B = 0;
}

public Multiply(int a, int b) {
A = a;
B = b;
}

public int getValue(int A, int B) {
return A * B;
}

}