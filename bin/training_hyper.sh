#!/bin/sh

BUCKET=ml-in-prod1-dig

gcloud ai-platform jobs submit training mnist_iht_ht_`date +"%s"` \
  --python-version 3.7 \
  --runtime-version 2.3 \
  --scale-tier BASIC \
  --package-path ./trainer \
  --module-name trainer.task \
  --region europe-west1 \
  --job-dir gs://$BUCKET/tmp \
  --config ./bin/hyper.yaml \
  -- \
  --hypertune