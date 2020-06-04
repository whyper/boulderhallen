const puppeteer = require("puppeteer");
const fs = require("fs");

async function run(url) {
  const browser = await puppeteer.launch({
     headless: true,
     args: ['--no-sandbox', '--disable-setuid-sandbox']
  })
  const page = await browser.newPage();
        await page.goto(url, { waitUntil: "networkidle2" });
        await page.waitFor(1 * 1000);
        const html = await page.content();
        fs.writeFileSync("index.html", html);
        const text = await page.evaluate(() => document.querySelector('.status_text').textContent);
        console.log(text);
        await browser.close();
}

run('http://b12-tuebingen.de/');
