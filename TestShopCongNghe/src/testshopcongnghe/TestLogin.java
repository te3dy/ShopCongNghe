package testshopcongnghe;

import java.sql.Driver;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.By.ByXPath;
import org.openqa.selenium.chrome.ChromeDriver;

public class TestLogin {
	private static WebDriver driver;
	private static WebElement webElement;
	public static void main(String[] args) {
		System.setProperty("webdriver.chrome.driver", "C:\\Users\\Admin\\OneDrive\\Testing\\Tools\\ChromeDriver\\chromedriver.exe");
		driver =  new ChromeDriver();
		driver.get("http://localhost:8080/Shopcongnghe");
		try {
			Thread.sleep(2000);
			webElement = driver.findElement(By.xpath("//*[text()='Đăng nhập']"));
			webElement.click();
			Thread.sleep(1000);
			webElement =  driver.findElement(By.id("Taikhoan"));
			webElement.sendKeys("admin");
			Thread.sleep(1000);
			webElement =  driver.findElement(By.id("Matkhau"));
			webElement.sendKeys("admin");
			Thread.sleep(1000);
			/*webElement =  driver.findElement(By.xpath("//*[text()='Ghi nhớ']"));
			webElement.click();
			Thread.sleep(2000);*/
			webElement = driver.findElement(By.id("login"));
			webElement.click();
			Thread.sleep(1000);
		} catch (Exception e) {
			System.out.println("Lỗi : " + e.getMessage());
		}
				
	}
}
