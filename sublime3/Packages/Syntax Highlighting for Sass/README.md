# Syntax Highlighting for Sass

Syntax highlighting package for both SCSS and Sass on Sublime Text. Also available for [TextMate](https://github.com/P233/Syntax-highlighting-for-Sass/tree/textmate) and [Atom](https://github.com/P233/Atom-Syntax-highlighting-for-Sass).

Install via [Package Control](https://sublime.wbond.net/packages/Syntax%20Highlighting%20for%20Sass).


## Features:

* Fully support Sass 3.3 syntax
* Match syntax structure instead of keywords, that means support CSS properties which even haven't been published
* Highlight reserved words `and, false, from, in, not, null, or, through, to, true`
* Better support for media queries
* Better support for interpolations
* Eight built-in completion packages
* Smart completion rule
* Support Goto Symbol and Goto Definition
* Comment Tag
* Support old indented Sass syntax `:property-name property-value`
* Can be used for CSS syntax highlighting

### Built-in Completion Packages

Pick up the package name which you are not intend to use, then add it/them into the `ignored_packages` list of your settings file. (If you know a better way to do this please please let me know.)

* SHS-At-Rule
* SHS-Bourbon
* SHS-Bourbon-Neat
* SHS-Compass-Mixins
* SHS-Compass-Variables
* SHS-CSS-Properties
* SHS-CSS-Property-Values
* SHS-Sass-Functions

### Smart Completion Rule

#### Cancel Completion

Typing @-rule, ID, class, placeholder-selector, mixin name, function name, comment, and quoted content will never popup any completions.

![](https://p233.github.com/Syntax-highlighting-for-Sass/01.gif)

#### Property-value Completion

When typing property values, property name and other completions will no longer popup.

![](https://p233.github.com/Syntax-highlighting-for-Sass/02.gif)

**Sass Scope**

```
source.sass meta.property-list.css.sass - variable.other.value
```

**SCSS Scope**

```
source.scss meta.property-list.css.sass - variable.other.value
```

#### Mixin Completion

Built-in mixin name completions will only popup directly behind `@include` or `+`

![](https://p233.github.com/Syntax-highlighting-for-Sass/03.gif)

**Sass Scope**

```
source.sass support.function.name.sass.library
```

**SCSS Scope**

```
source.scss support.function.name.sass.library
```

#### Variable Completion

There are three types of variable compltions: Root-variable, Value-variable, and Variable (contains the previous two).

##### Root-variable

![](https://p233.github.com/Syntax-highlighting-for-Sass/04.gif)

**Sass Scope**

```
source.sass variable.other.root
```

**SCSS Scope**

```
source.scss variable.other.root
```

##### Value-variable

![](https://p233.github.com/Syntax-highlighting-for-Sass/05.gif)

**Sass Scope**

```
source.sass variable.other.value
```

**SCSS Scope**

```
source.scss variable.other.value
```

##### Variable

**Sass Scope**

```
source.sass variable.other
```

**SCSS Scope**

```
source.scss variable.other
```

#### Function Completion

**Sass Scope**

```
source.sass - variable.other - support.function.name.sass.library
```

**SCSS Scope**

```
source.scss - variable.other - support.function.name.sass.library
```

#### Property-name Completion

The latest version of [Emmet CSS Snippets](https://sublime.wbond.net/packages/Emmet%20Css%20Snippets) now fully supports this feature. I recommend to use it instead of the built-in properties completion package.

**Sass Scope**

```
source.sass - meta.property-list - support.function.name.sass.library - variable.other.root
```

**SCSS Scope**

```
source.scss - meta.property-list - support.function.name.sass.library - variable.other.root
```

### Goto Symbol and Goto Definition

#### Goto Symbol or Goto Symbol in Project

![](https://p233.github.com/Syntax-highlighting-for-Sass/06.gif)

#### Goto Definition

![](https://p233.github.com/Syntax-highlighting-for-Sass/07.gif)

### Comment Tag

Use `{{` and `}}` to wrap a keyword inside comment, then this keyword (comment tag) will be indexed by the Goto Symbol and Goto Definition features.

![](https://p233.github.com/Syntax-highlighting-for-Sass/08.gif)

## Color Scheme

### Recommended Color Schemes

* [Neon Color Scheme](https://sublime.wbond.net/packages/Neon%20Color%20Scheme) Thanks [Matt](https://github.com/MattDMo) for adding support for this package
* [Perv Color Schemes](https://github.com/FlavourSys/Perv-ColorScheme) Thanks [Mick](https://github.com/micck) for adding support for this package
* [Birds of Paradise](http://joebergantine.com/projects/color-schemes/birds-of-paradise/)
* [Tomorrow Theme](https://github.com/chriskempson/tomorrow-theme)

[Add new one?](https://github.com/P233/Syntax-highlighting-for-Sass/issues/new)

### Scopes List

Element      | Scope Selector
:----------- | :--------------
Block Comment | comment.block.sass
Inline Comment | comment.line.sass
Comment Tag | comment.tag.sass
At-rule | keyword.control.at-rule.css.sass
Type Selector, Ampersand | entity.name.tag.css.sass
Id Selector | entity.other.attribute-name.id.css.sass
Class Selector | entity.other.attribute-name.class.css.sass
Placeholder Selector | entity.other.attribute-name.placeholder-selector.sass
Attribute Selector | entity.other.attribute-selector.sass
Regex | keyword.other.regex.sass
Pseudo Class, Pseudo Element | entity.other.attribute-name.pseudo-class.css.sass
Property Name | support.type.property-name.css.sass
Property Value | meta.property-value.css.sass, support.constant.property-value.css.sass
Double Quoted | string.quoted.double.css.sass
Comma | comment.punctuation.comma.sass
Numeric | constant.numeric.css.sass
Unit | keyword.other.unit.css.sass
Rgb Color | constant.other.color.rgb-value.css.sass
Function Name | support.function.name.sass
Sass Variable | variable
Sass Directive, Directive Shorthand | keyword.control.at-rule.css.sass
Sass Interpolation | support.function.interpolation.sass
Sass Flag | keyword.other.important.css.sass
Sass Operator | keyword.operator.sass
SCSS Semicolon | comment.punctuation.semicolon.sass
Sass Semicolon | invalid
Sass Curly Brackets | invalid

### Customise Color Scheme

More information about Scope Selectors and Color Scheme, see [Textmate Scope Selectors](http://manual.macromates.com/en/scope_selectors) and [Textmate Themes](http://manual.macromates.com/en/themes.html).


## Contributors

[mannieschumpert](https://github.com/mannieschumpert), [pepelsbey](https://github.com/pepelsbey)


## Credits

[nathos's sass-textmate-bundle](https://github.com/nathos/sass-textmate-bundle/tree/sublime)

[Textmate Language Grammars](http://manual.macromates.com/en/language_grammars.html)
