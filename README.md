# CatBreeds Aplication

## Features

<ol>
  <li>Full clean architecture divided into features</li>
  <li>Common Widgets fully documented</li>
  <li>Responsive and font size management</li>
  <li>Sentry implemented to catch potential errors</li>
</ol>

## Steps to Set Up the App
1. Clone the project using Flutter 3.24.3 - Java 17
2. Run ```pub get``` to load the dependencies
3. Change the Sentry URL
4. To generate the release for Android, use (Make sure to modify the versionCode and versionName)
```flutter build appbundle --target-platform android-arm,android-arm64,android-x64```
5. To generate the release for iOS, use the following command and then run 'Archive' in XCode (Modify the versionCode and versionName).
```flutter build ios --release```


## Possible improves
1. Skeleton loading effects
2. Responsive for table size screens
3. Implement Flavors
4. Security: Obfuscation, protection agains root devices, SSL pinning, and others.
5. Analytics to collect usage information

