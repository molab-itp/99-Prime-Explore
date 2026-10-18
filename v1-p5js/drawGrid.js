// drawGrid.js

const primeDisplay = {
  numInterval: 1000,
  lineWidth: 1,
  ncell: 20,
  cellWidth: 40,
  margin: 0, // Keep at zero
};

// SwiftUI system colors (light mode)
const colorPalette = [
  [255, 59, 48], // red
  [52, 199, 89], // green
  [255, 215, 0], // gold
];

// cellCount depends on size
// -> { cellCount, xmargin, ymargin, nx, ny, cellWidth }
function drawGrid(w, h) {
  let lineWidth = primeDisplay.lineWidth;
  let cellWidth = primeDisplay.cellWidth;
  let margin = primeDisplay.margin;
  let ncell = primeDisplay.ncell;
  if (ncell != 0) {
    cellWidth = Math.floor((w - margin * 2) / ncell);
  }
  let height = Math.floor(h / cellWidth) * cellWidth;
  let width = Math.floor(w / cellWidth) * cellWidth;
  let xmargin = (w - width) / 2;
  let ymargin = (h - height) / 2;
  stroke(0);
  strokeWeight(lineWidth);
  // grid columns
  let x = 0;
  let nx = 0;
  while (x <= width) {
    line(x + xmargin, ymargin, x + xmargin, height + ymargin);
    x += cellWidth;
    nx += 1;
  }
  // grid rows
  let y = 0;
  let ny = 0;
  while (y <= height) {
    line(xmargin, y + ymargin, width + xmargin, y + ymargin);
    y += cellWidth;
    ny += 1;
  }
  nx -= 1;
  ny -= 1;
  let cellCount = nx * ny;
  return { cellCount, xmargin, ymargin, nx, ny, cellWidth };
}
