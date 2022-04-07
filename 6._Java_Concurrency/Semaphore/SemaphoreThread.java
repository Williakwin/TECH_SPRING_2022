package Semaphore;

import java.util.concurrent.Semaphore;

public class SemaphoreThread extends Thread {
    Semaphore semaphore;

    public SemaphoreThread(Semaphore semaphore) {
        this.semaphore = semaphore;
    }

    public void run() {
        try {
            semaphore.acquire();
            for (int i = 0; i <= 100; i++) {
                if (i ==50) {
                    semaphore.release();
                }
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}