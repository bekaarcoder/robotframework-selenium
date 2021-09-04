from selenium import webdriver
from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager


def get_chromedriver_path():
    driver_path = ChromeDriverManager().install()
    return driver_path


def get_geckdodriver_path():
    driver_path = GeckoDriverManager().install()
    return driver_path
