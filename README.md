# Pre-work - *Tipulator*

**The Tipulator** is a tip calculator application for iOS.

Submitted by: **Chloe Langston**

Time spent: **12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] Settings page to change the default tip percentage.

The following **optional** features are implemented:

* [X] UI animations
* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

- [X] User is able to convert bill/tip to 4 different foreign currencies within app.
- [X] There are 2 different color themes that can be set in the Settings page.

## Tipulator Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img width="300px" src='http://i.imgur.com/K2Par9X.gif' title='Tipulator Video Walkthrough' width='' alt='Video Walkthrough' />



## Project Analysis

As part of your pre-work submission, please reflect on the app and answer the following questions below:

**Question 1**: "What are your reactions to the iOS app development platform so far? How would you describe outlets and actions to another developer? Bonus: any idea how they are being implemented under the hood? (It might give you some ideas if you right-click on the Storyboard and click Open As->Source Code")

**Answer:** Coming from a web development background, my main reaction to iOS is how compact and visual it can be.  So far, it seems like a lot can be done within just a few files.  Coming also from a design field, I love the storyboarding aspect.  Designing in a visual UI and then adjusting/transitioning/animating programmatically is my ideal platform and physically dragging the connection between the UI elements to the functions and variables is a very clear user experience to me.  Outlets and actions are like variables and functions that have built in styling and event listeners.  This makes developing on them extemely simple and require less code.  Examining the storyboard code under the hood looks like iOS-specific HMTL with built in tags, elements, attributes and IDs creating a pre-defined mobile experience without a developer needing to specifically writ it.

Question 2: "Swift uses [Automatic Reference Counting](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AutomaticReferenceCounting.html#//apple_ref/doc/uid/TP40014097-CH20-ID49) (ARC), which is not a garbage collector, to manage memory. Can you explain how you can get a strong reference cycle for closures? (There's a section explaining this concept in the link, how would you summarize as simply as possible?)"

**Answer:** Strong reference cycles occur when instances of a class hold strong references to each other.  This will cause these instances to always remain "active" and never be deallocated, always remaining stored in memory.  With closures being reference types and by default, capturing references as strong, they'll often cause strong reference cycles or retention cycles by having a strong reference to their outer class.  This can be solved by specifically declaring them as weak or unnowned.

## License

    Copyright 2017 Chloe Langston

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.