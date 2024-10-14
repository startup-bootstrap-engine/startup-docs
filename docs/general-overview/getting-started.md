# Getting Started

## Pre-requisites


- It’s recommended that you create a [separate Google Chrome profile](https://www.youtube.com/watch?v=pEMhTumFtPo&ab_channel=MaxDalton) for our project. It’s way more efficient and organized.

- Please [download the Slack app](https://slack.com/downloads/windows) on your phone and activate notifications (its important staying active!).



## Important Notices

### Team Rules

The project has voluntary enrollment. We do it here as a hobby. It's not freelancing or related to any type of paid work (except if you’re a freelancer). Most here are in the learning phase and we created this environment to create something interesting and develop professionally at the same time.

- **Usage of Engine Source Code:**
  - You can use the engine source code for whatever you want (except selling it or for commercial usage), as long as you collaborate with it.
  - It can also serve as a portfolio, but make it clear the parts you worked on.

- **Coordination:**
  - I () just coordinate the flow of tasks. I'm not anyone's boss or manager.
  - It works better that way because I created the entire codebase from scratch and I have a lot of experience on what needs to be done.

- **Task Autonomy:**
  - You have full autonomy to choose the tasks associated with you and perform them as and when you want.
  - However, know that as we work as a team, if it takes too long, your task may be reassigned to someone else.

- **Freelancer Rules:**
  - You grant full ownership of the IP (intellectual property) of your work to Joao Paulo Furtado Silva, with an irrevocable license for non-restricted use, for non-commercial **OR** commercial usage.
  - You cannot use the codebase for anything else, including commercial usage or reselling.

- If you don't agree, please don't proceed and leave.

### Methodology

- **Scrum Methodology**
  - We use Scrum methodology for managing our project. If you don’t know what it means, please check:
    - [Introduction to Scrum](https://www.youtube.com/watch?v=InbOnXMAA7k&ab_channel=Moxie)
    - [Organize Agile](https://www.youtube.com/watch?v=2Vt7Ik8Ublw&ab_channel=OrganizeAgile)

 
## Onboarding

### Ask for Invitation to These Platforms


- **Jira**
  - We recommend downloading the Jira mobile app as well.

- **Slack**
  - Download the app.
  - Make sure the notifications are toggled on and you’re active.

- **GitHub**
  - Ask Joao Paulo for the invites. You'll need to provide your e-mail address.

- **Google Cloud**
  - Ask Joao Paulo for the invite, especially the proper permissions for our secret manager.


### OS Setup

Please follow the instructions from [this section](../os/os-setup.md) to setup your OS.


### Setup Your Local Folder Structure and Your Project

Before beginning your local environment setup, note that you **MUST** use Yarn and not npm. Npm will cause a lot of issues along the way, which are hard to debug.

Clone the repositories from this [link](https://github.com/orgs/startup-bootstrap-engine/repositories).

```bash
./startup-engine
   ./startup-api
   ./startup-mobile
   ./startup-web
   ./startup-shared
   ./startup-docs
```
Make sure you install your project dependencies using:

```bash
yarn install
```


### Setup Each Project

This step should be done for every repository listed above.

On the root of every project (EXCEPT startup-api) listed above, run:

```bash
yarn install
yarn configure
```

for STARTUP-API project, run:

```bash
yarn install
yarn configure:first-time

# Once everything is setup, run:
docker-compose up

```
 
After running these commands, all of the required files will be set up and your project will be running in Development mode by default (check your `.env` file).

**Ensure:**
- You have a `.env`, `docker-compose.yml`, and `Dockerfile` file in the root of your projects after running `yarn configure`.
- If not, you probably don’t have `wget` installed on your OS (especially if using Windows). Install it and try again!

#### Switching Between Environments

When needed, switch between environments by typing:

```bash
yarn env:switch:dev
```

or

```bash
yarn env:switch:prod
```

**Note:** You’ll mostly be using the Development environment at the beginning.

Please do this additional setup as required by this section (check the sub-sections).


#### Robo3T (Recommended for Viewing MongoDB Data)

- **Download Link:** [Robo3T Releases](https://github.com/Studio3T/robomongo/releases)
  
  **Note:** It's **NOT** the Studio version (that one is paid!). It's the hobbyist one. Feel free to use other tools if you’re more familiar with them. This is just an optional suggestion!

#### Starting the Containers

- Ensure you have a `.env` file in your `rpg-api` and `rpg-client` folders. You can create it by running `yarn configure` inside your project folder.
- Simply run:
  ```bash
  docker-compose up
  ```
- **Important:** You **DON’T** need to run `npm` or `yarn run dev` after the containers are up and running! Docker already does it for you.

#### Accessing Our Database on Robo3T

1. **Ensure Docker DB Container is Running:**
   - Make sure that your Docker DB container (`rpg-db`) is up and running.

2. **Install Robo3T:**
   - Please install the free edition of Robo3T.

3. **Connect to Database:**
   - Open Robo3T.
   - Click on the **"File"** option, then on **"Connect..."**.
   - Create a new connection with the following settings:
     - **Connection Tab:**
       - **Name:** RPG-Engine Dev
       - **Address:** localhost
       - **Port:** 27018
     - **Authentication Tab:**
       - **Database:** admin
       - **User Name:** admin
       - **Password:** 31416
       - **Auth Mechanism:** SCRAM-SHA-1

#### Accessing API Routes

This is important to be understood by both front-end and back-end sub-teams!

Please check:

- [REST API Client](#)

#### Seeding Your Database with Dummy Data

1. **Access Your `rpg-api` Project:**
   
2. **Run the Containers:**
   ```bash
   docker-compose up
   ```
   - Make sure `rpg-db` is active.

3. **Download and Import Dummy Database:**
   ```bash
   yarn db:download
   yarn db:import
   ```

4. **Verification:**
   - Done! You can check your imported data in Robo3T.

### 6. Install ESLint and Prettier VSCode Extensions

- [ESLint Extension](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
- [Prettier Extension](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

### 7. Get a Project Codebase Overview

This is one of the most important steps! Watch our videos so you can have a clear understanding of our codebase before starting our tasks.

- **Start by clicking [here](#).**

Take your time to review these videos. It's important to become familiar with our codebase before jumping into solving any tasks. Focus especially on the videos related to your area (front-end or back-end), if that's the case.

### 8. Setup HTTP REST Client

Check our [HTTP Rest Client documentation](#) here.

This is what we use to manage our API routes. It has the same function as Postman/Insomnia, but we opted for this VSCode extension because it's free for teams and super easy to use.

### 9. Read Our Git Guidelines

Check our [Git guidelines](#) here.

### 10. Install Some Suggested Extensions

- **Tutorial:** Watch [this tutorial](https://www.youtube.com/watch?v=Nbah9ohzSI4) where I walk you through the extensions I use.
- **Extensions List:** Take a look at our suggested extensions list.
  - Make sure you have all from the required extension list; otherwise, the project won't run properly in your VSCode (missing linting, formatting issues, etc.).

### 11. (Missing Step)

*Note: Step 11 appears to be missing in the original content.*

### 12. Follow Our Productivity Tips

Check our [productivity tips](#) here!

```
