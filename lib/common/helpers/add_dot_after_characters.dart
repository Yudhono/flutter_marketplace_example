String addDotAfterCharacters(String text, int charLimit) {
  if (text.length <= charLimit) {
    return text;
  }
  return text.substring(0, charLimit) + '...';
}
