import 'package:flutter_test/flutter_test.dart';
import 'package:pest_eradication/weapon_rules.dart';
void main(){test('all weapon attacks are immediate',(){
 for(final w in weapons){expect(w.instantHit,isTrue);}
 expect(weaponForWave(1).name,'권총');
 expect(weaponForWave(4).name,'장총');
 expect(weaponForWave(7).name,'투척');
 expect(weaponForWave(10).name,'젓가락');
});}
