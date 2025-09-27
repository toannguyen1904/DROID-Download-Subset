#!/bin/bash
# Download DROID raw data (with high-resolution videos)
# We will download one video for each lab.
# Usage: ./download.sh

# Check if data directory exists
if [ ! -d "./data" ]; then
    mkdir -p ./data
fi

# Download the data
# Define an array of GCS paths to download
GCS_PATHS=(
    "AUTOLab/success/2023-10-15/Sun_Oct_15_20:17:46_2023"
    "CLVR/success/2023-06-25/Sun_Jun_25_18:54:32_2023"
    "GuptaLab/success/2023-07-09/Sun_Jul__9_19:01:24_2023"
    "ILIAD/success/2023-06-12/Mon_Jun_12_19:45:40_2023"
    "IPRL/success/2024-01-01/Mon_Jan__1_17:58:40_2024"
    "IRIS/success/2023-06-07/Wed_Jun__7_09:45:11_2023"
    "PennPAL/success/2023-08-16/Wed_Aug_16_18:00:46_2023"
    "RAD/success/2023-08-31/Thu_Aug_31_18:26:10_2023"
    "RAIL/success/2023-11-15/Wed_Nov_15_10:57:50_2023"
    "REAL/success/2023-06-10/Sat_Jun_10_14:07:43_2023"
    "RPL/success/2023-04-23/Sun_Apr_23_17:18:41_2023"
    "TRI/success/2024-01-17/Wed_Jan_17_17:28:20_2024"
    "WEIRD/success/2024-01-10/Wed_Jan_10_19:31:10_2024"
)

BASE_GCS="gs://gresearch/robotics/droid_raw/1.0.1"

# Build the full list of GCS URIs
URI_LIST=()
for path in "${GCS_PATHS[@]}"; do
    URI_LIST+=("${BASE_GCS}/${path}/")
done

# Use gsutil -m to copy all at once
gsutil -m cp -r "${URI_LIST[@]}" ./data/