package Clock;

public class ClockThread extends Thread {
    public void run() {
        while (true) {
            System.out.println(Thread.currentThread().getName() + " : ");
            System.out.println(java.time.LocalDateTime.now());
        try {
            sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        }
    }
}
