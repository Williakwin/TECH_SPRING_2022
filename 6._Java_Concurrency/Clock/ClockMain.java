package Clock;

import java.time.Clock;

public class ClockMain {
    public static void main(String[] args) {
        ClockThread clockThreadOne = new ClockThread();
        clockThreadOne.setName("Clock 1");
        ClockThread clockThreadTwo = new ClockThread();
        clockThreadTwo.setName("Clock 2");

        clockThreadOne.start();
        clockThreadTwo.start();

    }
}

