function madLib(verb,adj,noun) {
  console.log(`We shall ${verb} the ${adj} ${noun}`);
}

madLib('make', 'best', 'guac')


function isSubstring(phrase,sub) {
  return phrase.includes(sub);
}

isSubstring("time to program", "time")

function fizzBuzz (array) {
  const fizzBuzzArr = [];

  array.forEach(el => {
    if ((el % 3 === 0) ^ (el % 5 === 0)) {
      fizzBuzzArr.push(el);
    }
  });

  return fizzBuzzArr;
}

function isPrime (n) {
  if (n < 2) { return false; }

  for (let i = 2; i < n; i++) {
    if (n % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes (n) {
  let sum = 0;
  let numPrimes = 0;
  let i = 2;
  while (numPrimes < n) {
    if (isPrime(i)) {
      sum += i;
      numPrimes++;
    }
    i++;
  }
  return sum;
}
