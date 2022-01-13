# Pre-work - Tip Calculator Application for iOS

Submitted by: Gyandeep Reddy Vulupala

Time spent: 8 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [ ] UI animations
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [x] List anything else that you can get done to improve the app functionality!
- [x] Added a settings screen which allows the user to set default tips and choose default tip percentage.
- [x] Added light/dark color theme in the settings view.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='./tip_calculator.gif' width="250" height="500" title='Video Walkthrough' alt='Video Walkthrough' />

GIF created with [Imgur](https://imgur.com/vidgif).

## Notes

Describe any challenges encountered while building the app.
- It was challenging to access the NSDate before app restart, but I realized that I can access it as a UserDefaults object. 
- I had difficulty embedding the gif file into README file. The solution I adopted was to include the .gif file inside this
repository and then refer to it in this README.


## License

    Copyright [yyyy] [name of copyright owner]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
