
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return new MaterialApp(
      home: new RandomWords(),
    );
  }
}
class RandomWords extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}
class RandomWordsState extends State<RandomWords>{

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize:18.0);
  
  Widget _buildRow(WordPair pair){
      return new ListTile(
        title: new Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
      );
  }

  _buildSuggestions(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context,i){
        if(i.isOdd) return new Divider();
        final index = i~/2;
        if(index >= _suggestions.length){
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    // return new Text(wordPair.asUpperCase);
    return new Scaffold(
      appBar:new AppBar(
        title:new Text('挑选名字')
      ),
      body: _buildSuggestions() 
    );
  }
}