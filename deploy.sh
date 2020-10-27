#!/bin/bash

# make project id
PROJECT_ID=project_id

# gcloud auth login your_account_name
gcloud config set project $PROJECT_ID

gcloud services enable run.googleapis.com      # Cloud Run API
gcloud services enable cloudkms.googleapis.com # Cloud KMS API

gcloud config set run/region us-west1

# Create a key ring where to hook your encrypted keys
gcloud kms keyrings create dinner --location=us-west1

# Do the same with the Rails master key file
gcloud kms keys create rails_master_key --location us-west1 \
    --keyring dinner --purpose encryption
gcloud kms encrypt --location us-west1 --keyring dinner \
    --key rails_master_key --plaintext-file ./config/master.key \
    --ciphertext-file ./config/master.key.enc

# find the name of the Cloud Build service account that is automatically created by GCP,
# set an env variable to make things more readable
CB_SVC_ACCOUNT=xxx...xxx@cloudbuild.gserviceaccount.com

# Grant Cloud Build the right to decrypt Rails master key
gcloud kms keys add-iam-policy-binding rails_master_key --location=us-west1 \
    --keyring=dinner --member=serviceAccount:$CB_SVC_ACCOUNT \
    --role=roles/cloudkms.cryptoKeyDecrypter

# build container
gcloud builds submit --config cloudbuild.yaml

# Deploy the latest container images we just built
gcloud beta run deploy app --image gcr.io/$PROJECT_ID/app \
    --region us-west1 --allow-unauthenticated
