# Bookly

Bookly is a Flutter app for browsing books from the Google Books API. It uses a clean architecture structure and provides three main screens: Home, Search, and Book Details. The app also opens with a short animated Splash screen.

## Features

- Browse featured and additional book lists on the Home screen.
- Open a book to view its cover, title, and author, along with rating and book-action controls.
- Browse book covers in the similar-books section.
- View a book list on the Search screen.
- Show loading and error states while book data is being fetched.
- Cache fetched books locally with Hive and use cached data when available.
- Navigate between screens with GoRouter.

> **Current search behavior:** The Search screen has a search field and displays books, but filtering by the entered query is not implemented yet.

## Screens

1. **Home** — Displays book collections and provides access to Search.
2. **Search** — Shows the search field and a list of books.
3. **Book Details** — Shows the selected book's information and a similar-books cover section.

The **Splash** screen is the app's animated entry screen; it navigates to Home automatically.

## Screenshots

| Splash | Home | Search | Book Details |
|---|---|---|---|
| ![Splash screen](screenshots/splash.png) | ![Home screen](screenshots/home.png) | ![Search screen](screenshots/search.png) | ![Book Details screen](screenshots/book-details.png) |

## Tech Stack

- **Flutter / Dart** — App framework and language.
- **flutter_bloc** — Cubit and BlocBuilder/BlocConsumer state management.
- **go_router** — App navigation and passing the selected book to its details page.
- **Dio** — HTTP requests to the Google Books API.
- **Hive / hive_flutter** — Local book caching.
- **get_it** — Dependency registration.
- **dartz** — Result handling in the repository layer.
- **cached_network_image** — Loading book covers from the network.
- **google_fonts** and **font_awesome_flutter** — Typography and icons.
- **GT Sectra Fine** — Custom bundled font for book titles.

## Project Structure

```text
lib/
  core/       Shared utilities, widgets, errors, and service setup
  features/
    home/
      data/         API/local data sources, models, and repository
      domain/       Book entity, repository contract, and use cases
      presentation/ Screens, widgets, and Cubits
    search/         Search screen and result widgets
    splash/         Splash screen and animation
```

The Home feature follows the **Data → Domain → Presentation** layers. The repository coordinates remote and local data sources, while Cubits expose loading, success, and failure states to the UI.

## Requirements

- Flutter SDK with Dart **3.12.2** or later, as specified in `pubspec.yaml`.
- A Google Books API key.

## Setup and Run

1. Install the project dependencies:

   ```bash
   flutter pub get
   ```

2. Run the app with your Google Books API key:

   ```bash
   flutter run --dart-define=BOOKS_API_KEY=YOUR_GOOGLE_BOOKS_API_KEY
   ```

The API key is read from the `BOOKS_API_KEY` compile-time environment variable. Keep your key private; do not commit it to the repository.

## Tests

Run the Flutter tests with:

```bash
flutter test
```
