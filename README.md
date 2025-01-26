<!-- # movie_browsing

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference. -->
1. Clone the Repository:
        git clone https://github.com/MahnoorWaheed/movie-browsing.git
        cd movie-browsing
2. Install Dependencies:
        flutter pub get
3. Run the App:
        flutter run

4. Testing Functionalities:

        i. Initial Movie Fetch: Once the app starts, it should automatically fetch the first page of movies from the API.
            •	The movies will be displayed in a grid format.
            •	You should see a loading spinner until the movies are loaded.
        ii. Error Handling:
            •	If there is an issue fetching the movies (e.g., network failure), an error message should be displayed.
        Testing Movie details Functionality:
            •	Navigate to the list of movies.
            •	Select a movie to open its detail page.
        Expected Result:
            •	Details of selected movie (title, image, description, release date, overview, ratings) are displayed correctly.
        Testing the Search Functionality:
            i. Search Bar:
                •	At the top of the screen, there is a search bar.
                •	Type a movie name in the search bar and hit search (you can trigger it manually or with the return key).
            ii. Search Results:
                •	The app should show movies related to the search query.
                •	If no movies are found, you should see a message indicating that no results were found.

            Testing Favorites:
            Note: In this app the authentication is not implemented so I’ve saved all favorite movies globally for every app user in the favorite collection.
            i.  Loading Favorites:
                •	On app startup, the app should load any previously favorited movies.
            ii. Mark a Movie as Favorite:
                •	You can tap on a movie to mark it as a favorite.
                •	Verify that the movie gets added to the favorites list (ensure that it's stored in a Firebase).
            iii. Removing from Favorites:
                •	Tap on a favorited movie again to remove it from the favorites list.

            Testing Dark Mode/Light Mode Functionality:
                Navigate to the Settings Screen:
                •	Open the app.
                •	Go to the Settings screen where the dark mode/light mode toggle is implemented.
            Toggle Between Modes:
                •  Turn ON the dark mode by toggling the switch. Observe that:
                •	The app's theme changes to dark mode.
                •	Backgrounds, text, and UI elements adjust for optimal visibility in dark mode.
                •  Turn OFF the dark mode to return to light mode. Observe that:
                •	The app's theme changes to light mode.
                •	Backgrounds, text, and UI elements adjust for optimal visibility in light mode.
            Verify State Persistence:
                •	Exit the app and reopen it to verify that the selected mode (dark or light) persists.

