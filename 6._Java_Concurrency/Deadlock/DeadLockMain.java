package Deadlock;

public class DeadLockMain {
    public static void main(String[] args) {
        final String lockOne = "I am lock one";
        final String lockTwo = "I am lock two";

        Thread threadTwo = new Thread() {
          public void run() {
              synchronized (lockTwo) {
                  System.out.println("I am thread 2 I got lock 2");

                  synchronized (lockOne) {
                      System.out.println("I am thread 2 I got lock 1");
                  }
              }
          }
        };

        Thread threadOne = new Thread() {
            public void run() {
                synchronized (lockTwo) {
                    System.out.println("I am thread 1 I got lock 1");

                    synchronized (lockOne) {
                        System.out.println("I am thread 1 I got lock 2");
                    }
                }
            }
        };

        threadOne.start();
        threadTwo.start();



    }
}
