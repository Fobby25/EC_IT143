/* Step 4: Research
Source: https://learn.microsoft.com/en-us/sql/t-sql/statements/create-function-transact-sql
Finding: appending ' ' to the name avoids errors for single-word names,
because CHARINDEX then always finds a space. */