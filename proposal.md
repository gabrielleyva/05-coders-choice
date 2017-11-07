Name: __Gabriel Leyva__           ID:   _44683422_

## Proposed Project

  My application will allow users to share if they are going out at night. It will also let users recieve notifications if
  other users are going out. I will be using an iOS as my UI. The application is simple, anyone who has the app is able to share if they
  are going out that night with a push of a button and recieve notifications from other users who are going out. When a user opens the app   he or she will able to enter a username 

## Outline Structure

My project will be organaized the following way:
Mobile App:
-MVC Architecture
-Swift Elixir Phoenix Client: https://github.com/davidstump/SwiftPhoenixClient (Kinda like web sockets)

Elixir Application:
-API
-Server
-Implemenation

Everytime one of the apps is fired up a process will be created to represent that particular user.
I will use a supervisor with the restart strategy transient because I want the process to restart only if
it terminates abnormally since this application can be considered to be a communication app. 




> replace all the ">" lines with your content, then push this to
> github and issue a merge request.
