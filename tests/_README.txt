Mark Gants
18 June 2012

The project is configured to run unit tests with each build.
However, you need to make a small modification to your xcode (4.3.3) setup
to make this work correctly.

Follow the directions here to modify the RunPlatformUnitTests script for the iPhone simulator.
http://longweekendmobile.com/2011/04/17/xcode4-running-application-tests-from-the-command-line-in-ios/

Remember, the script is now located in:

	/Applications/XCode.app/Contents/Developer...

Hopefully this glitch will be fixed in the next version of XCode.

Also documented instructions here:

    https://sites.google.com/a/playfirst.com/docs/engineering/engineering-how-to-guides#TOC-How-to-Run-Unit-Tests-After-Building-in-XCode-v-4.3.3-
