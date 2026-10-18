// isPrime.js

function isPrime(num) {
  if (num < 2) {
    return false;
  }
  // Don't need to check all numbers
  let numStop = Math.floor(Math.sqrt(num)) + 1;
  for (let i = 2; i < numStop; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}
