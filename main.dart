import 'models/Esp32.dart';
import 'models/Users.dart';
import 'system/system.dart';

void main() {
  
  Esp32 esp32 = Esp32(
    wifiSsid: 'mohammad',
    wifiPassword: '123',
    firebaseurl: 'https://firebase.com',
  );

  User user = User(
    Username: 'mohammad',
    email: 'mohammad@gmail.com',
    password:'123456',
    phone: '123456789',
    location: {'lat': 0, 'long': 0});

  esp32.flame = true;
  esp32.gas = false;
  
  System system = System(
    esp32: esp32,
    users: user,
  );

while (true) {
    if (system.esp32.flame||system.esp32.gas) {
      system.alarm = true;
      system.users.sendMessage('danger detected'); 
      print('danger detected!');
    } else {
      print('every thing is ok');
    }
    
    esp32.sendDataToFirebase(system.esp32.flame, system.esp32.gas, system.esp32.firebaseurl);
  }


}