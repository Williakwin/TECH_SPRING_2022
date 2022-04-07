package PrintingThreads;

import java.util.concurrent.locks.Lock;

public class PrintingThread extends Thread{
    String lock = "I am lock";
    String message;

    public PrintingThread(String message) {
        this.message = message;
    }

    public void run() {
        System.out.println(Thread.currentThread().getName() + " is running");

        synchronized (lock) {
            for (int i = 0; i < message.length(); i++) {
                System.out.println(message.charAt(i));
            }
            System.out.println();
        }
    }
}
