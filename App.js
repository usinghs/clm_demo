/**
 * Sample App
 */

import * as React from 'react';
import {View, NativeModules, Button, FlatList, Text} from 'react-native';
import * as RNFS from 'react-native-fs';

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  tapHere1 = () => {
    NativeModules.NativeCommunication.sendHTMLPath('/Check/demo.html');
  };

  readFileDirectory = () => {
    //readDir(dirpath: string)
    RNFS.readDir(RNFS.DocumentDirectoryPath)
      .then((files) => {
        console.log('files', files);
        console.log('Path', RNFS.DocumentDirectoryPath);
      })
      .catch((err) => {
        console.log(err.message, err.code);
      });
  };

  // tapHere2 = () => {
  //   NativeModules.NativeCommunication.sendHTMLPath('/Check/test.pdf');
  // };

  // tapHere3 = () => {
  //   NativeModules.NativeCommunication.sendHTMLPath(
  //     '/Check/test-presentation.pptx',
  //   );
  // };

  componentDidMount() {
    // const AddRatingManagerEvent = new NativeEventEmitter(NativeCommunication);
    // this._subscription = AddRatingManagerEvent.addListener('onclose', info => {
    //   console.log('from Native  json ===', JSON.stringify(info));
    // });
  }

  renderItem = (item, index) => {
    console.log('item', item);
    <View>
      <Text>item.name</Text>
      <Text>item.path</Text>
    </View>;
    return item;
  };

  getFilePaths = () => {
    let filesValue;
    RNFS.readDir(RNFS.DocumentDirectoryPath)
      .then((files) => {
        console.log('files', files);
        console.log('Path', RNFS.DocumentDirectoryPath);
        return files;
      })
      .catch((err) => {
        console.log(err.message, err.code);
      });

    // return filesValue;
  };

  render() {
    return (
      // eslint-disable-next-line react-native/no-inline-styles
      <View style={{flex: 1, paddingTop: 100}}>
        <Button
          onPress={this.tapHere1}
          title="Open Document Picker"
          color="#FF6347"
        />
        {/* <Button onPress={this.tapHere2} title="Open Test PDF" color="#FF6347" />

        <Button
          onPress={this.tapHere3}
          title="Open Test Presentation"
          color="#FF6347"
        /> */}
        {/* <Button
          onPress={this.readFileDirectory}
          title="Read file directory"
          color="#FF6347"
        /> */}
        <FlatList
          data={this.getFilePaths}
          renderItem={this.renderItem()}
          keyExtractor={(item) => item.key}
        />
      </View>
    );
  }
}

export default App;
