/**
 * Sample App
 */

import * as React from 'react';
import {
  View,
  NativeModules,
  Button,
  NativeEventEmitter,
  Text,
} from 'react-native';
import * as RNFS from 'react-native-fs';

const DemoEmitterModule = NativeModules.DemoEmitterModule1;
const DemoModuleEmitter = new NativeEventEmitter(DemoEmitterModule);

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.kpiSubscription = DemoModuleEmitter.addListener(
      'sendKPIEvent',
      this._handleDemoEmitterLink,
    );
  }

  _handleDemoEmitterLink = (kpiObject) => {
    console.log('KPI in React Native layer', kpiObject);
    if (!kpiObject) {
      return;
    }
  };

  tapHere1 = () => {
    RNFS.readDir(RNFS.DocumentDirectoryPath + '/a3E6F000000gcLIUAY')
      .then((files) => {
        console.log('files', files);
        console.log(
          'Path',
          RNFS.DocumentDirectoryPath + '/a3E6F000000gcLIUAY/index.html',
        );
        NativeModules.NativeCommunication.sendHTMLPath(
          RNFS.DocumentDirectoryPath + '/a3E6F000000gcLIUAY/index.html',
        );
      })
      .catch((err) => {
        console.log(err.message, err.code);
      });
  };

  tapHere2 = () => {
    NativeModules.NativeCommunication.getDataFromRN('{"tag": "hello"}');
  };

  readFileDirectory = () => {
    RNFS.readDir(RNFS.DocumentDirectoryPath)
      .then((files) => {
        console.log('files', files);
        console.log('Path', RNFS.DocumentDirectoryPath);
      })
      .catch((err) => {
        console.log(err.message, err.code);
      });
  };

  renderItem = (item, index) => {
    console.log('item', item);
    <View>
      <Text>item.name</Text>
      <Text>item.path</Text>
    </View>;
    return item;
  };

  getFilePaths = () => {
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

        <Button onPress={this.tapHere2} title="Open" color="#FF6347" />

        <Button
          onPress={this.readFileDirectory}
          title="Read file directory"
          color="#FF6347"
        />
      </View>
    );
  }
}

export default App;
