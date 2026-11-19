# Treegram

Treegram is a photo-sharing application built with Ruby on Rails. This repository contains the extension developed for the **MYE042 Internet Technologies** course at the University of Ioannina. The course starter provides account registration, sign-in, photo uploads, and user tagging.

## Lab features

- **Photo titles.** Add a title on upload. Titles appear in the gallery.
- **Following and photo feed.** Follow accounts from **All Users**. The gallery shows your photos and photos from the accounts you follow, newest first.
- **Comments.** Comment on photos in the gallery. Authors can delete their own comments, and photo owners can delete comments on their photos.
- **Photo deletion.** Delete your own photos together with their associated comments and tags.
- **Bonus feature.** Use **Unfollow** in **All Users** to stop seeing an account’s photos in your feed.

## Run locally

Use the course virtual machine with Ruby 2.6.6. The lockfile records Rails 4.2.10 and Bundler 1.17.2. The application uses SQLite, Haml, and `kt-paperclip` with ImageMagick for image resizing.

Open a terminal at the repository root. If the gems are missing, install them with `bundle install`. On a fresh checkout without `db/development.sqlite3`, initialize the database with `bundle exec rake db:create db:schema:load`.

```bash
bundle exec rake db:migrate
bundle exec rails server
```

Open [localhost:3000](http://localhost:3000) in your browser.

## Try follow and unfollow

1. Create two local accounts. Upload a photo with a distinctive title using the first account.
2. Sign in with the second account and select **Follow** next to the first account in **All Users**. Refresh your gallery to see the photo.
3. Select **Unfollow** for the first account. The list offers **Follow** again, and the photo disappears from your gallery on refresh.

## Data model

A `Follow` connects two users through `follower_id` and `followed_id`. A `Comment` links its author to a photo. The `Photo` model uses `dependent: :destroy` to remove associated comments and tags when a photo is deleted.

## Credits

Kathryn Carr, J Sivakumaran, and Lizzie Koehler created the original Treegram application. S. Anastasiadis and A. Katsoulieris adapted it for MYE042. The starter README identifies the original project as MIT-licensed.

