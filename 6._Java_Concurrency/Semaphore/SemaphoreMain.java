package Semaphore;

import java.util.concurrent.Semaphore;

public class SemaphoreMain {
    public static void main(String[] args) {
        Semaphore semaphore = new Semaphore(1);

        SemaphoreThread semaphoreThreadOne = new SemaphoreThread(semaphore);
        SemaphoreThread semaphoreThreadTwo = new SemaphoreThread(semaphore);
        SemaphoreThread semaphoreThreadThree = new SemaphoreThread(semaphore);

        semaphoreThreadOne.start();
        semaphoreThreadTwo.start();
        semaphoreThreadThree.start();
    }
}
