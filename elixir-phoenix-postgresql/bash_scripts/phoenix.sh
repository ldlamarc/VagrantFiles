#!/bin/bash

PHOENIX_VERSION=1.0.3

yes Y | mix local.hex >/dev/null 2>&1
yes Y | mix archive.install https://github.com/phoenixframework/phoenix/releases/download/v$PHOENIX_VERSION/phoenix_new-$PHOENIX_VERSION.ez >/dev/null 2>&1
