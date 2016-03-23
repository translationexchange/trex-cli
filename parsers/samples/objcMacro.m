int main(int argc, char * argv[])
{
    @autoreleasepool {


      // With DEFINED_MACRO Arguments

      TMLLocalizedString(@"Simple String", DEFINED_MACRO);
      TMLLocalizedString(@"Emoji String 😀", DEFINED_MACRO);

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", DEFINED_MACRO, @"TMLLocalizedString \"second\" argument of two");

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
        with multiple lines, using escape", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        @"with multiple lines, using @", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        "with multiple lines, not using @", DEFINED_MACRO);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", DEFINED_MACRO, @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", DEFINED_MACRO, @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", DEFINED_MACRO, @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      DEFINED_MACRO,
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", DEFINED_MACRO,
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      DEFINED_MACRO,
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      DEFINED_MACRO);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\""
          ,DEFINED_MACRO, @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"",DEFINED_MACRO
          , @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",
      DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'"
          ,DEFINED_MACRO
            , @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'"
            ,DEFINED_MACRO);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'"
          , DEFINED_MACRO,
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      DEFINED_MACRO);
      
    }
}