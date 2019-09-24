Stori
---
- User has libraries, library has sources/thoughts/holds/entities
- Source has annotations/citations
- Thought has strands, strands relate thought and annotation (are positioned)
- Hold has annotation

**Open**
- What are entities? I think these are 'tags'. Source has entities through entities_sources.

Rails
---
re-installed using: https://gorails.com/setup/osx/10.14-mojave

rake db:migrate:down VERSION=20100905201547
rails destroy scaffold MyFoo

Grakn
---
Grakn lives here: /Users/mattgaidica/Documents/Software/grakn
graql console -k stori -f /Users/mattgaidica/Documents/Software/Stori/grakn/sources_model.gql

>>> graql console -k stori
>>> clean
>>> confirm

To delete:
Open Rested.app
Send DELETE request to localhost:4567/kb/stori

~/Library/Application\ Support/grakn-workbase/