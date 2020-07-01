/**
 * Sample App
 */

import * as React from 'react';
import {
  View,
  NativeModules,
  Button,
  NativeEventEmitter,
  FlatList,
  Text,
} from 'react-native';
// import {DemoEmitterModule} from './DemoEmitterModule';
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

  _handleDemoEmitterLink = (payloadObject) => {
    console.log('payloadObject', payloadObject);
    if (!payloadObject) {
      return;
    }

    let payloadVal;

    // // This is required as Android sends notification data using Map with key as payload
    // if (isAndroid) {
    //   payloadVal = JSON.parse(payloadObject.payload);
    // }
    // const payload = payloadVal ? payloadVal : payloadObject;

    // const businessUnitId = get(payloadObject, 'businessUnitId', '');
    // const pushNotifyAgentGroupId = get(payload, 'agentGroupId', '');
    // if (
    //   (payloadObject &&
    //     payloadObject.payload &&
    //     payloadObject.payload.includes('businessUnitId')) ||
    //   businessUnitId.length > 0
    // ) {
    //   this.props.setDeeplinkStates(
    //     true,
    //     routes.NUANCE_LIVE_CHAT_DeepLink,
    //     pushNotifyAgentGroupId
    //   );
    //   return;
    // }
    // if (payload.action === 'DEEPLINK') {
    //   this.props.setDeeplinkStates(true, payload.value);
    // }
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

  // componentDidMount() {
  //   // const AddRatingManagerEvent = new NativeEventEmitter(NativeCommunication);
  //   // this._subscription = AddRatingManagerEvent.addListener('onclose', info => {
  //   //   console.log('from Native  json ===', JSON.stringify(info));
  //   // });
  // }

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

        <Button onPress={this.tapHere2} title="Open" color="#FF6347" />

        {/* <Button onPress={this.tapHere2} title="Open Test PDF" color="#FF6347" />

        <Button
          onPress={this.tapHere3}
          title="Open Test Presentation"
          color="#FF6347"
        /> */}
        <Button
          onPress={this.readFileDirectory}
          title="Read file directory"
          color="#FF6347"
        />
        {/* <FlatList
          data={this.getFilePaths}
          renderItem={this.renderItem()}
          keyExtractor={(item) => item.key}
        /> */}
      </View>
    );
  }
}

export default App;
