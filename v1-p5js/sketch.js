// sketch.js
// p5.js port of PrimeExplore (SwiftUI) PrimeCountView

const animInterval = 0.5; // update interval in seconds

let startNum = 0;
let cellCount = 0;
let primeCount = 0;
let nx = 0;
let ny = 0;
let autoStep = false;
let drawMode = 'palette'; // 'palette' | 'count'
let lastUpdateTime = 0;

function setup() {
  let holder = select('#canvasHolder');
  let cnv = createCanvas(holder.width, holder.height);
  cnv.parent(holder);
  frameRate(30);

  select('#stepMinus').mouseClicked(() => (startNum -= cellCount));
  select('#zero').mouseClicked(() => (startNum = 0));
  select('#stepPlus').mouseClicked(stepAction);

  segmented('#autoOff', '#autoOn', (on) => (autoStep = on));
  segmented('#modeCount', '#modePalette', (palette) => {
    drawMode = palette ? 'palette' : 'count';
  });
}

function segmented(offId, onId, setter) {
  let offBtn = select(offId);
  let onBtn = select(onId);
  offBtn.mouseClicked(() => {
    setter(false);
    offBtn.addClass('selected');
    onBtn.removeClass('selected');
  });
  onBtn.mouseClicked(() => {
    setter(true);
    onBtn.addClass('selected');
    offBtn.removeClass('selected');
  });
}

function draw() {
  background(255);
  let drawFn = drawMode == 'palette' ? drawPalettePrimes : drawCountPrimes;
  let res = drawFn(width, height, startNum);

  let seconds = millis() / 1000 - lastUpdateTime;
  if (seconds > animInterval) {
    lastUpdateTime = millis() / 1000;
    cellCount = res.cellCount;
    primeCount = res.primeCount;
    nx = res.nx;
    ny = res.ny;
    if (autoStep) {
      stepAction();
    }
  }
  updateControlsTop();
}

function stepAction() {
  startNum += cellCount;
}

function updateControlsTop() {
  select('#gridText').html(`grid ${nx}x${ny}=${cellCount}`);
  select('#primeText').html(`n primes:${primeCount}`);
  let densityText = '';
  if (cellCount != 0) {
    densityText = `d: ${(primeCount / cellCount).toFixed(4)}`;
  }
  select('#densityText').html(densityText);
  select('#startText').html(`Start: ${startNum}`);
}

function windowResized() {
  let holder = select('#canvasHolder');
  resizeCanvas(holder.width, holder.height);
}
