# Bucketlist

This project is part of the 100 Days of SwiftUI journey and focuses on integrating core iOS functionalities such as MapKit, biometric authentication, and secure data handling. With these features, we create a "Bucketlist" app where users can manage places they’d like to visit, including adding custom locations, editing details, and viewing nearby points of interest.

## Key Features

- **Map Integration:**
  - Display locations on a map using annotations.
  - Allow users to switch between map styles (standard and hybrid).
  - Enable users to add new locations by tapping on the map.

- **Biometric Authentication:**
  - Secure access to the app with Face ID or Touch ID.
  - Display error alerts if authentication fails.

- **Data Persistence:**
  - Save and load locations using the device’s documents directory.
  - Ensure secure data storage using `completeFileProtection`.

- **Nearby Places:**
  - Fetch nearby points of interest using Wikipedia’s API.
  - Display information about these places in the app.

## Lessons Learned

This project taught several advanced concepts:

1. **Enhancing Custom Types:**
   - Making types conform to `Comparable` for easier sorting.

2. **File Management:**
   - Accessing and managing the app’s documents directory.

3. **MapKit Essentials:**
   - Adding annotations to maps and configuring map styles dynamically.

4. **Biometric Authentication:**
   - Implementing Face ID or Touch ID with fallback error handling.

5. **View Models:**
   - Separating logic into view models to improve testability and maintainability.

## Challenges and Solutions

1. **Map Mode Switching:**
   - Added a segmented picker to toggle between standard and hybrid map styles.

2. **Error Handling for Authentication:**
   - Displayed alerts for errors encountered during biometric authentication.

3. **View Model for EditView:**
   - Created a dedicated view model for `EditView` to encapsulate logic like nearby places fetching and editing location details.

## Usage Instructions

1. **Unlocking the App:**
   - On launch, authenticate using Face ID or Touch ID to unlock the app.

2. **Adding Locations:**
   - Tap anywhere on the map to add a new location.
   - Long-press on an annotation to edit the location details.

3. **Editing Locations:**
   - Modify the name and description.
   - View nearby points of interest fetched from Wikipedia.

4. **Switching Map Styles:**
   - Use the picker at the bottom to switch between standard and hybrid map modes.

## Code Overview

- **ContentView:** Handles the primary app interface, including map integration, authentication, and mode switching.
- **ContentView.Model:** Manages the locations, authentication logic, and data persistence.
- **EditView:** Allows users to edit location details and view nearby places.
- **EditView.Model:** Encapsulates logic for fetching nearby places and updating location data.
- **Location:** A Codable and Equatable model representing a place.
- **Result:** Models the response structure from Wikipedia’s API.

## Future Improvements

- Add support for custom map annotations to improve user experience.
- Enhance the authentication process with additional security features.
- Localize the app for broader accessibility.

## Credits

Inspired by Hacking with Swift's 100 Days of SwiftUI. Thank you, Paul Hudson, for providing detailed and engaging tutorials!

---

**Quote for Inspiration:**
“Unless you try to do something beyond what you have already mastered, you will never grow.” – Ralph Waldo Emerson
