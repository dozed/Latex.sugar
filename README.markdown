# Latex.sugar

A Sugar for the delicious [Espresso text editor][espresso] to provide syntax highlighting (and, one day, itemizers) for LaTeX documents. Supports the [Espresso Sugar Standard][standard]

  [espresso]: <http://macrabbit.com/espresso/>
    "The Espresso text editor, by MacRabbit"
  [standard]: <http://github.com/elliottcable/espresso-sugar-standard>
    "ellitotcable's Espresso Sugar Standard on Github"

## Using

Clone this project somewhere, with the following:

    git clone git://github.com/doches/latex.sugar.git ./Latex.sugar

And then link it to your syntaxes directory:

    ln -s "$(pwd)/Latex.sugar" "/Users/$(whoami)/Library/Application Support/Espresso/Sugars/"