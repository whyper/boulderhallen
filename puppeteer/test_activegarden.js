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
        //const text = await page.evaluate( () => document.querySelector('.progress .bar').getProperty('width' ));
        const element1 = await page.$('.barometer .progress');
        const text1 = await element1.boundingBox();
        const element2 = await page.$('.barometer .progress .bar');
        const text2 = await element2.boundingBox();
        const used = (text2.width / text1.width) * 100;
        //console.log(text1.width);
        //console.log(text2);
        console.log(Math.round(used));
        await browser.close();
}

run('https://active-garden.de/');
