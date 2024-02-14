class Weather {
  //eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjJmNmFkZmZiOTNhMDk3MzdiYmQ5ZmQ1NTNkNmI2NDMxZmQ1YjVmNzM0YzUyNTlhYjgyZjBjZTU2ZTRkMjJkNzA0MmQ0MzY4MGJmYjhjZGM2In0.eyJhdWQiOiIyIiwianRpIjoiMmY2YWRmZmI5M2EwOTczN2JiZDlmZDU1M2Q2YjY0MzFmZDViNWY3MzRjNTI1OWFiODJmMGNlNTZlNGQyMmQ3MDQyZDQzNjgwYmZiOGNkYzYiLCJpYXQiOjE3MDc4ODI0NjgsIm5iZiI6MTcwNzg4MjQ2OCwiZXhwIjoxNzM5NTA0ODY4LCJzdWIiOiIzMDE2Iiwic2NvcGVzIjpbXX0.t8swgZ7vySrI-bBhMTP39ik6QIqXvIjOwrilSMJ0m6defxMtibzPKYvRiBkHTs9vEVPjhrkqBZj4xGIagpg97biHx_WQmw_FoVpZLX_kptqLsbgln4TAbSX6ddP5Fzx0Tgrr8ry-JsVlNw6ICjCL5p8LkR6o_2LkOfPA3QUoaqscT51aEb6sG1Ba8iAO9ftVqqDk0CIsZdKadwcCACEFYBOfHVKLIhCY5qzT_tfFPhIcqid7qyqGC2T1EazycfGuv8kpwAfnR3TDBsEucdsneUjp_rx-pdtCiTbB_w07GUKAQ1KCTzic435ida23xP3uNHSJcSX0A5xbebjpyPVma0fHpQ0vC_xZ6DplhCA8g2_yncWBR62xqDy2dFeL07namJ1Aj0Pq25Kv2l9Gt__NL9X1UR95L1lO_CVkWwmgpdjoQjUZCsY8Wkx4bwVt1sfvNdw_e6Etz9co4J6E3Pf1agB-ZyadyyI0SXQgEZN14jXo_oydei9AV9LhjngN3WvX3AUbPXxQNfjgI89lPNrHUgxvO28iO1pEWHPioYSgGI6V0Lmx4LywNbfzBedQqTQhNI02cCqVFYIiu9kqDdtmtrxPc-Ajo3paA-JzGmkC_Eh2f-NPf6m673kFFpqXodICRh4cJQpaUozNLhYs5VjkdMhRpxrB4GRaB2cvpvLiFbc
  final String address;
  final double temperature;
  final int cond;

  Weather(
      {required this.address, required this.temperature, required this.cond});
  static const _condition = [
    '',
    'ท้องฟ้าแจ่มใส (Clear)',
    'มีเมฆบางส่วน (Partly cloudy)',
    'เมฆเป็นส่วนมาก (Cloudy)',
    'มีเมฆมาก (Overcast)',
    'ฝนตกเล็กน้อย (Light rain)',
    'ฝนปานกลาง (Moderate rain)',
    'ฝนตกหนัก (Heavy rain)',
    'ฝนฟ้าคะนอง (Thunderstorm)',
    'อากาศหนาวจัด (Very cold)',
    'อากาศหนาว (Cold)',
    'อากาศเย็น (Cool)',
    'อากาศร้อนจัด (Very hot)',
  ];
  static const _symbol = [
    '',
    '🌈',
    '☁',
    '☁☁',
    '☁☁☁',
    '🌦',
    '🌧',
    '☔',
    '⛈',
    '☃',
    '⛄',
    '❄',
    '☀',
  ];

  String get condition => _condition[cond];

  String get symbol => _symbol[cond];
}
