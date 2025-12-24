enum TextMarkups {
  paragraphStart('\uE000'),
  pragraphEnd('\uE001'),
  boldStart('\uE002'),
  boldEnd('\uE003'),
  italicStart('\uE004'),
  italicEnd('\uE005'),
  underlineStart('\uE006'),
  underlineEnd('\uE007');

  final String code;

  const TextMarkups(this.code);
}
