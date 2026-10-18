// drawCountPrimes.js
// primes only: black, or red when num-2 is also prime (twin primes)

// -> { cellCount, primeCount, nx, ny }
function drawCountPrimes(w, h, startNum) {
  let primeCount = 0;
  let { cellCount, xmargin, ymargin, nx, ny, cellWidth } = drawGrid(w, h);
  let lineWidth = primeDisplay.lineWidth;
  let primeSet = new Set();
  let start = startNum;
  let stop = start + cellCount;
  noStroke();
  for (let num = start; num < stop; num++) {
    if (isPrime(num)) {
      primeSet.add(num);
      primeCount += 1;
      let num0 = num - start;
      let x = (num0 % nx) * cellWidth + xmargin;
      let y = Math.floor(num0 / nx) * cellWidth + ymargin;
      fill(primeSet.has(num - 2) ? colorPalette[0] : 0);
      ellipseMode(CORNER);
      ellipse(x, y - lineWidth / 2, cellWidth, cellWidth);
    }
  }
  return { cellCount, primeCount, nx, ny };
}
