#!/bin/bash

# Update Kubernetes Deployment YAML with the new image tag
sed -i "s|image: $ECR_REPO_URI:.*|image: $ECR_REPO_URI:$BUILD_TAG|" Kubernetes/Deployment.yml

# Configure Git credentials
git config --global user.email "jenkins@example.com"
git config --global user.name "jenkins"

# Set the remote URL with the GitHub username and PAT for authentication
git remote set-url origin https://$GIT_USER:$GIT_TOKEN@github.com/Itzmesahil/django-notes-app.git

# Add changes to git
git add Kubernetes/Deployment.yml

# Commit changes
git commit -m "Update Kubernetes deployment with new image tag $BUILD_TAG"

# Push changes to GitHub
git push origin uat
