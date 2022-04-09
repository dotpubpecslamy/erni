# flutter_tech_exam

A new Flutter project.

## Tasks

We have a backend GET endpoint https://gist.githubusercontent.com/erni-ph-mobile-team/c5b401c4fad718da9038669250baff06/raw/7e390e8aa3f7da4c35b65b493fcbfea3da55eac9/test.json.

### Required
- Check internet connectivity and get the list from the endpoint.
- Remove any duplicates from the returned list.
- Show the list of users using `ListView`.
- When a list item is tapped, navigate to `UserDetailsView` and show the avatar image and name.

### Optional
- Add unit 

Once finished, commit this to your own public repository in GitHub (or other sites) and reply to the one that gave the exam with the link to that repository.
  

## Important notes:

The project uses `build_runner` to generate code. Run the following command before running the project:


```
flutter packages pub run build_runner build --delete-conflicting-outputs
```