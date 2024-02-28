## Description of the problem and solution

The assignment requires to implement an iOS application displaying a list of cat breeds, including an image for each bread. Data is provided by TheCatAPI.

I’ve decided to use SwiftUI to implement the user interface and I adopted a variation of the Clean Architecture design to structure the app. The main modules are:

- the Views, responsible for the user interactions,
- an Interactor, responsible for the business logic and to update the model,
- an API Service, responsible for the networking,
- and the Model, which is observed by the Views.

The code has been written to be simple and easy to mantain but at the same time scalable and easy to extend.
I didn't use third-party libraries, as they were not necessary.

## Prerequisites

- iOS simulator running iOS 15.0 or later.
- Xcode 15.0 or later.
- Swift 5.9

## Implementation details

- The list in the main view adopts infinite scrolling. It loads content continuously as the user scrolls down. The data is fetched in batches of 12 items (as specified in the requirements).

- The new @Observable macro is used for the Model. This means that the property wrapper @ObservedObject is not needed for the property model in the ContentView. The macro will make sure that the view is observing the model for changes.

- I've added Unit Tests for the Interactor only. I usually don't aim to 100% coverage, but rather to cover the most critical functionalities, or the most commonly used ones.

## Trade-offs

- I didn’t include UITest, as I preferred to focus on other aspects of the app in the given amount of time (3 hours).

- The struct Cat assumes that all entries are always available in the API feed, with exception of the Image property which is an optional and can eventually be omitted in the JSON feed.

- The UI is simple: the only adjustments I made are about the layout of the images.

## Possible Improvements

- Improvements to the UI, such as adding navigation to a detail view for each item
- Filtering/Search functionalities for the cats list screen 
- Support for other platforms such as iPad, macOS (it could be alredy working due to swiftUI)
- Offline functionality with NSCache or Core Data
- Languages support
- Improved error handling with more meaningul error descriptions. Right now it's only showing a popup when network errors occur. 
- Integration of analytics and crash report tools
- ...
