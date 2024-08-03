# Spotify-Playlist

Automate the creation and management of Spotify playlists using Terraform

# Project Overview
This project demonstrates how to use Terraform to manage and automate Spotify playlists. By leveraging the power of Terraform and Docker, we can create and manage Spotify playlists programmatically.


#  Prerequisites

1. Install Terraform
2. Install Docker
3. Create a Spotify account
4. Create a Spotify Developer account
5. Use Visual Studio Code for editing


# Step 1: Configuring the Spotify Provider

- Create the provider.tf File:

  In Visual Studio Code, create a file named provider.tf to define Spotify as your provider.
  Search for "Spotify" on Terraform’s registry by "conradludgate."
  Copy the provided code from the provider’s page and paste it into your provider.tf file.

# Step 2: Set Up Your Spotify App

- Obtain API Credentials:
    - Create a Spotify account if you don’t have one.
    - Go to the Spotify Developer Dashboard, click “Create a New App,” and fill in:
      - Name: My Playlist through Terraform
      - Description: Create multiple Spotify playlists using Terraform
      - URL: http://localhost:27228/spotify_callback
    - Click “I Understand” and “Save” to create the app. Note down your Client ID and Client Secret.
. Create a .env File:
- In Visual Studio Code, create a .env file and paste the credentials:
  SPOTIFY_CLIENT_ID=<your_client_id>
  SPOTIFY_CLIENT_SECRET=<your_client_secret>

# Step 3: Start the Spotify Auth Proxy Using Docker
- Run the Docker Container:
  - Ensure Docker Desktop is running, then execute:
    `docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy` 
- Click the authentication URL generated, agree to Spotify’s terms, and you’ll see “Authorization Successful.” Return to your terminal.
  
# Step 4: Configure Terraform to Use Your API Key
- Update the provider.tf File:

  `provider "spotify" {
  api_key = var.api_key
}`
- Create variables.tf File:
  `variable "api_key" {
  type = string
}`
