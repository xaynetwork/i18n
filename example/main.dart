// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'package:i18n/i18n.dart' as i18n;
import 'package:quick_log/quick_log.dart';

import 'messages.i18n.dart';
import 'messages_de.i18n.dart' as de;

void main() async {
  const log = Logger('Main', 'i18n');
  log.info('Hello from i18n!');
  log.info('Some english:');
  var m = Messages();
  print(m.generic.ok);
  print(m.generic.done);
  print(m.invoice.help);
  print(m.apples.count(1));
  print(m.apples.count(2));
  print(m.apples.count(5));

  log.info('Some German:');
  m = de.MessagesDe();
  print(m.generic.ok); // inherited from default
  print(m.generic.done);
  print(m.invoice.help);
  print(m.apples.count(1));
  print(m.apples.count(2));
  print(m.apples.count(5));

  // Override plurals for German or register support for your own language:
  i18n.registerResolver('de', (int count, i18n.QuantityType type) {
    if (type == i18n.QuantityType.cardinal && count == 1) {
      return i18n.QuantityCategory.one;
    }
    return i18n.QuantityCategory.other;
  });

  // See:
  // http://cldr.unicode.org/index/cldr-spec/plural-rules
  // https://www.unicode.org/cldr/charts/latest/supplemental/language_plural_rules.html
}
