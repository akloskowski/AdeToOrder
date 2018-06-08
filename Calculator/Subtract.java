public abstract class Subtract implements Expression {

private int A;
private int B;

public Subtract() {
A = 0;
B = 0;
}

public Subtract(int a, int b) {
A = a;
B = b;
}

public int getValue(int A, int B) {
return A - B;
}

}