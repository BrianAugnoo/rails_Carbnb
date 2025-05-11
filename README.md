Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.

Note:
(Brian Augnoo)
1- for someone trying to hosting, the ENV variable MY_APP_DATABASE_URL maybe empty so you must use heroku addons:create heroku-postgresql
2- don't forget to add an ENV variable USER_PASSWORD in your .env file, I had to put this protocol to avoid gitgardian crying
3- When you launch a server, the bookings are automatically updated, but if you want to use Rails c to test the models, please use the command rake update_booking or rails uptade_booking to update them.

Warning:
(Brian Augnoo)
1- If you use the seed, your current data in the DB will be deleted.
