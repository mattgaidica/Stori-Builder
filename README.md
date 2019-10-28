Stori
---
[Schema] (https://dbdiagram.io/d/5d880991ff5115114db482f1)

- User has libraries, library has sources/thoughts/holds/entities
- Source has annotations/citations
- Thought has strands, strands relate thought and annotation (are positioned)
- Hold has annotation


Rails
---
[Re-installed using] (https://gorails.com/setup/osx/10.14-mojave)

[Credentials Info] (https://medium.com/cedarcode/rails-5-2-credentials-9b3324851336)

```
> rake db:migrate:down VERSION=20100905201547
> rails destroy scaffold MyFoo
> lsof -wni tcp:3000
```

Grakn
---

If `Process exited with code '0': 'Uncaught exception at thread [Failed to bind]` then kill all java PIDs.

```
grakn console -k stori -f /Users/matt/Documents/Software/Stori-Builder/grakn/sources_schema.gql
grakn console -k stori -f /Users/matt/Documents/Software/Stori-Builder/grakn/sources_data.gql

match $conn (topic: $x, data: $y) isa connection; get; offset 0; limit 2000;
match $x isa keyword; get;

graql console -k stori
clean
confirm
```

To delete:
Open Rested.app
Send DELETE request to localhost:4567/kb/stori

~/Library/Application\ Support/grakn-workbase/