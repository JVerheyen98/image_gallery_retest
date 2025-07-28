# README

# Image Gallery App

A Ruby on Rails application for managing and displaying image galleries. Users can upload photos, view galleries, and (optionally) edit images with cropping and resizing features.

## Features

- User authentication
- Create, edit, and delete galleries
- Upload photos with captions
- Thumbnail previews and full-size views
- (work in progress...) Basic image editing (crop & resize)
- Dockerized for easy setup and deployment

## Requirements

- Docker and Docker Compose installed
- Ruby '3.2.8' 
- SQLite 

## Getting Started

Build and run with Docker
  In command line Run:
    docker-compose build
    docker-compose up
    
  The app will be available at http://localhost:3000

Setup Database (if needed)

If you’re not using Docker for database, setup and migrate as usual:

rails db:create db:migrate

   The app will be available at http://localhost:3000

### How to Use.

Register an account or sign in

Create galleries and add photos

Edit/delete galleries and photos if you are the owner


