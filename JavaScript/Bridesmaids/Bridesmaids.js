//sayHello function - checking if the user are a bridesmaid or not, using boolean and if/if else/else
function sayHello() {
  const name = prompt("What is your name?");
  const lowercaseName = name.toLowerCase(); // this changes user input to lowercase to reduce the number of conditions.
  if (
    lowercaseName === "amy" ||
    lowercaseName === "clara" ||
    lowercaseName === "rose"
  ) {
    //checking agianst the names of the 3 bridesmaids
    alert("Hello, " + name + "! You are one of my bridesmaids");
  } else if (lowercaseName === "david") {
    //a joke check for the groom
    alert("Hello - you're the groom, you shouldn't need this page.");
  } else {
    alert(
      "Hello, " +
        name +
        " You are not one of my bridesmaids, feel free to continue if you'd like though" // a catch all 'else' for any other possible user entries
    );
  }
}

//colourQuestion function asking if the bridesmaid/user know which colour they'd like to wear
function colourQuestion() {
  const weddingColours = ["pink", "blue", "green", "Pink", "Blue", "Green"]; //an array of the wedding colours
  const choice = prompt("pink or blue or green?");
  if (weddingColours.includes(choice)) {
    alert("Fabulous, your colour of choice is; " + choice);
  } else {
    alert(
      "Nope " + choice + " is not on the list, there are 3 choices pick one." //reminding the user/bridesmaid there is only the above choices
    );
  }
}

//clothes function to check if the user/bridesmaid knows what they want to wear
function clothes() {
  const choice = prompt("Do you know what you want to wear?", "Yes/No");
  if (choice === "No" || choice === "no") {
    alert(
      "Ok -the computer gods will pick for you : " + getComputerChoiceClothes()
    );
    function getComputerChoiceClothes() {
      //to get 'computer' choice of outfit
      const randomNumber = Math.floor(Math.random() * 3); //to get a random whole number betwween 1 - 3 that will decide which option the bridesmaid gets
      // Test for randomNumber; console.log(randomNumber)
      switch (randomNumber) {
        case 0:
          return "A Dress";
          break;
        case 1:
          return "A Suit";
          break;
        case 2:
          return "A Chicken Costume 🐤";
          break;
      }
    }
  } else {
    alert("Good for you!");
  }
}
//checking user/bridesmaid knows their shoe choice
function shoes() {
  const choice = prompt("Do you know what shoes you want to wear?", "Yes/No");
  if (choice === "No" || choice === "no") {
    alert(
      "Ok -the hands of faith have picked for you : " + getComputerChoiceShoes()
    );
    function getComputerChoiceShoes() {
      //to get 'computer' shoe choice
      const randomNumber = Math.floor(Math.random() * 3); //to get a random whole number betwween 1 - 3 that will generate which option the bridesmaid/user is giving
      // As above, test for randomNumber; console.log(randomNumber)
      switch (randomNumber) {
        case 0:
          return "High Heels";
          break;
        case 1:
          return "Flat Shoes";
          break;
        case 2:
          return "Flippers 🤿";
          break;
      }
    }
  } else {
    alert("Fabulous!");
  }
}

//loop to change all <h2>s font style CSS with JS
let miniHeading = document.getElementsByTagName("h2");
for (let i = 0; i < miniHeading.length; i++) {
  miniHeading[i].style.fontStyle = "italic";
}

//changing CSS button colours with JS & onclick
function changeToPink() {
  document.getElementById("hello-button").style.color = "#dfaea9";
}
function changeToGreen() {
  document.getElementById("colour-question").style.color = "#5d6a5e";
}
function changeToBlue() {
  document.getElementById("clothes-button").style.color = "#92b7c8";
}
function changeToGrey() {
  document.getElementById("shoes-button").style.color = "grey";
}

//event listener for sayHello button
let helloButton = document.getElementById("hello-button");
helloButton.addEventListener("click", sayHello);

//event listener for colour question button
let colourButton = document.getElementById("colour-question");
colourButton.addEventListener("click", colourQuestion);

//event listener for clothes button
let clothesButton = document.getElementById("clothes-button");
clothesButton.addEventListener("click", clothes);

//event listener for shoes button
let shoesButton = document.getElementById("shoes-button");
shoesButton.addEventListener("click", shoes);
