#!/usr/bin/env bash

# Decrypt secret files.
gpg --quiet --batch --yes --decrypt --passphrase=$GPG_PASSWORD \
--output $GITHUB_WORKSPACE/android/app/key.jks $GITHUB_WORKSPACE/android/key.jks.gpg

gpg --quiet --batch --yes --decrypt --passphrase=$GPG_PASSWORD \
--output $GITHUB_WORKSPACE/android/key.properties $GITHUB_WORKSPACE/android/key.properties.gpg
