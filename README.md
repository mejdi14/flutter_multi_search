<h1 align="center">Welcome to flutter mutli search 👋</h1>
<p align="center">
 <a href="https://github.com/kefranabg/readme-md-generator/blob/master/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/license-MIT-yellow.svg" target="_blank" />
  </a>
  <a href="https://codecov.io/gh/kefranabg/readme-md-generator">
    <img src="https://codecov.io/gh/kefranabg/readme-md-generator/branch/master/graph/badge.svg" />
  </a>
  <a href="https://github.com/frinyvonnick/gitmoji-changelog">
    <img src="https://img.shields.io/badge/changelog-gitmoji-brightgreen.svg" alt="gitmoji-changelog">
  </a>
</p>

	
## :art:Credits
- Many thanks to : [@Cuberto](https://dribbble.com/shots/3971202-Info-navigation) for the amazing [@design](https://dribbble.com/shots/5922034-Multi-search-by-categories) 
- thanks to : [@Mert Şimşek](https://github.com/iammert) for the inspiration with the [@Android version](https://github.com/iammert/MultiSearchView)

## ✨ Demo
<p align="center">
<img src="https://raw.githubusercontent.com/mejdi14/flutter_multi_search/master/images/multisearch-_1_.gif" height="600" width="800" >
	</p>
	
	
## Basic usage
```
MultiSearchView(
              onSelectItem: (value) {
                /// when you swith from an item to another
              },
              onSearchComplete: (value) {
                /// when you hit the keyboard search button
              },
              onDeleteAlternative: (value) {
                /// when you delete and item and it switchs to another item if exist
              },
              onItemDeleted: (value) {
                /// when you delete an item
              },
              onSearchCleared: () {
                /// when all search items are cleared
              },
            )
```

## Options
choosing the indicator shape (default is line shape):
```
searchIndicatorShape: SearchIndicatorShape.dot
/// or
searchIndicatorShape: SearchIndicatorShape.line
```
indicator color:
```
indicatorColor: Colors.purple
```
changing the width (default is screen size width):
```
width: 150
```
changing the icon color:
```
iconColor: Colors.blue
```
changing the delete item icon color:
```
removeItemIconColor: Colors.black
```
changing the delete item icon color:
```
removeItemIconColor: Colors.black
```
setting the hint text:
```
inputHint: 'type your text'
```
... please check the class code for more options
## 🤝 Contributing

Contributions, issues and feature requests are welcome.<br />
Feel free to check [issues page] if you want to contribute.<br />


## Author

👤 **Mejdi Hafiane**

- Twitter: [@MejdiHafiane](https://twitter.com/mejdi141)

## Show your support

Please ⭐️ this repository if this project helped you!


## 📝 License

Copyright 2021 Mejdi hafiane

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF

