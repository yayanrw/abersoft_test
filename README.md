
# Abersoft Flutter Test

The "Abersoft Flutter Test" application is a platform designed to evaluate the technical proficiency of Flutter developers in design implementation and API integration. It offers a range of challenges that assess the developer's ability to translate design concepts into functional Flutter UI components and integrate external APIs seamlessly. With an intuitive interface, code editor, and real-time preview window, developers can showcase their skills in creating visually appealing interfaces and handling API interactions effectively. This platform serves as a valuable tool for selecting competent Flutter developers for projects and job opportunities, ensuring they have the necessary expertise to deliver high-quality Flutter applications.
## Authors

- [@yayanrw](https://www.github.com/yayanrw)


## Acknowledgements

- [GetX State Management](https://pub.dev/packages/get)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [http](https://pub.dev/packages/http)
- [dartz](https://pub.dev/packages/dartz)
- [equatable](https://pub.dev/packages/equatable)
- [flutter_gen](https://pub.dev/packages/flutter_gen)
- [form_validator](https://pub.dev/packages/form_validator)
- [cached_network_image](https://pub.dev/packages/cached_network_image)
- [shimmer](https://pub.dev/packages/shimmer)
- [lottie](https://pub.dev/packages/lottie)
- [image_picker](https://pub.dev/packages/image_picker)
- [permission_handler](https://pub.dev/packages/permission_handler)
- [json_to_model](https://pub.dev/packages/json_to_model)
- [build_runner](https://pub.dev/packages/build_runner)


## Json To Model Generator Implementation
- Create/copy `.json` files into `lib/json/`
- Run the following command<br/>
    ```sh
    flutter pub run json_to_model -s lib/json/ -o lib/app/data/ datasources/
    ```
- Use the generated models in `lib/app/data/datasources/`<br/>

- [JSON To Model Package Docs](https://pub.dev/packages/json_to_model)
## Assets Generator Implementation

- Copy icon/images files into `assets/icons` or `assets/images`...

   ```
   -- assets
     -- icons
       -- an_icon.svg
     -- images
       -- an_image.png
   ```
- Run the following command<br/>

   ```sh
   flutter packages pub run build_runner build
   ```
- Usage:<br/>

   ```dart
   import 'package:mantra_mobile/gen/assets.gen.dart';
   // Display a svg
   Assets.icons.anIcon.svg(),
   // Display an image
   Assets.images.anImage.image()
   ```
- [Flutter Gen Package Docs](https://pub.dev/packages/flutter_gen)