# Installation
Everything should automatically install by running
```yarn```

### Installation Issues
Some packages may need to be install globally if they're not running correctly:
- Elm: `npm install -g elm`
- Postcss-cli `npm i -g postcss-cli`

# Development
To start the Elm development server (Elm Reactor) and the Postcss-cli run
```yarn start```

Visiting ```http://localhost:3000/``` and navigating to your Elm files utilizes the standard Elm Reactor, which doesn't contain CSS styles.

### IDE Settings
It's recommended to install [Prettier](https://packagecontrol.io/packages/JsPrettier) and [Elm Language Support](https://packagecontrol.io/packages/Elm%20Language%20Support) for your IDE. These tools will auto-format Elm, CSS, and JS code.

# Deploy/Building
To build/update the dist folder (which will update the Github Page repo), run
```yarn build```

*The build process should be run prior to every commit.*

# CSS
CSS is run through [PostCSS](http://postcss.org). Available CSS variables are in `./postcss.config.js`.

When adding a new CSS file, you may need to restart the development server.


# Commits
1. Add the button
1. Change from beginnerProgram to Program
  - html.program, follow compiler
  - model -> init, add subscriptions
  - Model -> (Model, Cmd Msg)
    - Update ( model, Cmd.none )
    - init
1. Get Random Int, print on screen
1. Add Answer List
1. Get Random Int in answer List
1. Small refactor, remove old code
1. Add to list


# Useful Links
- [Elm Guide](https://guide.elm-lang.org)
- [Elm Docs](http://elm-lang.org/docs)
- [Elm Core Package](http://package.elm-lang.org/packages/elm-lang/core/latest/)
- [Elm Html Package](http://package.elm-lang.org/packages/elm-lang/html/latest/)
- [Elm Packages](http://package.elm-lang.org)
- [Hex Colour Tool - Brightens and Darkens Colours](http://www.cssfontstack.com/oldsites/hexcolortool/)
- [Flat UI Colours](http://flatuicolors.com)
