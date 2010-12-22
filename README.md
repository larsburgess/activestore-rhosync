activestore-rhosync
===================

This is a sample application demonstrating how to build a source adapter using [ActiveResource](http://api.rubyonrails.org/classes/ActiveResource/Base.html)

Running
-------
1. Make sure you have rails 3.0.0+ installed
	
	$ gem install rails

2. Start redis
	
	$ rake redis:start

3. Run the specs to make sure you're setup
 	
	$ rake rhosync:spec

4. Start the server
	
	$ rake rhosync:start
	
5. Connect your rhodes app