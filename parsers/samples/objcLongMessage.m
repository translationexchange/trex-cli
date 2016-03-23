int main(int argc, char * argv[])
{
    @autoreleasepool {

      // With long message Arguments

      TMLLocalizedString(@"Simple String", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"Emoji String 😀", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]], @"TMLLocalizedString \"second\" argument of two");

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
        with multiple lines, using escape", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        @"with multiple lines, using @", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        "with multiple lines, not using @", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]], @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]], @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]],
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]],
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\""
          ,[self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",[self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"",[self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]
          , @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'"
          ,[self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]
            , @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'"
            ,[self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'"
          , [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      [self foo:@"Foo" bar: @3     baz: 4  dict: @{@"foo": "Foo"} array: @[@"Foo"] msg:[self noarg] long:[self foo:@"Foo" bar: @"Bar"] n:nil nn:[NSNull null] inArray:arg[0] inDict: dict[@"foo"]]);

      
    }
}