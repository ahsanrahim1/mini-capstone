/*global axios*/
var gameTemplate = document.querySelector("#gamecard");
var gameContainer = document.querySelector(".row");

axios.get("http://localhost:3000/v2/games").then(function(response) {
  var games = response.data;
  console.log(games);

  games.forEach(function(game) {
    var gameClone = gameTemplate.content.cloneNode(true);
    gameClone.querySelector(".card-title").innerText = game.name;
    gameClone.querySelector(".card-img-top").src = game.image[0].image;
    gameClone.querySelector(".card-text").innerText = game.description;
    gameContainer.appendChild(gameClone);
  });
});
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
