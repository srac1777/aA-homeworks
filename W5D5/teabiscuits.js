const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});
//
// reader.question('Would you like some tea?', (res) => {
//   console.log(`You replied ${res}`);
// });

function teaAndBiscuits () {
  let first, second;

  reader.question('Would you like some tea?', function (res) {
    console.log(`You replied ${res}.`);
  reader.question('Would you like some biscuits?', function (res) {
    console.log(`You replied ${res}.`);
    first = res;
    second = res;
    const firstRes = (first === 'yes') ? 'do' : 'don\'t';
    const secondRes = (second === 'yes') ? 'do' : 'don\'t';
    console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
    reader.close();
  });
});

}
