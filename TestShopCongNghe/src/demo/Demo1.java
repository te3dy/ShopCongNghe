package demo;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class Demo1 {
	public static void main(String[] args) {
		WebDriver firtDemo = new ChromeDriver();
		firtDemo.get("https://viblo.asia/p/trai-nghiem-dau-tien-voi-selenium-webdriver-ByEZkWqxZQ0");
	}
}
