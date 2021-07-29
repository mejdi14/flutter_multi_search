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

<p align="center">
<img src="https://raw.githubusercontent.com/mejdi14/flutter_multi_search/master/images/mutli_search.png" height="300" width="300" >
	</p>
	
## :art:Credits
- Many thanks to : [@Cuberto](https://dribbble.com/shots/3971202-Info-navigation) for the amazing [@design](https://dribbble.com/shots/5922034-Multi-search-by-categories) 

## ✨ Demo
<p align="center">
<img src="https://raw.githubusercontent.com/mejdi14/flutter_multi_search/master/images/multisearch.gif" height="800" width="400" >
	</p>
	
	
## How to use
```
//create your menu items
List<FoldableCell> myCards = [
    FoldableCell(color: Colors.yellow, label: 'close', icon: Icon(Icons.close)),
    FoldableCell(
        color: Colors.orange,
        label: 'take photo',
        icon: Icon(Icons.camera_alt)),
    FoldableCell(
        color: Colors.green,
        label: 'share',
        textColor: Colors.black,
        icon: Icon(Icons.share)),
    FoldableCell(color: Colors.purple, label: 'settings', icon: Icon(Icons.settings)),
    FoldableCell(
        color: Colors.blue,
        label: 'verification',
        icon: Icon(Icons.verified_user_rounded)),
    FoldableCell(color: Colors.red, label: 'profile', icon: Icon(Icons.person))
  ];
  
  // show your menu
   Navigator.of(context).push(PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  FoldableMenu(
                                    myCards: myCards,
                                    side: MenuSide.right,
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                    onCardSelect: (cell, counter) {
                                      print('this is :$cell');
                                    },
                                  )));
```
	
## 🤝 Contributing

Contributions, issues and feature requests are welcome.<br />
Feel free to check [issues page] if you want to contribute.<br />


## Author

👤 **Mejdi Hafiane**

- FaceBook: [@MejdiHafiane](https://www.facebook.com/mejdi.marshall)

## Show your support

Please ⭐️ this repository if this project helped you!


## 📝 License

Copyright 2021 Mejdi hafiane

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF

