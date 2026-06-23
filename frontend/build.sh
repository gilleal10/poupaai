#!/bin/bash
echo "Installing Flutter..."
git clone https://github.com/flutter/flutter.git -b stable
export PATH="$PATH:`pwd`/flutter/bin"
echo "Creating web configuration..."
flutter create . --platforms web
echo "Building Flutter Web..."
flutter pub get
flutter build web
