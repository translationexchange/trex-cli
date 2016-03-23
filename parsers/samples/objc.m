int main(int argc, char * argv[])
{
    @autoreleasepool {

TMLLocalizedString(@"Simple String");
TMLLocalizedString(@"Emoji String 😀");

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two");

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
  with multiple lines, using escape");
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  @"with multiple lines, using @");
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  "with multiple lines, not using @");

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", 
@"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", 
@"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", 
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\""
    , @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'"
    , @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'"
    , @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");

    }
}