package CountingThreads;

public class CountingThread extends CountingThreadsMain{
    public void run() {
        for (int i=0; i <= 100; i++) {
            System.out.println(i);
        }
    }
}
