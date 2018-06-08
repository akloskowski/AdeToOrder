public abstract class Inverse implements Expression {

private int A;

public Inverse() {
A = 0;
}

public Inverse(int a) {
A = a;
}

public int getValue(int A) {
return A * -1;
}

}