public abstract class Add implements Expression {

private int A;
private int B;

public Add() {
A = 0;
B = 0;
}

public Add(int a, int b) {
A = a;
B = b;
}

public int getValue(int A, int B) {
return A + B;
} 

}