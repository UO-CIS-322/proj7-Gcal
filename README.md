# proj6-Gcal
Snarf appointment data from a selection of a user's Google calendars 

## What is here

I've provided code for the authorization (oauth2) protocol for Google
calendars.  There is also a picker for a date range. 

## What you'll add

You'll need to read the Google developer documentation to learn how to
obtain information from the Google Calendar service.

Your application should allow the user to choose calendars (a single
user may have several Google calendars, one of which is the 'primary'
calendar) and list 'blocking'  (non-transparent)
appointments between a start date and an end date
for some subset of them.

## Hints

You'll need a 'client secret' file of your own.  It should *not* be
under GIT control.  This is kind of a
developer key, which you need to obtain from Google.  See
https://auth0.com/docs/connections/social/google and
https://developers.google.com/identity/protocols/OAuth2 .
The applicable scenario for us is 'Web server applications'  (since
we're doing this in Flask). 

Whether or not you already have a Google calendar, it's a good idea to
create one or two 'test' calendars with a known set of appointments
for testing.



