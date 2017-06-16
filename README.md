[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

[Clientside Repo](https://github.com/eliottenos/capstone-client)

[Live App](eliottenos.github.io/capstone-client)

[Heroku](https://hidden-anchorage-54160.herokuapp.com/)

ERD: A User has many Places

I used Ruby on Rails for the API.  I began with a scaffold for Locations.  This
posed some diffuclties as I need to change the attribiutes and upon rolling back
encountered some errors.  I decided that a better approach would be to start again with a scaffold for Places.  I also encountered a few errors within the controller but
server logs were able to correct those without too much time wasted.

My routes were as follows:

post '/sign-up' => 'users#signup'
post '/sign-in' => 'users#signin'
delete '/sign-out/:id' => 'users#signout'
patch '/change-password/:id' => 'users#changepw'
post '/create-place' => 'places#create'
patch '/update-place/:id' => 'places#update'
delete '/destroy-place/:id' => 'places#destroy'

A user has many places.  Any user can view places, with the attributes, but only
owner can delete or update.

**locally**

```sh
bin/rake db:migrate VERSION=0
bin/rake db:migrate db:seed db:examples
```

**heroku**

```sh
heroku run rake db:migrate VERSION=0
heroku run rake db:migrate db:seed db:examples
```

## [License](LICENSE)

1.  All content is licensed under a CC­BY­NC­SA 4.0 license.
1.  All software code is licensed under GNU GPLv3. For commercial use or
    alternative licensing, please contact legal@ga.co.
