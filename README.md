# Magic Eight

This project is the work-along code for the [Code & Coffee 2018 Conference](https://www.conf.coffee) in Vancouver. It's a guided introduction to Elm by building a magic-eight ball. You can follow along using [Ellie](https://ellie-app.com/cJThH7q7Ja1/0), and in-browser Elm editor, or you can download this repo and run it locally.

# Lesson

The lesson is broken into several smaller chapters. Each chapter starts with the answer to the previous chapter so you can compare or pick up if you get stuck. Each chapter is complete once you've checked the steps and your program compiles.

## Walk-through the Elm Architecture and Syntax [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/0){:target="\_blank"}

* [ ] Walk-through Ellie, Compiling, and Formatting.
* [ ] Walk-through the [Elm Architecture](https://guide.elm-lang.org/architecture/).
* [ ] Change the view from a `div` containing a text node to a `div` containing a `button` with the phrase "Ask the Magic Eight".

## Change from `beginnerProgram` to `Program` [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/1){:target="\_blank"}

Elm's [`beginnerProgram`](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#beginnerProgram) is a great way to learn the Elm Architecture because of its stripped-down features, but it can't handle side-effects or interact with the outside world. When we need to do more we use [`program`](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html#program). Since generating random numbers is considered a side-effect in functional programming we need to use program. We'll rely on the Elm compiler to guide us through refactoring our code.

* [ ] Change `Html.beginnerProgram` to `Html.program` and fix the compiler errors.
* [ ] Update the `Main` type annotation and ensure the arguments match. _Hint:_ we'll ignore all [subscriptions](https://www.elm-tutorial.org/en/03-subs-cmds/01-subs.html) in this project by passing in `always Sub.none` which means _subscriptions will always be nothing_.
* [ ] Update the `init` type annotation to a [Tuple](http://package.elm-lang.org/packages/elm-lang/core/latest/Tuple) returning the init _model_ and the init [command](https://www.elm-tutorial.org/en/03-subs-cmds/02-commands.html). _Hint:_ we don't want to pass any commands on project initialization so we can ignore it with `Cmd.none`.
* [ ] Update the `update` return value to match the `init` return value.

## Get a Random Int and Render it [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/2){:target="\_blank"}

Our first look into the Elm Architecture process. We're going to update a value on our model when a button is clicked. In addition, we're going to issue a command to update the model with a random number after it's been generated.

* [ ] Add `randNum : Int` to the model and render it in the view function. _Hint:_ in Elm we must explicitly convert types when we need them to be something else. `text` nodes only accept strings so we use `toString`.
* [ ] Add an `onClick` event to the button, passing it a _new_ message named `GetNumber`.
* [ ] Use the [Random](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Random#generate) library to generate a random number as a command in the `GetNumber` branch. _Hint:_ `Random.generate` takes a `Generator` value and returns a `Msg`. Random values are considered side-effects because they are changing the program in an _unpredictable_ way.
* [ ] Create another message type to receive the result of the randomly generated number as an argument, and update `randNum` in the update branch. _Hint:_ Elm is immutable so [_updating_ records](http://elm-lang.org/docs/records#updating-records) isn't possible. Instead we create a new record with a new value on the field like `{ record | field = newValue }`.

## Create an Array of Responses [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/3){:target="\_blank"}

It's time to prepare some responses for our magic eight ball. We'll create a _list_ of responses in an _array_ so that we have an automatic index. We'll also create some [type aliases](https://guide.elm-lang.org/types/type_aliases.html) so our code is easier to understand.

* [ ] Import `Array` into the project.
* [ ] Create two new fields, `currentResponse` and `allResponses`, on the `Model`. `currentResponse` will hold the string value of the magic eight ball's current response, which it will have plucked from the array of `allResponses`.
* [ ] Add type aliases for `currentResponse` and `allResponses` so we can make better type annotations.
* [ ] Create the initial values of all our responses. _Hint:_ To get indexes on our _List_ of responses we need to convert it to an array with `Array.fromList`.

## Add the Magic Eight Ball Markup [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/4){:target="\_blank"}

* [ ] So far we only have a button with no way to display responses. Convert the following HTML markup into Elm so we can see the current response.

```
<div class="eight-ball">
  <div class="window">
    <div class="triangle">
      <div class="triangle__message">{{ show the current response from the model }}</div>
    </div>
  </div>
</div>
```

## Get Random Int in answer List [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/5){:target="\_blank"}

Using what we've learned, we're going to request a response when we click the button, which will generate a random number that we'll use to pluck a response from the array, and return it to the model. This chapter puts it all together!

* [ ] Using `GetNumber` as an example, create a message that requests a response.
* [ ] `RequestResponse` should issue a command to generate a random number that returns the response as a side-effect.
* [ ] `ReturnResponse` should [get](http://package.elm-lang.org/packages/elm-lang/core/latest/Array#get) a response from all the responses then update `currentResponse` with the new response. _Hint:_ It's possible to get an index that's not available. In Elm we need to cover all cases so `Array.get` returns a [maybe](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Maybe). We can use [Maybe.withDefault](http://package.elm-lang.org/packages/elm-lang/core/5.1.1/Maybe#withDefault) to provide a default value if an index can't be found like `Maybe.withDefault ""`.
* [ ] Since we're generating random integers but using them in array indexes, we should create a type alias for `ResponseIndex`.

## Remove Dead Code with the Compiler [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/6){:target="\_blank"}

At this point our application works! There's a bit of cleanup remaining and we can improve the UX a touch. Let's lean on the compiler to clean up our code.

* [ ] Delete `RandNum` from the model and follow the compiler errors.
* [ ] Delete `text` from the model and follow the compiler errors.
* [ ] Delete `BasicUpdate` from the messages and follow the compiler errors.
* [ ] Delete `GetNumber` from the messages and follow the compiler errors.
* [ ] Delete `NewNumber` from the messages and follow the compiler errors.
* [ ] Add additional responses so the magic-eight has more to choose from.

## Render New Responses with Better Animation [Ellie Link](https://ellie-app.com/cJThH7q7Ja1/9){:target="\_blank"}

Our magic-eight ball _always_ shows the triangle, but real magic-eight balls refresh their view. Elm's virtual-DOM diffing automatically optimizes rendering which means _only our text changes_ when we update the response. Ideally, we'd like to force the triangle to fade-in on every response. We can do that by using [Keyed Nodes](http://package.elm-lang.org/packages/elm-lang/html/2.0.0/Html-Keyed).

* [ ] We need to keep track of an ID when using keyed, so add a `responseIndex` to the model.
* [ ] Create a function to return the triangle HTML when there is a response and nothing when there is no response. _Hint:_ All return types must be the same so in order to return _nothing_ in HTML we can use `text ""` for an empty text node.
* [ ] Import `Keyed` for use in the view and convert the `div` with the `window` class into a keyed node. _Hint:_ A keyed node takes a tuple, a string identifier and a regular HTML list. We want to use the `responseIndex` as the identifier.
* [ ] Assign the `responseIndex` to the random integer returned in the `ReturnResponse` update branch.

## Leave Your Fate to the Magic-Eight Ball [Completed Ellie Link](https://ellie-app.com/cJThH7q7Ja1/8){:target="\_blank"}

You've completed the lesson!

# Local Installation

This project uses a [Node](https://nodejs.org/en/) environment using [Yarn](https://yarnpkg.com/en/). The Elm installation itself can be found on the [Elm installation page](https://guide.elm-lang.org/install.html). Once the dependencies are installed, navigate to the project repo and run

```
yarn
```

### Installation Issues

Some packages may need to be install globally if they're not running correctly:

* Elm: `npm install -g elm`
* Postcss-cli `npm i -g postcss-cli`

# Development

To start the Elm development server (Elm Reactor) and the Postcss-cli run
`yarn start`

Visiting `http://localhost:3000/` and navigating to your Elm files utilizes the standard Elm Reactor, which doesn't contain CSS styles.

### IDE Settings

It's recommended to install [Prettier](https://packagecontrol.io/packages/JsPrettier) and [Elm Language Support](https://packagecontrol.io/packages/Elm%20Language%20Support) for your IDE. These tools will auto-format Elm, CSS, and JS code.

# Deploy/Building

To build/update the dist folder (which will update the Github Page repo), run
`yarn build`

_The build process should be run prior to every commit._

# CSS

CSS is run through [PostCSS](http://postcss.org). Available CSS variables are in `./postcss.config.js`.

When adding a new CSS file, you may need to restart the development server.

# Useful Links

* [Elm Guide](https://guide.elm-lang.org)
* [Elm Docs](http://elm-lang.org/docs)
* [Elm Core Package](http://package.elm-lang.org/packages/elm-lang/core/latest/)
* [Elm Html Package](http://package.elm-lang.org/packages/elm-lang/html/latest/)
* [Elm Packages](http://package.elm-lang.org)
* [Elm Random Tutorial](https://guide.elm-lang.org/architecture/effects/random.html)
* [Hex Colour Tool - Brightens and Darkens Colours](http://www.cssfontstack.com/oldsites/hexcolortool/)
* [Flat UI Colours](https://flatuicolors.com/palette/ru)
