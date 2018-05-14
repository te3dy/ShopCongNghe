package testshopcongnghe;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class TestSeach {
	private static WebDriver driver;
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\Admin\\OneDrive\\Testing\\Tools\\ChromeDriver\\chromedriver.exe");
		driver =  new ChromeDriver();
		driver.get("http://localhost:8080/Shopcongnghe/");
}
}
