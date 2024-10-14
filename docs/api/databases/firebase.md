# Firebase

As of today, Firebase is the default database for the project. 

It's set up by the following .env variables on `startup-api`:

## Firebase - .env

```bash
# Databases (firebase, mongoose)
DB_ADAPTER=firebase
...

# Make sure all other DB related modules are turned off. For example:
MODULE_MONGODB=false
```

Then, run `yarn module:build` to rebuild your API modules.
