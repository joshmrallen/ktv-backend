![gif](./demo.gif?raw=true)

[See the full demo here!](https://youtu.be/ocYz4YZop-k)

# Wu KTV
# Description
Tired of not being able to easily get lyrics to music videos on youtube? This app ties together multiple API's so that you can learn your favorite songs easily while you enjoy them at the same time.

# How to Use
* Visit the deployed app at: https://dreamy-mahavira-c3d4c6.netlify.app/
    * Sign Up
    * Search for videos.
    * Click on a thumbnail to play the video.
    * If lyrics for the selected video were found, they will appear below the video player.
    * Add video to favorites.
    * Add video by link by pasting its youtube url in the field above the favorites container -- click the button below.
    * Delete from favorites as needed by clicking on the white button in the top right hand corner of each thumbnail.

# API's & Technology:
https://rapidapi.com/canarado/api/canarado-lyrics/endpoints

https://lyricsovh.docs.apiary.io/

YouTube /search and /video API's

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

# Challenges
There are a good number of API's for song lyrics; however, many of them are fairly limited in their offering. The Challenge was to find one robust enough to return song lyrics for a majority of videos on YouTube. We were able to find an API that provided a feature that allowed us standardize the Song Title we obtained from the YouTube video title, which we then fed to another, more robust API for accurate lyrics.

# Backstory
Both collaborators have experience singing in Karaoke places abroad in China. The main different between Karaoke in East Asia and the US is the private room you get with your friends.

In addition, the music selection abroad is much more up to date on the latest pop songs in said country as well as almost every other country in the world.

Assuming it's a copyright issue, we decided to make our version of the Karaoke experience where we could get the songs we enjoy and match them with their lyrics so that they're in one place for us to sing and enjoy in front of our friends and family.


# How to Contribute
Reach out to us about collaborating!

---
---


# Future Implementation
## Grading Feature:
* use webAudio api/library
    * https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API
    * https://css-tricks.com/making-an-audio-waveform-visualizer-with-vanilla-javascript/
* take in youtube audio from output to record and make waveform
* take in user audio from input to record and make waveform
* compare the waveforms and return a percentage
* percentage represents how close the user's waveform is to the youtube audio

## Highlight each lyric line at set intervals

## Party Room
* Have multiple users join the same room
* Either a clone of Zoom or an integration with Zoom
* As a user, you would be able to join the same room as your friends and hear them singing to the same song while watching the same video/lyrics.

## Optional text chat

---


# License
Licensed to WuAllen Creations, LLP.