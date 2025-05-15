const fs = require('fs');

console.log('Início do código');
fs.readFile('semana04/arquivo.txt', 'utf8', (err, data) => {
  if (err) throw err;
  console.log('Conteúdo do arquivo:', data);
});
console.log('Fim do código');
