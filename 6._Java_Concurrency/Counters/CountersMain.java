package Counters;

import static java.lang.Thread.sleep;

public class CountersMain {
    public static void main(String[] args) throws InterruptedException {
        ClassicalCounter counter = new ClassicalCounter();

        Thread threadOne = new Thread() {
            public void run() {
                for (int i = 0; i < 1000; i++) {
                    counter.increment();
                }
            }
        };

        Thread threadTwo = new Thread() {
            public void run() {
                for (int i = 0; i < 1000; i++) {
                    counter.increment();
                }
            }
        };
        Thread threadThree = new Thread() {
            public void run() {
                for (int i = 0; i < 1000; i++) {
                    counter.increment();
                }
            }
        };

        threadOne.start();
        threadTwo.start();
        threadThree.start();

        sleep(1000);
        System.out.println(counter.getCounter());
    }
}
