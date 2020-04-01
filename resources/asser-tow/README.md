# asser-tow
This is a basic tow script for fivem using chat commands.

The script as is only works using a flatbed. Changeing the flatbed model on your server might break the script as it attaches the vehicle you want to tow to a specific bone on the flatbed.

Please note that if the last vehicle you've used is not the flatbed truck you want to tow something on, then you wont be able to tow, and theres no distance built into the script yet, so it wont know if you are towing a vehicle 100ft away or just 10ft away. Either make it yourself or wait for an update ;)

## Installation:
Clone the project or download the master.

Add pv-tow to resources folder.

Add “start pv-tow” to server.cfg

## Usage:

Drive a ‘flatbed’ - (the script looks for your last driven vehicle, and it needs it to be a flatbed)

Go near a vehicle you want to tow and write /tow in the chat-

Drive around

Exit flatbed and write /tow to detach vehicle again.

## V1.1 - for ES
pv-tow.zip - Did not show error if no vehicle was to tow. Now it does.

## V1.2 - for FX
pv-tow.zip
Changelog: Removed all ES command stuff and used the stringsplit instead since mostly people working with ES would know how to convert it. Also change stringsplit to one working with FX which means that it should be working perfectly. Tested and working on FX

## V1.3 - Githubbed
Project now gitted, all future versions and contributions goes here.
