#!/usr/bin/env bash
set -e

DATASET="retailrocket/ecommerce-dataset"
FILE="events.csv"
TARGET_DIR="data"
DEST="$TARGET_DIR/$FILE"

mkdir -p "$TARGET_DIR"

if [ -f "$DEST" ]; then
  echo "✔ $DEST already exists – skip download"
  exit 0
fi

echo "⬇ downloading $FILE (~330 MB) from Kaggle..."
# Requires kaggle.json in ~/.kaggle
kaggle datasets download -d $DATASET -f $FILE -p "$TARGET_DIR" --quiet

echo "✔ saved to $DEST"
