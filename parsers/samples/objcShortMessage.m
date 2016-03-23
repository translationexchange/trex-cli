int main(int argc, char * argv[])
{
    @autoreleasepool {

      // With short message Arguments

      TMLLocalizedString(@"Simple String", [self noarg]);
      TMLLocalizedString(@"Emoji String 😀", [self noarg]);

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", [self noarg], @"TMLLocalizedString \"second\" argument of two");

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
        with multiple lines, using escape", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        @"with multiple lines, using @", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        "with multiple lines, not using @", [self noarg]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self noarg], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", [self noarg], @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", [self noarg], @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      [self noarg],
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", [self noarg],
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      [self noarg],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      [self noarg]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\""
          ,[self noarg], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",[self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"",[self noarg]
          , @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",
      [self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'"
          ,[self noarg]
            , @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'"
            ,[self noarg]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'"
          , [self noarg],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      [self noarg]);
      
    }
}