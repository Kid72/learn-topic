# Importing the cards into Anki

The tutor delivers a UTF-8 CSV with the columns `front,back,notes,tags`.

```csv
front,back,notes,tags
"Postgres: why does adding an index slow down INSERTs?","Each insert must also update every index on the table.","Learner's first answer was 'no idea'; reached it from one hint.","databases::indexes writes"
```

Format details: comma separator, every field in double quotes, a double quote inside a field is doubled, one line per card, no HTML. Tags are separated by spaces, and `::` builds a hierarchy such as `databases::indexes`.

## One-time setup: a note type with a Notes field

Anki's built-in Basic type has no place for the `notes` column.

1. **Tools → Manage Note Types → Add → Add: Basic**, name it `Basic + Notes`.
2. Select it, choose **Fields → Add**, and create a field called `Notes`.
3. Choose **Cards**, open the **Back Template**, and add `{{Notes}}` below `{{Back}}`.

## Import

1. **File → Import** and choose the CSV.
2. Set **Note type** to `Basic + Notes`.
3. Map the columns: 1 to Front, 2 to Back, 3 to Notes, 4 to Tags.
4. If the header row `front,back,notes,tags` shows up as a card, delete that one card.

Any app that imports CSV with these four columns works the same way.
