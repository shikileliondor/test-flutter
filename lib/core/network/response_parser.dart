class ResponseParser {
  const ResponseParser._();

  static List<Map<String, dynamic>> parseList(dynamic payload) {
    if (payload is List) {
      return payload.whereType<Map>().map((item) => Map<String, dynamic>.from(item)).toList();
    }

    if (payload is Map<String, dynamic> && payload['data'] is List) {
      final data = payload['data'] as List;
      return data.whereType<Map>().map((item) => Map<String, dynamic>.from(item)).toList();
    }

    return const [];
  }

  static Map<String, dynamic> parseObject(dynamic payload) {
    if (payload is Map<String, dynamic> && payload['data'] is Map<String, dynamic>) {
      return Map<String, dynamic>.from(payload['data'] as Map);
    }

    if (payload is Map<String, dynamic>) {
      return Map<String, dynamic>.from(payload);
    }

    return const {};
  }
}
