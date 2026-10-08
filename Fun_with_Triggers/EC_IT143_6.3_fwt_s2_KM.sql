   /* Step 2: Answer so far
   A default constraint only fills a value on INSERT, not UPDATE. So I need
   a column for the date and an AFTER UPDATE trigger that sets it. */