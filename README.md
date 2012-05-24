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

### Step 4: Create a Papertrail webhook

