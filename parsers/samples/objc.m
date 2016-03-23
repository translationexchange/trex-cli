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


// With nil Arguments

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


// With NULL Arguments

TMLLocalizedString(@"Simple String", NULL);
TMLLocalizedString(@"Emoji String 😀", NULL);

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument'", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", @"TMLLocalizedString \"second\" argument of two", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two", NULL, @"TMLLocalizedString \"second\" argument of two");

TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',\
  with multiple lines, using escape", NULL);
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  @"with multiple lines, using @", NULL);
TMLLocalizedString(@"TMLLocalizedString \"single\" 'argument',"
  "with multiple lines, not using @", NULL);

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", NULL, @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", NULL, @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", NULL, @"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", 
@"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"", NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"", 
NULL,
@"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", 
@"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'", 
NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'", NULL,
@"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", 
NULL,
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'");
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'", 
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'",
NULL);

TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\""
    ,NULL, @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"",NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,\
  with multiple lines, using \"escape\"",NULL
    , @"\"Second\" 'argument' of two,\
  with multiple lines, using \"escape\"",
NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  @"with multiple lines, using '@'"
    ,NULL
      , @"\"Second\" 'argument' of two,"
  @"with multiple lines, using '@'"
      ,NULL);
TMLLocalizedString(@"TMLLocalizedString \"first\" 'argument' of two,"
  "with multiple lines, not using '@'"
    , NULL,
@"\"Second\" 'argument' of two,"
  "with multiple lines, not using '@'",
NULL);


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