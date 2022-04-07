package Implementation;

public class ImplementThread extends Thread{
    public void run() {
        System.out.println("I am a thread extends Thread");
        ImplementThread threadFromThreadOne = new ImplementThread();
        ImplementThread threadFromThreadTwo = new ImplementThread();

        threadFromThreadOne.start();
        threadFromThreadTwo.start();

    }
}
