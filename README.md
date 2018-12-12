>> rails new Stori
>> cd Stori
>> bundle install
>> rails s

use DB Browser
rake db:migrate:down VERSION=20100905201547
rails destroy scaffold MyFoo

Grakn
---
Grakn lives here: /Users/mattgaidica/Documents/Software/grakn
graql console -k stori -f /Users/mattgaidica/Documents/Software/Stori/grakn/grakn_model.gql

>>> graql console -k stori
>>> clean
>>> confirm

To delete:
Open Rested.app
Send DELETE request to localhost:4567/kb/stori