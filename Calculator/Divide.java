public abstract class Divide implements Expression {

private int A;
private int B;

public Divide() {
A = 0;
B = 1;
}

public Divide(int a, int b) {
A = a;
B = b;
}

public int getValue(int A, int B) {
return A / B;
}

}