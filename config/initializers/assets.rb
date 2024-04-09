# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
<<<<<<< HEAD
Rails.application.config.assets.precompile += %w( menus.js )
=======
Rails.application.config.assets.precompile += %w( menus.js )
>>>>>>> 83e0d6d1c78c5d777d3221b642c73b97b0a49e16
