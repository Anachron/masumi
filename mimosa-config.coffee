exports.config = {

  modules: [
    'adhoc-module',   # Adhoc scripts, for example Bower fixing
    'bower',          # Manage dependencies with Bower.io
    'coffeescript',   # Allow converting of CoffeeScript
    'copy',           # Use the copy module for misc files
    'csslint',        # Lint CSS and find mistakes/unclean styles
    'jshint',         # Lint JS and find mistakes/unclean code
    'less',           # Compile LESS-Styles to CSS
    'live-reload',    # Reload changes from editor directly in browser
    'minify-js',      # Minify JavaScript, if wanted
    'minify-css',     # Minify Stylesheets, if wanted
    'require',        # Use the Require-Plugin, needed for Handlebars and CSS-Require
    'server',         # Use the Server-Plugin, used with ExpressJS
    'server-reload'   # Reload the server if Server-Files change
  ]

  # Tell Mimosa server where the new server views are stored.
  server:
    views:
      path: 'server/views'

  # This will reload the server if any view inside server/views will be changed.
  liveReload:
    additionalDirs: [
      'server/views'
    ]

  # This will tell Bower how to handle specific packages, some may not have
  # a main entry in their bower.json or multiple files. To override the important
  # files that bower should take, this settings are used.
  bower:
    copy:
      mainOverrides:
        'handlebars.js': [
          'dist/handlebars',
          'handlebars.js'
        ]
        'require-hbs': [
          'hbs-builder.js',
          'hbs.js'
        ]
        'semantic': [
          'build/packaged/definitions/css/semantic.css',
          'build/packaged/definitions/javascript/semantic.js',
          'build/packaged/themes/packages/default/assets/fonts': '../../fonts/vendor/semantic',
          'build/packaged/themes/packages/default/assets/images': '../../images/vendor/semantic'
        ]

  # Adhoc module allows us to execute local project/skeleton based scripts
  # Easily without making them a module. They got injected into the Workflow automatically.
  adhocModule:
    modules: [
      require ( './scripts/fix-paths' )
    ]

  # Notice the added 'hbs', this tells Mimosa to ignore Handlebars-Files and just copy them to public.
  # This way we can require them later with require-hbs
  copy:
    extensions: [
      "js","css","png","jpg","jpeg","gif","html","eot","svg","ttf","woff",
      "otf","yaml","kml","ico","htc","htm","json","txt","xml","xsd","map",
      "md","mp4", "hbs"
  ]

  # Path fixing
  pathFix:
    enabled: true
    extensions: ['css']
    files:
      "$cssVendor$/semantic/semantic.css":
        "../../themes/packages/default/assets/fonts": "/fonts/vendor/semantic",
        "../../themes/packages/default/assets/images": "/images/vendor/semantic"

}
