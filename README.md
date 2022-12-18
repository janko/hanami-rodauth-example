# Hanami Rodauth Example

Example Hanami 2 app integrating the Rodauth authentication framework via JSON API.

## Setup

Install dependencies:

```sh
$ bundle install
```

Migrate the database:

```sh
$ bundle exec rake db:migrate
```

Then run the server:

```sh
$ hanami server
```

## Usage

The app implements a JSON API that requires authentication for all routes, so you can try out the root endpoint:

```sh
$ curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" localhost:2300/
{"error":"Please login to continue"}
```

You can create an account:

```sh
$ curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" localhost:2300/create-account -d '{ "login":"user@example.com", "password": "secret" }'
{"success":"An email has been sent to you with a link to verify your account"}
```

And you should see the account verification email printed in Sidekiq logs:

```
From: webmaster@localhost
To: bar@example.com
Message-ID: <636e7b1c6c718_10d721478590c3@Jankos-MacBook-Air.local.mail>
Subject: Verify Account
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 7bit

Someone has created an account with this email address.  If you did not create
this account, please ignore this message.  If you created this account, please go to
http://localhost:2300/verify-account?key=1_cuK8jHFMAJgahwWsuQTtaPios7b6Z7-dXVHM6E_x-8Y
to verify the account.
```

Use the verification key from the email link to verify the account:

```sh
curl -X POST -H "Accept: application/json" -H "Content-Type: application/json" localhost:2300/verify-account -d '{ "key": "1_cuK8jHFMAJgahwWsuQTtaPios7b6Z7-dXVHM6E_x-8Y" }'
{"success":"Your account has been verified"}
```

## Tests

First, run the migrations for the test database:

```sh
$ HANAMI_ENV=test bundle exec rake db:migrate
```

Now you can run tests:

```sh
$ bundle exec rspec
```
