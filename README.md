# Flutter Quiz App

## Overview

This is a simple flutter based quiz app that asks user specific questions and rewards them with certain amount of points when answered correctly.

## Prerequisites

- Flutter 

## Getting Started

To use this app all you need is flutter installed in your pc.

### Installation

1. Clone the repository:

     git clone https://github.com/NolanShrestha/Flutter_Task1.git

2. Navigate into the project directory.

3. Start the app using flutter run command.

### Notable Widgets used 

- Stack: The Stack widget is a multi child layout widget that allows you to position widgets on top of each other or partially overlap them. 
    - This widget was used to overlay a CircleAvatar widget on top of a container widget.

- GestureDetector: The GestureDetector widget is used to detect and respond to user gestures such as taps, swipes, drags, double taps, long presses, and more.
    - This widget was used to create a list of options in the app to allow user to tap and select their desired answer.

- LinearProgressIndicator: The LinearProgressIndicator widget in Flutter is used to display progress in a horizontal bar. It is often used to indicate the completion percentage of a task or to show an ongoing process.
    - This widget was used to display the progress of user based and questions answered.

- AlertDialog: An AlertDialog is a widget used to display a pop-up dialog that typically requires user interaction. It is commonly used for showing alerts, confirmations, or simple user prompts.
    - This widget was used to alert the user on completion of said questions, allowing them to restart the quiz again.

- CircleAvatar: The CircleAvatar widget in Flutter is used to create a circular representation of content, often used for profile images or icons.
    - This widget was used to display icon of the quiz app.

- Positioned: The Positioned widget in Flutter is used to position a child widget inside a Stack widget. It allows you to set explicit positions ie top, left, right, bottom for the widget relative to the stack's boundaries.
    - This widget was used to position the CircleAvatar widget within the Container widget.

### Screenshots of the App

- ![SS1.jpg](/task1/ScreenShots/SS1.jpg)

- ![SS2.jpg](/task1/ScreenShots/SS2.jpg)
    
- ![SS3.jpg](/task1/ScreenShots/SS3.jpg)

- ![SS4.jpg](/task1/ScreenShots/SS4.jpg)
