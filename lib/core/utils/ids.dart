import 'package:uuid/uuid.dart';

const _uuid = Uuid();

/// UUID v4 primary keys, compatible with Supabase `uuid` columns.
String newId() => _uuid.v4();

/// Stable 31-bit hash, used for notification ids (which must be 32-bit ints).
int stableHash(String input) {
  var hash = 0x811c9dc5;
  for (final unit in input.codeUnits) {
    hash ^= unit;
    hash = (hash * 0x01000193) & 0xffffffff;
  }
  return hash & 0x7fffffff;
}
