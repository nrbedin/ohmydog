ifeq (run-flavor,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (clean-run-flavor,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-apk,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-apk-flavor,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-appbundle,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-ios,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (module,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (module-b,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY=help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

###
# Run section
###
install-slidy: ## Install and activate slidy to flutter
	dart pub global activate slidy
module: ## Create new module to  flutter modular
	slidy generate module modules/${RUN_ARGS} --complete
module-b: ## Create new module basic to  flutter modular
	slidy generate module modules/${RUN_ARGS}
clean: ## Clean our project build tmp files
	fvm flutter clean && fvm flutter pub get
clean-run-flavor: ## Clean our project build tmp files
	fvm flutter clean
	fvm flutter pub get
	fvm flutter run --flavor $(RUN_ARGS) -t lib/main_$(RUN_ARGS).dart
run: ## Run any app with flavor name. e.g. make run base
	fvm flutter run --release
xcode: ## Open xcode project
	open -a Xcode.app ios/
gitForce: ## Force git push
	git add .
	git commit --amend --no-edit
	git push -f
device: ## Open device on computer
	scrcpy
device-ip: ## Connect device with ip
	scrcpy --tcpip=192.168.0.6:6666
device-disconnect: ## Disconnect device with adb
	adb disconnect
device-connect: ## Connect device to adb
	adb connect 192.168.0.73:5555
device-update-apk: ## Update apk
	fvm flutter packages pub run build_runner build --delete-conflicting-outputs
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build apk --release
	adb connect 192.168.0.6:6666
	adb shell pm uninstall -k --user 0 com.accesys.mercadito.acc_checkout
	adb install -r ./build/app/outputs/flutter-apk/app-mercadito-release.apk
	adb disconnect
active-adb: ## Active adm mode in device
	adb tcpip 5555
run-ios: ## Open xcode from build run
	open ios/Runner.xcworkspace
buildAndInstall:
	make build-apk-flavor dev
	adb shell am force-stop com.accesys.acc_checkout
	adb install -r ./build/app/outputs/flutter-apk/app-dev-release.apk
	adb shell am start -n com.accesys.acc_checkout/.MainActivity

###
# Build section
###
mobx: ## BuildRunner mobx
	fvm dart run build_runner build --delete-conflicting-outputs 
build-apk: ## Build an APK of any app with flavor name. e.g. make build base
	fvm flutter clean 
	fvm flutter pub get
	fvm flutter build apk --release --flavor dev -t lib/main_dev.dart
build-appbundle: ## Build an APK of any app with flavor name. e.g. make build base
	fvm flutter build appbundle --flavor ${RUN_ARGS} -t lib/main_${RUN_ARGS}.dart
build-ios: ## Build an APK of any app with flavor name. e.g. make build base
	fvm flutter build ios --release
install-custom-flavors: ## Run the base command for flutter_flavorizr. Be careful: IT WILL OVERRIDE SOME FILES
	fvm flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,flutter:flavors,assets:clean,ide:config
	sed -i.bak '/class F {/,$d' lib/flavors.dart
	rm lib/flavors.dart.bak
run-flavor: ## Run any app with flavor name. e.g. make run base
	fvm flutter run --flavor $(RUN_ARGS) -t lib/main_$(RUN_ARGS).dart
build-apk-flavor: ## Build an APK of any app with flavor name. e.g. make build base
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build apk --release --flavor ${RUN_ARGS} -t lib/main_${RUN_ARGS}.dart
build-install: ## Build and install adb
	fvm flutter clean
	fvm flutter pub get
	fvm flutter build apk --flavor dev -t lib/main_dev.dart
	adb install -r ./build/app/outputs/flutter-apk/app-dev-release.apk

###
# Dependencies section
###
dependencies: ## Install all dependencies

	fvm flutter pub get


###
# Tests section
###
test: ## Run all tests
	fvm flutter test