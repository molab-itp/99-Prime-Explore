// drawPalettePrimes.js
// primes in black, non-primes cycle through colorPalette

// -> { cellCount, primeCount, nx, ny }
function drawPalettePrimes(w, h, startNum) {
  let primeCount = 0;
  let { cellCount, xmargin, ymargin, nx, ny, cellWidth } = drawGrid(w, h);
  let lineWidth = primeDisplay.lineWidth;
  let start = startNum;
  let stop = start + cellCount;
  let colorIndex = 0;
  noStroke();
  for (let num = start; num < stop; num++) {
    let num0 = num - start;
    let x = (num0 % nx) * cellWidth + xmargin;
    let y = Math.floor(num0 / nx) * cellWidth + ymargin;
    if (isPrime(num)) {
      primeCount += 1;
      fill(0);
    } else {
      fill(colorPalette[colorIndex]);
    }
    ellipseMode(CORNER);
    ellipse(x, y - lineWidth / 2, cellWidth, cellWidth);
    colorIndex = (colorIndex + 1) % colorPalette.length;
  }
  return { cellCount, primeCount, nx, ny };
}
