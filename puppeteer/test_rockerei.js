const puppeteer = require("puppeteer");
const fs = require("fs");

async function run(url) {
  const browser = await puppeteer.launch({
     headless: true,
     args: ['--no-sandbox', '--disable-setuid-sandbox']
  })
  try {
    const page = await browser.newPage();
    await page.goto(url, { waitUntil: "networkidle2" });
    await page.waitFor(1 * 1000);
    const html = await page.content();
    fs.writeFileSync("index.html", html);
    const text = await page.evaluate('document.querySelector(".stat").getAttribute("data-count")')
    console.log(Math.round((70 - text) / 70 * 100));
  } catch(e) {
    console.log(e);
  } finally {
    await browser.close();
  }
}

run('https://rockerei-stuttgart.de/');
