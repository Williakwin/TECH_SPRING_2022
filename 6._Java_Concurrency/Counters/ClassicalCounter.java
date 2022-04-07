package Counters;

public class ClassicalCounter extends Thread{
    private int counter = 0;

    public int getCounter() {
        return counter;
    }

    //1. Read counter
    //2. Add one to the value
    //3. Save the value in counter variable
    public void increment() {
        counter += 1;
    }

    public void decrement() {
        counter -= 1;
    }
}
