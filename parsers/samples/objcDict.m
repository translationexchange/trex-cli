int main(int argc, char * argv[])
{
    @autoreleasepool {


      // With Dict Arguments

      TMLLocalizedString(@"Simple String", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"Emoji String 😀", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }, @"TMLLocalizedString \"second\" argument of two");

      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
        with multiple lines, using escape", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        @"with multiple lines, using @", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
        "with multiple lines, not using @", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }, @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }, @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }, @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"", 
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      },
      @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'", 
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'", @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      },
      @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      },
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'");
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'", 
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });

      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\""
          ,@{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }, @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",@{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
        with multiple lines, using \"escape\"",@{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }
          , @"\"Second\" 'argument' of two,\
        with multiple lines, using \"escape\"",
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        @"with multiple lines, using '@'"
          ,@{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      }
            , @"\"Second\" 'argument' of two,"
        @"with multiple lines, using '@'"
            ,@{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });
      TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
        "with multiple lines, not using '@'"
          , @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      },
      @"\"Second\" 'argument' of two,"
        "with multiple lines, not using '@'",
      @{
      @"foo": @"Foo",  @"num": @3,
      @"bool": @(YES),
      @"variable": myVariable,
      @"inArray": myArray[0],
      @"inDict": myDict[@"foo"],
      @"array": @[@"foo", @"bar"],
      @"dict": @{@"another": @"Dict"},
      @"message": [self noarg],
      @"longerMessage": [self get:@"foo" with:nil with:[self arg]],
      @"NSNull": [NSNull null]
      });

    }
}