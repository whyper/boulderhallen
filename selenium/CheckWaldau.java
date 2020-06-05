import java.io.IOException;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.Test;
import org.openqa.selenium.*;

public class CheckWaldau {

        public static void main(String[] args) throws IOException, InterruptedException {
                System.setProperty("webdriver.chrome.driver", "/usr/bin/chromedriver");
                ChromeOptions chromeOptions = new ChromeOptions();
                chromeOptions.addArguments("--headless");
                chromeOptions.addArguments("--no-sandbox");

                WebDriver driver = new ChromeDriver(chromeOptions);
                driver.get("https://www.kletterzentrum-stuttgart.de/index.htm");
                Thread.sleep(1000);

                String max = driver.findElement(By.className("progress")).getCssValue("width");
                String current = driver.findElement(By.className("bar")).getCssValue("width");

                max=max.substring(0, max.length() - 2);
                current=current.substring(0, current.length() - 2);

                double result = Double.parseDouble(current) / Double.parseDouble(max) * 100;
                System.out.println((int)result);

                driver.quit();
        }
}
