#!/bin/bash
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then brew update ; fi
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then brew install openssl ; fi
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then ln -s /usr/local/opt/openssl/lib/libcrypto.1.0.0.dylib /usr/local/lib/ ; fi
if [[ "$TRAVIS_OS_NAME" == "osx" ]]; then ln -s /usr/local/opt/openssl/lib/libssl.1.0.0.dylib /usr/local/lib/ ; fi


dotnet --info

export CI_BUILD=True
export STEELTOE_VERSION=1.1.0
if [[ "$TRAVIS_BRANCH" == "master" ]]; then cp config/nuget-master.config ./nuget.config ; fi
if [[ "$TRAVIS_BRANCH" == "dev" ]]; then cp config/nuget-dev.config ./nuget.config ; fi
if [[ "$TRAVIS_TAG" != "" ]]; then cp config/nuget.config ./nuget.config ; fi
if [[ "$TRAVIS_BRANCH" == "master" ]]; then cp config/versions-master.props ./versions.props ; fi
if [[ "$TRAVIS_BRANCH" == "dev" ]]; then cp config/versions-dev.props ./versions.props ; fi
if [[ "$TRAVIS_TAG" != "" ]]; then cp config/versions.props ./versions.props ; fi
