/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      games: [],
      currentGame: {
        name: "name goes here",
        description: "description goes here"
      }
    };
  },
  created: function() {
    axios.get("/v2/games").then(
      function(response) {
        this.games = response.data;
      }.bind(this)
    );
  },
  methods: {
    setCurrentGame(game) {
      this.currentGame = game;
      console.log(this.currentGame);
    }
  },
  computed: {}
};

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/v2/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        auth: { email: this.email, password: this.password }
      };
      axios
        .post("/user_token", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var NewGamesPage = {
  template: "#games-new-page",
  data: function() {
    return {
      input_name: "",
      input_price: "",
      input_description: "",
      supplier_id: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.input_name,
        input_price: this.input_price,
        input_description: this.input_description,
        supplier_id: this.supplier_id
      };
      axios
        .post("/v2/games", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data;
          }.bind(this)
        );
    }
  }
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/games/new", component: NewGamesPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});

// /*global axios*/
// var gameTemplate = document.querySelector("#gamecard");
// var gameContainer = document.querySelector(".row");

// axios.get("http://localhost:3000/v2/games").then(function(response) {
//   var games = response.data;
//   console.log(games);

//   games.forEach(function(game) {
//     var gameClone = gameTemplate.content.cloneNode(true);
//     gameClone.querySelector(".card-title").innerText = game.name;
//     gameClone.querySelector(".card-img-top").src = game.image[0].image;
//     gameClone.querySelector(".card-text").innerText = game.description;
//     gameContainer.appendChild(gameClone);
//   });
// });
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
// gameContainer.appendChild(gameTemplate.content.cloneNode(true));
