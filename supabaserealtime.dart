// Automatic FlutterFlow imports
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future supabaseRealtime(
  String? tableName,
  Future Function() reloadAction,
) async {
  final supabase = SupaFlow.client;
  String table = tableName ?? '*';
  final channel = supabase.channel('public:' + table);
  channel.on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: 'public', table: table),
    (payload, [ref]) {
      reloadAction();
      print('Reloaded.');
    },
  ).subscribe();
  // Add your function code here!
}
