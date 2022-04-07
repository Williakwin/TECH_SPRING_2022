package Counters;

public class SynchronizedCounter {
    private volatile int counter = 0;

    public int getCounter() {
        return counter;
    }
}
