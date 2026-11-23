import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_para_sayma/oyun_para_sayma.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(paraSaymaConfig.title.length, 33);
    expect(paraSaymaConfig.tagline.length, 33);
    for (final s in paraSaymaConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(paraSaymaConfig.gameId, paraSaymaId);
    expect(paraSaymaRules.gameId, paraSaymaId);
    expect(paraSaymaConfig.kidsMode, isTrue);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(paraSaymaRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: paraSaymaId, optionalMechanics: paraSaymaRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(paraSaymaRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
