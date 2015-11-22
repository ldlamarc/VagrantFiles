#Setting up PostgreSQL

https://help.ubuntu.com/community/PostgreSQL

Basic Server Setup
To start off, we need to set the password of the PostgreSQL user (role) called "postgres"; we will not be able to access the server externally otherwise. As the local “postgres” Linux user, we are allowed to connect and manipulate the server using the psql command.

In a terminal, type:

```console
sudo -u postgres psql postgres
```
this connects as a role with same name as the local user, i.e. "postgres", to the database called "postgres" (1st argument to psql).

Set a password for the "postgres" database role using the command: (use 'password' as password for Phoenix default set-up)
```console
\password postgres
```
and give your password when prompted. The password text will be hidden from the console for security purposes.

Type Control+D or \q to exit the posgreSQL prompt.

#Setting up Phoenix

http://www.phoenixframework.org/docs/up-and-running

```console
mix phoenix.new hello_phoenix
```

Phoenix assumes that our PostgreSQL database will have a postgres user account with the correct permissions and a password of "postgres". If that isn't the case, please see the instructions for the ecto.create mix task.

Ok, let's give it a try.
```console
$ cd hello_phoenix
$ mix ecto.create
$ mix phoenix.server
```
