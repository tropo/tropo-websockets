Tropo WebSocket Relay
=====================

A server that will act as a relay between Tropo and an application using WebSockets. This may be used for applications that require low-latency, where HTTP POSTS are too slow, persistent TCP connections between Tropo and their backend applciations.

Installation
============

* git clone git://github.com/tropo/tropo-websockets.git
* bundle install

Running
=======

* ruby tropo-websockets.rb

