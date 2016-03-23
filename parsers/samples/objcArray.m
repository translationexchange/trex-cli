int main(int argc, char * argv[])
{
    @autoreleasepool {


      // With Array Arguments

      TMLLocalizedString(@"Simple String", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"Emoji String 😀", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ], @"TMLLocalizedString \"second\" argument of two");

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
        with multiple lines, using escape", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        @"with multiple lines, using @", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        "with multiple lines, not using @", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ], @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ], @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ],
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ],
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\""
          ,@[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ], @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",@[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"",@[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]
          , @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'"
          ,@[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]
            , @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'"
            ,@[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'"
          , @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ],
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      @[
      @"foo", @3, [NSNull null], @{@"foo": @"Foo"}, [self some:@"Like" it:@"Hot"], @[@"Nested", @"Array"]
      ]);

    }
}