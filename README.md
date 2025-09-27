# Step 1: Create CONDA environment
```bash
conda create -n droid python=3.10
```

# Step 2: Install gsutil
```bash
conda install conda-forge::gsutil
```

# Step 3: Download DROID raw data (with high-resolution videos)
We will download one video for each lab.
```bash
chmod +x download.sh
./download.sh
```

You can explore more data following this command:
```bash
gsutil ls gs://gresearch/robotics/droid_raw/1.0.1/
```