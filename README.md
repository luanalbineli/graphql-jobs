# GraphQL Job List

This is a small Flutter application, developed to consume the public GraphQL API that list GraphQL related jobs around the world: [https://graphql.jobs/](https://graphql.jobs/)


## Main features

 - Job list screen;
 - Job detail screen;
 - Option to save jobs for later (under development);
 - Saved jobs list screen (under development);

## Principles and architecture
- SOLID
- Clean Architecture

## Libs
- **auto_route**: build a layer over the native routing system. It makes things easier and safer to transfer data between screens, with the auto generated code.
- **cached_network_image**: cache in-memory/disk network images. In-memory in this case.
- **flutter_bloc**: state management. IMO similar to Redux.
- **flutter_localizations** and **intl**: project internationalization.
- **get_it** + **injectable**: the best combo for DI.
- **graphql_flutter**: Client for GraphQL API calls.
- **json_annotation**: from/to JSON code generation.
- **shimmer**: used to create the shimmer loading effect.
- **timeago**: useful library, to write in a more humanized way a past date
- **url_launcher**: useful library, to open websites or e-mails using a url.

## Run the project
The code was shipped with the generated files (`**.g.dart` files), but if you want to make changes and rebuild the generated files, you need to run one of the following commands in the terminal (on the root folder):

- `flutter pub run build_runner build` (this will rebuild the generated files a single time).
- `flutter pub run build_runner watch` (this will keep watching and rebuilding your files).
