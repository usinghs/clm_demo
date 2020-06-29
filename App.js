/**
 * Sample App
 */

import * as React from 'react';
import {View, NativeModules, Button} from 'react-native';

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  tapHere1 = () => {
    NativeModules.NativeCommunication.sendHTMLPath('/Check/demo.html');
  };

  tapHere2 = () => {
    NativeModules.NativeCommunication.sendHTMLPath('/Check/test.html');
  };

  componentDidMount() {
    // const AddRatingManagerEvent = new NativeEventEmitter(NativeCommunication);
    // this._subscription = AddRatingManagerEvent.addListener('onclose', info => {
    //   console.log('from Native  json ===', JSON.stringify(info));
    // });
  }

  render() {
    return (
      // eslint-disable-next-line react-native/no-inline-styles
      <View style={{flex: 1, paddingTop: 100}}>
        <Button
          onPress={this.tapHere1}
          title="Open Demo HTML"
          color="#FF6347"
        />

        <Button
          onPress={this.tapHere2}
          title="Open Test HTML"
          color="#FF6347"
        />
      </View>
    );
  }
}

export default App;
