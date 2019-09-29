#!/bin/bash
set -ex

dtd2mysql --fares $ZIP_FILE
dtd2mysql --fares-clean
