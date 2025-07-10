Objective:
Build a simple mobile app that shows a list of articles fetched from a dummy API, with a detail screen for each article.

What I Have Implemented (As per the given requirements):

List Screen:

Fetched data from: https://jsonplaceholder.typicode.com/posts

Displayed article titles in a scrollable ListView

Showed a loading indicator while data is being fetched

Added pull-to-refresh using RefreshIndicator

Kept the loading screen visible as the API server can be slow

Detail Screen:

Navigated to a detail screen when a list item is tapped

Displayed the full article title and body

Code Structure:

Used a proper folder structure:

models/ for data models

screens/ for UI screens

controllers/ for logic

services/ for API

components/ for reusable widgets

Used Provider for state management

Kept the code clean and readable

Bonus Features:

Added a favorite button to each list item and detail screen

Tracked favorite articles using a Map<int, bool> based on article ID

Created a separate Favorite screen to display liked articles only

Favorites are stored in app state using Provider logic

Challenges Faced:

API Call Timing in initState:

Initially used Provider.of(...).getAllApiData() in initState()

Faced issue where the loading spinner kept showing and no data appeared

Realized initState() runs before the widget tree builds completely, causing context issues

Tried WidgetsBinding.instance.addPostFrameCallback(), still inconsistent

Final solution was Future.delayed(Duration.zero) to ensure UI builds first, then API loads

Favorite Icon Toggling All Items:

Initially used a single boolean to manage favorite state

Tapping one favorite icon affected all items in the list

Solved by using each article’s unique ID and storing favorite states in a Map

Now each item toggles its favorite state independently and updates correctly
