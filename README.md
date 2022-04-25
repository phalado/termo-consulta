# Termo Solver

This web app is a helper to solve the Brazilian version of [Wordle](wordle): [Termo](termo).
This application currently consists of 5993 words. If you believe any word is missing, please send me a message.

<h1 align="center"><img src="https://raw.githack.com/phalado/termo-consulta/main/public/initial.png"></h1>

## Table of contents

- [Termo Solver](#termo-solver)
  - [Table of contents](#table-of-contents)
  - [About](#about)
  - [The project](#the-project)
    - [How to use it](#how-to-use-it)
    - [Technologies used](#technologies-used)
  - [Contact](#contact)

## About

Link to the live version [here][live-version].

Repository: https://github.com/phalado/termo-consulta

Front-End repository: https://github.com/phalado/termo-consulta-front

Please, star the projects. It makes me happy.

## The project

### How to use it

This application won't solve the puzzle for you. You still have to deduct the next steps. It only shows you the possible words for the answer.

![one_word][one_word]

You have 3 possibilities:

- Fill one of the top squares with a letter

  Do it if you know the correct position of any letter. This will hugely decrease the number of remaining possibilities.

  ![green_letter][green_letter]

  After this, it won't be possible to click on this specific letter, and it will become green on the digital keyboard on the screen.

- Click on one of the letters on the digital keyboard

  Do it if you know that the answer has this letter, but you aren't sure of its position.

  ![yellow_letter][yellow_letter]

  After clicking on it, it will become yellow.

- Double click on one of the letters on the digital keyboard

  Do it if you know that the answer does not have this letter.

  ![red_letter][red_letter]

  After double-clicking on it, it will become red.

### Technologies used

To create this project I used:

- Ruby
- Ruby on Rails
- Searchkick
- Rspec
- Faker
- FactoryBot
- Simplecov
- JavaScript
- A bit of HTML and CSS
- Rubocop
- React
- Redux
- Github
- Netlify for Front-End
- Heroku for Back-End

## Contact

Author: Raphael Cordeiro

Follow me on [Twitter][rapha-twitter], visit my [Github portfolio][rapha-github], my [Linkedin][rapha-linkedin], or my [personal portfolio][rapha-personal].

<!-- Links -->

[wordle]: https://www.nytimes.com/games/wordle/index.html
[termo]: https://term.ooo/
[live-version]: https://termo-solver.netlify.app/
[front-end]: https://github.com/phalado/termo-consulta-front
[rapha-github]: https://github.com/phalado
[rapha-twitter]: https://twitter.com/phalado
[rapha-linkedin]: https://www.linkedin.com/in/raphael-cordeiro/
[rapha-personal]: https://www.phalado.tech/

<!-- Images -->

[one_word]: https://raw.githack.com/phalado/termo-consulta/main/public/one_word.png
[green_letter]: https://raw.githack.com/phalado/termo-consulta/main/public/green_a.png
[yellow_letter]: https://raw.githack.com/phalado/termo-consulta/main/public/yellow_a.png
[red_letter]: https://raw.githack.com/phalado/termo-consulta/main/public/red_a.png
