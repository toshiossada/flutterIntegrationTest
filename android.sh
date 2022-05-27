flutter clean
flutter pub get

pushd android
# flutter build generates files in android/ for building the app
flutter build apk
./gradlew app:assembleAndroidTest
./gradlew app:assembleDebug -Ptarget=integration_test/app_test.dart
popd



gcloud firebase test android run --type instrumentation \
--app build/app/outputs/apk/debug/app-debug.apk \
--test build/app/outputs/apk/androidTest/debug/app-debug-androidTest.apk \
--device-ids=Pixel2 \
--os-version-ids=29 \
--results-bucket=gs://toshiossada-c388e.appspot.com \
--results-dir=tests/firebase