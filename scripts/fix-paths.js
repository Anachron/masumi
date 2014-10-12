var path = null;

var _fixPaths = function( mimosaConfig, options, next ) {
  // Check if there are any input files
  var files = options.files;
  var hasFiles = files && Object.keys(files).length > 0;

  // Check if there are any fixes available
  var fixes = mimosaConfig.pathFix.files;
  var hasFixes = fixes && Object.keys(fixes).length > 0;

  // If not having input or fix, return
  if (!hasFiles || !hasFixes) {
    return next();
  }

  path = require( 'path' );

  // Check all files
  files.forEach( function(file, i) {

    var filePath = path.normalize( file.inputFileName );
    var fileData = file.inputFileText;

    // If there is a fix for the file
    if ( fixes.hasOwnProperty( filePath ) ) {
      mimosaConfig.log.info( 'Fixing asset [[ ' + filePath + ' ]]' );

      // ... iterate through all fixes
      for ( fileFix in fixes[filePath] ) {
        // ... and replace the paths
        fileData = fileData.replace (
          _fixRegExp( fileFix ),
          fixes[filePath][fileFix]
        );
      }
      // ... and replace the file data
      file.outputFileText = fileData;
    }

    // if at the end, invoke the next workflow step
    if (i === files.length - 1) {
      return next();
    }
  });
};

var _fixRegExp = function( string ) {
  return new RegExp( string.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, "\\$1" ), 'g' );
}

exports.registration = function( mimosaConfig, register ) {

  path = require ( 'path' );

  // Overwrite all variables in path with their correct paths
  for ( var file in mimosaConfig.pathFix.files ) {
    var value = mimosaConfig.pathFix.files[file];
    delete mimosaConfig.pathFix.files[file];
    var newPath = path.normalize(file
      .replace( '$sourceDir$', mimosaConfig.watch.sourceDir )
      .replace( '$cssVendor$', mimosaConfig.vendor.stylesheets )
      .replace( '$jsVendor$', mimosaConfig.vendor.javascripts )
    );
    mimosaConfig.pathFix.files[ newPath ] = value;
  }

  // If enabled, register into workflow
  if ( mimosaConfig.pathFix.enabled ) {
    register( ['add', 'update', 'buildFile'], 'beforeWrite', _fixPaths, mimosaConfig.pathFix.extensions );
  }
};
