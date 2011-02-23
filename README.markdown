# Latex.sugar

A Sugar for the delicious [Espresso text editor][espresso] to provide syntax highlighting and basic itemizers for LaTeX documents. Supports the [Espresso Sugar Standard][standard]

  [espresso]: <http://macrabbit.com/espresso/>
    "The Espresso text editor, by MacRabbit"
  [standard]: <http://github.com/elliottcable/espresso-sugar-standard>
    "ellitotcable's Espresso Sugar Standard on Github"

## Use

Once installed Espresso should automatically recognize your LaTeX files, provided they end in `.tex`. In addition to syntax highlighting for some common LaTeX features (functions & arguments, comments, (sub)sections, and text formatting, among others!) this Sugar provides itemizers (things that show up in the Navigator pane), simple code completion (for oft-used functions like `\cite` and `\begin{}`), and a few useful snippets. 

There are textual shortcuts for several of the snippets:

+  **Tables** Type `table[TAB]` to open up a basic table environment; you can then type your caption, press tab, and type the reference label immediately. Woohoo!
+  **Figures** Type `figure[TAB]` to open up a basic figure environment; you can type the caption, press tab, type the reference label, press tab, and finally type the path to the figure. Woohoo, again!
+  **Packages** Type `use[TAB]` followed by the name of a package to insert a `\usepackage{foo}` line at the cursor.
+  **Bibliography** Type `bib[TAB]` followed by the filename of your `.bib` file to insert a bibliography.
+  **Enumeration** Type `enum[TAB]` to create an enumeration with one item.
+  **Item List** Type `item[TAB]` to create an item list with one item.

## Installation

Clone this project somewhere, with the following:

    git clone git://github.com/doches/Latex.sugar.git ./Latex.sugar

And then link it to your syntaxes directory:

    ln -s "$(pwd)/Latex.sugar" "/Users/$(whoami)/Library/Application Support/Espresso/Sugars/"

## Bugs

+ So far all known bugs have been fixed, if you find one, let me know.
