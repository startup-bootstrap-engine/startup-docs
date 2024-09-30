# @startup-docs

This documentation app is built using [Docusaurus](https://docusaurus.io/), a modern static website generator.

### Pre-requisites

* [Node.js](https://nodejs.org/en/download/)
* [Yarn](https://yarnpkg.com/getting-started/install)

To get started, please run the following command, to generate your configuration files:

```
$ yarn configure
```

### Environment Variables

Environment variables are defined within the `docusaurus.config.ts` file using the `customFields` object.

### Local Development

```
$ yarn start
```

This command starts a local development server and opens up a browser window. Most changes are reflected live without having to restart the server.

### Build

```
$ yarn build
```

This command generates static content into the `build` directory and can be served using any static contents hosting service.

### Deployment

Using SSH:

```
$ USE_SSH=true yarn deploy
```

Not using SSH:

```
$ GIT_USER=<Your GitHub username> yarn deploy
```

If you are using GitHub pages for hosting, this command is a convenient way to build the website and push to the `gh-pages` branch.
