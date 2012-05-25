# Papertrail Prowl Webhook

A simple webhook to send log messages to Prowl to provide simple iOS
notifications.

## Deploying

### Step 1: Create a heroku app

    $ heroku create -s cedar

### Step 2: Get a prowl API key

From https://www.prowlapp.com/api_settings.php

### Step 3: Add API key to your heroku app

    $ heroku config:add PROWL_API_KEY=69fd475972db19b6c2ee1f68d08acff1c4bcbf5b

### Step 4: Create a Papertrail saved search

1. Create a saved search for a unique term (something like `ops-alert` would work)
2. Create a search alert (webhook) pointing to your heroku app pointing to `/submit`

Find out more about search alerts and webhooks here: http://help.papertrailapp.com/kb/how-it-works/web-hooks


## Using

Once you've created a saved search in Papertrail and configured the search
alert, you can now send log messages that match that message.

For example, if your saved search matches `ops-alert`, you could use this 
to alert you when a big transfer has completed:

    $ rsync -R /backup backup:/backup ; logger -t ops-alert The transfer has completed
