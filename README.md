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

  ![image](https://github.com/user-attachments/assets/00a0573f-931f-436a-ab19-37acd8394c32)


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

  ![image](https://github.com/user-attachments/assets/7354de07-2c64-4790-a50e-a28e36dc4d1d)


# Step 3: Start the Spotify Auth Proxy Using Docker
- Run the Docker Container:
  - Ensure Docker Desktop is running, then execute:
    `docker run --rm -it -p 27228:27228 --env-file ./.env ghcr.io/conradludgate/spotify-auth-proxy` 
- Click the authentication URL generated, agree to Spotify’s terms, and you’ll see “Authorization Successful.” Return to your terminal.
  
  ![image](https://github.com/user-attachments/assets/14037b1d-c856-44fe-b168-f37d3eac171a)

# Step 4: Configure Terraform to Use Your API Key
- Update the provider.tf File:

  `provider "spotify" {
  api_key = var.api_key`
  
![image](https://github.com/user-attachments/assets/7bab811d-8585-4c9e-a6d4-5999859f99bc)


- Create variables.tf File:
  `variable "api_key" {
  type = string
}`
- Create terraform.tfvars File:
  `api_key = "the_generated_api_value"` 
  - Replace "the_generated_api_value" with the API value from the authentication process.
 
    ![image](https://github.com/user-attachments/assets/592f3fda-f78c-4138-bc1a-53fa92303a44)

- Initialize Terraform:
   `terraform init`

  ![image](https://github.com/user-attachments/assets/377419ce-09ab-4ea2-8b01-86f683292538)

# Step 5: Create a Playlist Using Data Sources
- Create playlist.tf File:
  - Use the following configuration to define and manage your Spotify playlists:
    
    `resource "spotify_playlist" "NaijaPraise" {
  name   = "NaijaPraise"
  tracks = ["6PGTBSagHYqLOMbuCjaI6H"]
}`

`data "spotify_search_track" "anendlessocean" {
  artist = "anendlessocean"
  limit  = 10
}`

`resource "spotify_playlist" "ForHeaven" {
  name   = "For Heaven"
  tracks = [
    data.spotify_search_track.anendlessocean.tracks[1].id,
    data.spotify_search_track.anendlessocean.tracks[2].id,
    data.spotify_search_track.anendlessocean.tracks[3].id
  ]
}`
- Review and Apply Changes:
  - Run the following command to review the changes:
    `terraform plan`
  - Apply the changes:
    `terraform apply -auto-approve`
 
    
    ![image](https://github.com/user-attachments/assets/1701d1db-a2f7-4ebf-9307-8672999bc501)


    ![image](https://github.com/user-attachments/assets/eeeb68c5-4239-4a52-ba92-fd8267326acd)

# Conclusion

You’ve now set up Terraform to manage Spotify playlists, showcasing how infrastructure-as-code can extend beyond traditional tasks. With this setup, you can easily automate and manage your Spotify playlists using Terraform.

