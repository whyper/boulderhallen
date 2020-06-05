import java.io.IOException;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;
import org.openqa.selenium.*;

public class CheckRockerei {

        public static void main(String[] args) throws IOException, InterruptedException {
                System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");
                ChromeOptions chromeOptions = new ChromeOptions();
                chromeOptions.addArguments("--headless");
                chromeOptions.addArguments("--no-sandbox");

                WebDriver driver = new ChromeDriver(chromeOptions);
                driver.get("https://rockerei-stuttgart.de/");
                Thread.sleep(1000);

                String users = driver.findElement(By.cssSelector(".stat")).getAttribute("data-count");
		double count = (70 - Double.parseDouble(users)) / 70 * 100;
                System.out.println((int)count);

                driver.quit();
        }
}
