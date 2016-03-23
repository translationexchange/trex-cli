int main(int argc, char * argv[])
{
    @autoreleasepool {


TMLLocalizedString(@"Simple String", nil);
TMLLocalizedString(@"Emoji String 😀", nil);

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", nil, @"TMLLocalizedString \"second\" argument of two");

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
  with multiple lines, using escape", nil);
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  @"with multiple lines, using @", nil);
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  "with multiple lines, not using @", nil);

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", nil, @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", nil, @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", nil, @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", 
@"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"", nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", 
nil,
@"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", 
@"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'", 
nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", nil,
@"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", 
nil,
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", 
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'",
nil);

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\""
    ,nil, @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"",nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"",nil
    , @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"",
nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'"
    ,nil
      , @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'"
      ,nil);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'"
    , nil,
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'",
nil);


    }
}