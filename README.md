# Project 4 - *MooMe*

**MooMe** is a basic twitter app to read and compose tweets the [Twitter API](https://apps.twitter.com/).

Time spent: **20** hours spent in total

## User Stories

The following **required** functionality is completed:

- [x] User sees app icon in home screen and styled launch screen
- [x] User can sign in using OAuth login flow
- [x] User can Logout
- [x] User can view last 20 tweets from their home timeline
- [x] In the home timeline, user can view tweet with the user profile picture, username, tweet text, and timestamp.
- [x] User can pull to refresh.
- [x] User can tap the retweet and favorite buttons in a tweet cell to retweet and/or favorite a tweet.
- [x] User can compose a new tweet by tapping on a compose button.
- [x] Using AutoLayout, the Tweet cell should adjust it's layout for iPhone 7, Plus and SE device sizes as well as accommodate device rotation.
- [x] The current signed in user will be persisted across restarts

The following **optional** features are implemented:

- [x] Tweet Details Page: User can tap on a tweet to view it, with controls to retweet, favorite, and reply.
- [x] User can view their profile in a profile tab
- [ ] User should display the relative timestamp for each tweet "8m", "7h"
- [ ] User should be able to unretweet and unfavorite and should decrement the retweet and favorite count.
- [ ] Links in tweets are clickable
- [ ] User can tap the profile image in any tweet to see another user's profile
- [x] Contains the user header view: picture and tagline
- [x] Contains a section with the user's basic stats: # tweets, # following, # followers
- [x] Profile view should include that user's timeline
- [ ] User can load more tweets once they reach the bottom of the feed using infinite loading similar to the actual Twitter client.
- [x] When composing, you should have a countdown in the upper right for the tweet limit.
- [ ] After creating a new tweet, a user should be able to view it in the timeline immediately without refetching the timeline from the network.
- [ ] User can reply to any tweet, and replies should be prefixed with the username and the reply_id should be set when posting the tweet
- [x] Profile view should include that user's timeline
- [ ] Pulling down the profile page should blur and resize the header image.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1.
2.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/cr9CTQw.gif' title='Launch & Logout' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/p5yXbcv.gif' title='Timeline, Pull to refresh & Details' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/iP5DU6H.gif' title='Favorites, retweets and compose' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/v55r6rs.gif' title='Profile' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/CSLY9GK.gif' title='iPhone 7 landscape view' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/Z0UU6bL.gif' title='iPhone SE portrait view' width='' alt='Video Walkthrough' />
<img src='http://i.imgur.com/bL41Uob.gif' title='iPhone SE landscape view' width='' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

My major problem during the development of this assigment was in the persisting user milstone. This proved to be easy to solve by simply drawing a parallel between the Parse Server user used in the Instagram assingment and the current user in this app.

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library
- [TwitterAPI] (https://apps.twitter.com) - Twitter API

## License

Copyright [2017] [Gabriel Muñiz Negrón]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
