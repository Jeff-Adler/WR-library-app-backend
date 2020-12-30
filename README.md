# README

Simple library app to look up books by title and author, as well as mark books as duplicates of others.

## Domain Model

![Alt text](screenshots/DomainModel_12_30_2020.png "Dom Model 12_28_2020")

## Database Integrity and Model Testing

To test the full est of model unit tests, from the console, run:

```
rspec spec/models/
```

Models and database are tested for:

- Proper validation upon model creation
- Destruction of dependent model upon model deletion
- Database integrity when converting Book References to Duplicates (labeled as Book and Alts, respectively), and vice versa
